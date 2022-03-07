Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 7 Mar 2022 14:23:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiYHUju3mA6wNTGr@kamilkon-DESK1>
References: <20220307082643.380066-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220307082643.380066-1-janusz.krzysztofik@linux.intel.com>
Subject: Re: [igt-dev] [PATCH v3 i-g-t] lib/intel_mmio: Fix mmapped
 resources not unmapped on fini
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janusz,

Dnia 2022-03-07 at 09:26:43 +0100, Janusz Krzysztofik napisał(a):
> Commit 5f3cfa485eb4 ("lib: Use safe wrappers around libpciaccess
> initialization functions") took care of not leaking memory allocated by
> pci_system_init() but didn't take care of users potentially attempting to
> reinitialize global data maintained by libpciaccess.  For example,
> intel_register_access_init() mmaps device's PCI BAR0 resource with
> pci_device_map_range() but intel_register_access_fini() doesn't unmap it
> and next call to intel_register_access_init() fails on attempt to mmap it
> again.
> 
> Fix it, and also provide intel_mmio_unmap_*() counterparts to public
> functions intel_mmio_use_pci_bar() and intel_mmio_use_dump_file().
> 
> v2: apply last minute fixes, cached but unfortunately not committed before
>     sending
> v3: use .pci_device_id field content as an indicator of arg initialization
>     via intel_register_access_init(),
>   - improve checks of argument initialization status,
>   - shorten warning messages (Kamil),
>   - don't fill .mmio_size field until initialization succeeds (Kamil)
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/intel_io.h   |  4 +++
>  lib/intel_mmio.c | 64 +++++++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 65 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_io.h b/lib/intel_io.h
> index 1cfe4fb6b9..ea2649d9bc 100644
> --- a/lib/intel_io.h
> +++ b/lib/intel_io.h
> @@ -49,6 +49,8 @@ struct intel_register_map {
>  
>  struct intel_mmio_data {
>  	void *igt_mmio;
> +	size_t mmio_size;
> +	struct pci_device *dev;
>  	struct intel_register_map map;
>  	uint32_t pci_device_id;
>  	int key;
> @@ -57,7 +59,9 @@ struct intel_mmio_data {
>  
>  void intel_mmio_use_pci_bar(struct intel_mmio_data *mmio_data,
>  			    struct pci_device *pci_dev);
> +void intel_mmio_unmap_pci_bar(struct intel_mmio_data *mmio_data);
>  void intel_mmio_use_dump_file(struct intel_mmio_data *mmio_data, char *file);
> +void intel_mmio_unmap_dump_file(struct intel_mmio_data *mmio_data);
>  
>  int intel_register_access_init(struct intel_mmio_data *mmio_data,
>  			       struct pci_device *pci_dev, int safe, int fd);
> diff --git a/lib/intel_mmio.c b/lib/intel_mmio.c
> index 667a69f5aa..d6ce0ee3ea 100644
> --- a/lib/intel_mmio.c
> +++ b/lib/intel_mmio.c
> @@ -82,6 +82,8 @@ void *igt_global_mmio;
>   * Sets also up mmio_data->igt_mmio to point at the data contained
>   * in @file. This allows the same code to get reused for dumping and decoding
>   * from running hardware as from register dumps.
> + *
> + * Users are expected to call intel_mmio_unmap_dump_file() after use.
>   */
>  void
>  intel_mmio_use_dump_file(struct intel_mmio_data *mmio_data, char *file)
> @@ -99,11 +101,32 @@ intel_mmio_use_dump_file(struct intel_mmio_data *mmio_data, char *file)
>  	igt_fail_on_f(mmio_data->igt_mmio == MAP_FAILED,
>  		      "Couldn't mmap %s\n", file);
>  
> +	mmio_data->mmio_size = st.st_size;
>  	igt_global_mmio = mmio_data->igt_mmio;
>  
>  	close(fd);
>  }
>  
> +/**
> + * intel_mmio_unmap_dump_file:
> + * @mmio_data:  mmio structure for IO operations
> + *
> + * Unmaps a dump file mmapped with intel_mmio_use_dump_file()
> + */
> +void intel_mmio_unmap_dump_file(struct intel_mmio_data *mmio_data)
> +{
> +	if (igt_warn_on_f(mmio_data->dev,
> +			  "test bug: arg initialized with intel_mmio_use_pci_bar()\n"))
> +		return;

Please add a global description about this kind of errors, this
one is for using unmap when mmio was mmap-ed from other mmap
type.

> +	if (igt_warn_on_f(!mmio_data->mmio_size,
> +			  "test bug: arg not initialized\n"))
> +		return;

Can we replace this with one check igt_global_mmio != NULL ?
Something like:

	if (igt_warn_on_f(!igt_global_mmio,
			  "mmio regs not mmap-ed\n"))
		return;

Or should we add this before all other checks in unmap functions
and keep this additional check ?

> +
> +	igt_global_mmio = NULL;
> +	igt_debug_on(munmap(mmio_data->igt_mmio, mmio_data->mmio_size) < 0);
> +	mmio_data->mmio_size = 0;
> +}
> +
>  /**
>   * intel_mmio_use_pci_bar:
>   * @mmio_data:  mmio structure for IO operations
> @@ -112,6 +135,8 @@ intel_mmio_use_dump_file(struct intel_mmio_data *mmio_data, char *file)
>   * Fill a mmio_data stucture with igt_mmio to point at the mmio bar.
>   *
>   * @pci_dev can be obtained from intel_get_pci_device().
> + *
> + * Users are expected to call intel_mmio_unmap_pci_bar() after use.
>   */
>  void
>  intel_mmio_use_pci_bar(struct intel_mmio_data *mmio_data, struct pci_device *pci_dev)
> @@ -141,10 +166,34 @@ intel_mmio_use_pci_bar(struct intel_mmio_data *mmio_data, struct pci_device *pci
>  				      PCI_DEV_MAP_FLAG_WRITABLE,
>  				      &mmio_data->igt_mmio);
>  
> -	igt_global_mmio = mmio_data->igt_mmio;
> -
>  	igt_fail_on_f(error != 0,
>  		      "Couldn't map MMIO region\n");
> +
> +	mmio_data->mmio_size = mmio_size;
> +	mmio_data->dev = pci_dev;
> +	igt_global_mmio = mmio_data->igt_mmio;
> +}
> +
> +/**
> + * intel_mmio_unmap_pci_bar:
> + * @mmio_data:  mmio structure for IO operations
> + *
> + * Unmaps a PCI BAR region mmapped with intel_mmio_use_pci_bar()
> + */
> +void intel_mmio_unmap_pci_bar(struct intel_mmio_data *mmio_data)
> +{
> +	if (igt_warn_on_f(mmio_data->pci_device_id,
> +			  "test bug: arg initialized with intel_register_access_init()\n"))
> +		return;
> +	if (igt_warn_on_f(!mmio_data->dev,
> +			  "test bug: arg not initialized with intel_mmio_use_pci_bar()\n"))
> +		return;
> +
> +	igt_global_mmio = NULL;
> +	igt_debug_on(pci_device_unmap_range(mmio_data->dev,
> +					    mmio_data->igt_mmio, mmio_data->mmio_size) < 0);
> +	mmio_data->dev = NULL;
> +	mmio_data->mmio_size = 0;
>  }
>  
>  static void
> @@ -166,6 +215,8 @@ release_forcewake_lock(int fd)
>   * It also initializes mmio_data->igt_mmio like intel_mmio_use_pci_bar().
>   *
>   * @pci_dev can be obtained from intel_get_pci_device().
> + *
> + * Users are expected to call intel_register_access_fini() after use.
>   */
>  int
>  intel_register_access_init(struct intel_mmio_data *mmio_data, struct pci_device *pci_dev, int safe, int fd)
> @@ -222,8 +273,15 @@ int intel_register_access_needs_fakewake(struct intel_mmio_data *mmio_data)
>  void
>  intel_register_access_fini(struct intel_mmio_data *mmio_data)
>  {
> -	if (mmio_data->key && intel_register_access_needs_wake(mmio_data))
> +	if (igt_warn_on_f(!mmio_data->pci_device_id,
> +			  "test bug: arg not initialized with intel_register_access_init()\n"))
> +		return;
> +
> +	if (intel_register_access_needs_wake(mmio_data))
>  		release_forcewake_lock(mmio_data->key);
> +
> +	mmio_data->pci_device_id = 0;

Here we should check other conditions so no warn triggers in unmap_pci_bar
or make the messages generic (and document it in comments at beggining)
or maybe make helper with no checks for unmap_pci_bar.

> +	intel_mmio_unmap_pci_bar(mmio_data);
>  }
>  
>  /**
> -- 
> 2.25.1
> 

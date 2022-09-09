Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 09 Sep 2022 17:10:52 +0200
Message-ID: <13576898.RDIVbhacDa@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <20220829000920.38185-3-isabbasso@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-3-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] lib/igt_kmod.c: check if module
 is builtin before attempting to unload it
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: twoerner@gmail.com, linux-kselftest@vger.kernel.org,
 magalilemes00@gmail.com, maira.canal@usp.br, dlatypov@google.com,
 tales.aparecida@gmail.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, n@nfraprado.net,
 davidgow@google.com, skhan@linuxfoundation.org, andrealmeid@riseup.net,
 Isabella Basso <isabbasso@riseup.net>, kunit-dev@googlegroups.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Monday, 29 August 2022 02:09:18 CEST Isabella Basso wrote:
> This change makes `igt_module_unload_r` safer as it checks whether the

s/igt_module_unload_r/igt_kmod_unload_r/

> module can be unloaded before attempting it.
> 
> Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> ---
>  lib/igt_kmod.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index bb6cb7bb..97cac7f5 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -256,6 +256,9 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>  	struct kmod_list *holders, *pos;
>  	int err = 0;
>  
> +	if (kmod_module_get_initstate(kmod) == KMOD_MODULE_BUILTIN)
> +		return err;

NIT: I think that return 0; would be more clear.  Anyway,

Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> +
>  	holders = kmod_module_get_holders(kmod);
>  	kmod_list_foreach(pos, holders) {
>  		struct kmod_module *it = kmod_module_get_module(pos);
> 




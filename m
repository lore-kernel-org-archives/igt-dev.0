Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B586E921
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2020 07:08:25 +0000 (UTC)
Date: Fri, 24 Jul 2020 10:08:22 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200724070822.GY20883@platvala-desk.ger.corp.intel.com>
References: <20200723235458.43684-1-carlos.santa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723235458.43684-1-carlos.santa@intel.com>
Subject: Re: [igt-dev] [PATCH v2] tests: use an empty brace initializer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Carlos Santa <carlos.santa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 04:54:58PM -0700, Carlos Santa wrote:
> In some sandboxes the toolchain complains about missing
> braces around initializer, however, using an empty
> initializer is enough to shut out the compiler.
> 
> ../tests/kms_plane_cursor.c: In function '__real_main_302':
> ../tests/kms_plane_cursor.c:305:2 error: missing braces around
> initializer [-Werror=missing-braces]
> 	data_t data = { 0 };
> 
> v2:
>    Use an empty initializer { } instead of { 0 } <Petri, Latvala>

Remove the comma, I'm "Petri Latvala" :)


Reviewed-by: Petri Latvala <petri.latvala@intel.com>



> 
> Signed-off-by: Carlos Santa <carlos.santa@intel.com>
> ---
>  tests/amdgpu/amd_abm.c   | 2 +-
>  tests/kms_hdr.c          | 2 +-
>  tests/kms_plane_cursor.c | 2 +-
>  tests/kms_vrr.c          | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 741564628642..0505f17e46f9 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -299,7 +299,7 @@ static void abm_gradual(data_t *data)
>  
>  igt_main
>  {
> -	data_t data = { 0 };
> +	data_t data = {};
>  	enum pipe pipe;
>  	igt_output_t *output;
>  
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 0574d5ff5217..aa7e685b864b 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -633,7 +633,7 @@ static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
>  
>  igt_main
>  {
> -	data_t data = { 0 };
> +	data_t data = {};
>  
>  	igt_fixture {
>  		data.fd = drm_open_driver_master(DRIVER_AMDGPU | DRIVER_INTEL);
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index f7d50484dae1..f6766d368965 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -302,7 +302,7 @@ static void test_cursor_viewport(data_t *data, int size, enum pipe pipe_id)
>  igt_main
>  {
>  	static const int cursor_sizes[] = { 64, 128, 256 };
> -	data_t data = { 0 };
> +	data_t data = {};
>  	enum pipe pipe;
>  	int i;
>  
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 559ef2030930..a0db90006d00 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -390,7 +390,7 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
>  
>  igt_main
>  {
> -	data_t data = { 0 };
> +	data_t data = {};
>  
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

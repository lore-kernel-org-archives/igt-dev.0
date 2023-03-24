Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1218C10E4B5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 06:00:10 +0000 (UTC)
Date: Fri, 24 Mar 2023 07:00:06 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230324070006.1dd0e60c@maurocar-mobl2>
In-Reply-To: <20230324050237.2510-1-niranjana.vishwanathapura@intel.com>
References: <20230324050237.2510-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_debugfs: Get gt subtest
 passing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 23 Mar 2023 22:02:37 -0700
Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com> wrote:

> Get gt subtest passing by properly getting and using
> xe device config info.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/xe/xe_debugfs.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
> index ad6191fbc..6bdd3ef06 100644
> --- a/tests/xe/xe_debugfs.c
> +++ b/tests/xe/xe_debugfs.c
> @@ -71,7 +71,7 @@ static int validate_entries(int fd, const char *add_path, const char * const str
>   * Description: Check if various debugfs devnodes exist and test reading them.
>   */
>  static void
> -test_base(int fd)
> +test_base(int fd, struct drm_xe_query_config *config)
>  {
>  	static const char * const expected_files[] = {
>  		"gt0",
> @@ -88,8 +88,6 @@ test_base(int fd)
>  
>  	char reference[4096];
>  	int val = 0;
> -	struct xe_device *xe_dev = xe_device_get(fd);
> -	struct drm_xe_query_config *config = xe_dev->config;
>  
>  	igt_assert(config);
>  	sprintf(reference, "devid 0x%llx",
> @@ -145,8 +143,6 @@ test_base(int fd)
>  	igt_debugfs_dump(fd, "gem_names");
>  
>  	validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
> -
> -	xe_device_put(fd);
>  }
>  
>  /**
> @@ -244,17 +240,19 @@ static int opt_handler(int option, int option_index, void *input)
>  
>  igt_main_args("", long_options, help_str, opt_handler, NULL)
>  {
> +	struct xe_device *xe_dev;
>  	char devnode[PATH_MAX];
>  	int fd;
>  	int gt;
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> +		xe_dev = xe_device_get(fd);
>  		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
>  	}
>  
>  	igt_subtest("base") {
> -		test_base(fd);
> +		test_base(fd, xe_dev->config);
>  	}
>  
>  
> @@ -271,6 +269,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_fixture {
> +		xe_device_put(fd);
>  		close(fd);
>  	}
>  }

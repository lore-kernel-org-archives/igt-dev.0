Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692C010E060
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 11:26:55 +0000 (UTC)
Message-ID: <3a4f9377-eda2-a663-27f9-2d915fc704d9@intel.com>
Date: Wed, 13 Sep 2023 16:56:32 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230912162219.1316473-1-swati2.sharma@intel.com>
 <20230912162219.1316473-2-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230912162219.1316473-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v9 1/4] lib/dsc: fix documentation style
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On Tue-12-09-2023 09:52 pm, Swati Sharma wrote:
> Fix documentation style so that it can be detected by scripts
> to build IGT reference docs published at
> https://drm.pages.freedesktop.org/igt-gpu-tools/
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_dsc.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
> index 76a420c10..8cb293890 100644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -42,7 +42,7 @@ static int write_dsc_debugfs(int drmfd, char *connector_name, const char *file_n
>   	return ret;
>   }
>   
> -/*
> +/**
>    * igt_is_dsc_supported_by_source:
>    * @drmfd: A drm file descriptor
>    *
> @@ -63,7 +63,7 @@ bool igt_is_dsc_supported_by_source(int drmfd)
>   	return res > 0 ? strstr(buf, "has_dsc: yes") : 0;
>   }
>   
> -/*
> +/**
>    * igt_is_dsc_supported_by_sink:
>    * @drmfd: A drm file descriptor
>    * @connector_name: Name of the libdrm connector we're going to use
> @@ -75,7 +75,7 @@ bool igt_is_dsc_supported_by_sink(int drmfd, char *connector_name)
>   	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
>   }
>   
> -/*
> +/**
>    * igt_is_fec_supported:
>    * @drmfd: A drm file descriptor
>    * @connector_name: Name of the libdrm connector we're going to use
> @@ -87,7 +87,7 @@ bool igt_is_fec_supported(int drmfd, char *connector_name)
>   	return check_dsc_debugfs(drmfd, connector_name, "FEC_Sink_Support: yes");
>   }
>   
> -/*
> +/**
>    * igt_is_dsc_enabled:
>    * @drmfd: A drm file descriptor
>    * @connector_name: Name of the libdrm connector we're going to use
> @@ -99,7 +99,7 @@ bool igt_is_dsc_enabled(int drmfd, char *connector_name)
>   	return check_dsc_debugfs(drmfd, connector_name, "DSC_Enabled: yes");
>   }
>   
> -/*
> +/**
>    * igt_is_force_dsc_enabled:
>    * @drmfd: A drm file descriptor
>    * @connector_name: Name of the libdrm connector we're going to use
> @@ -112,7 +112,7 @@ bool igt_is_force_dsc_enabled(int drmfd, char *connector_name)
>   	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: yes");
>   }
>   
> -/*
> +/**
>    * igt_force_dsc_enable:
>    * @drmfd: A drm file descriptor
>    * @connector_name: Name of the libdrm connector we're going to use
> @@ -124,7 +124,7 @@ int igt_force_dsc_enable(int drmfd, char *connector_name)
>   	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "1");
>   }
>   
> -/*
> +/**
>    * igt_force_dsc_enable_bpc:
>    * @drmfd: A drm file descriptor
>    * @connector_name: Name of the libdrm connector we're going to use
> @@ -141,7 +141,7 @@ int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
>   	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc", buf);
>   }
>   
> -/*
> +/**
>    * igt_get_dsc_debugfs_fd:
>    * @drmfd: A drm file descriptor
>    * @connector_name: Name of the libdrm connector we're going to use
> @@ -157,7 +157,7 @@ int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
>   	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
>   }
>   
> -/*
> +/**
>    * igt_is_dsc_output_format_supported_by_sink:
>    * @drmfd: A drm file descriptor
>    * @connector_name: Name of the libdrm connector we're going to use
> @@ -188,7 +188,7 @@ bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
>   	return check_dsc_debugfs(drmfd, connector_name, check_str);
>   }
>   
> -/*
> +/**
>    * igt_force_dsc_output_format:
>    * @drmfd: A drm file descriptor
>    * @connector_name: Name of the libdrm connector we're going to use

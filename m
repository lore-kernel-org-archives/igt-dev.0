Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587F1CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 11:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0686E10E3A8;
	Mon, 15 Jun 2026 11:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+v9+CI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB08410E353
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781521827; x=1813057827;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=+Sur4xVjlVomxG6ER9FoqvJ9Rku8RbJKgTukDwIK8yI=;
 b=L+v9+CI3JmrLwNIwUj77MPLnP4OpkkunUQIcmY6phl9QY3F2GTqqykcm
 SuhfHAoETBE+aOVU/z0hDLuAButZED6/Ilb3sysASPAubSmGFcg2/hV8Z
 YYTSK53HlfjJPB9J1zjsxGtzbmSQ2J8BMQPoXz7uzVtXS04eH0Ljtwo3S
 jUOwJ1THMYv7Lxlfrb0r/ZAHfcnDR9q1s2BWkFzGWQQVdKAYg+gjO9Aww
 a+RmoLq868wPCSwhCELXdU2FQ64Tx54Ome2Zt/1cpMbJ6bUJ8PK5Wlhhr
 hixM5VIV28v9eL+O737xvvycb5xRPSn0UbuuzSYPzglpQ+UgvyRxraM8Q g==;
X-CSE-ConnectionGUID: fB83xbg0RbSsolrg41VTCQ==
X-CSE-MsgGUID: 9L1I8v18T++ya6cAZ+CxhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="84823145"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="84823145"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:10:26 -0700
X-CSE-ConnectionGUID: KJBnkNBXRISUh1y8FYz+zw==
X-CSE-MsgGUID: OW3qkFC1SMmFsk/VRz37iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="241088791"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 04:10:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>, igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, kamil.konieczny@intel.com, Sobin Thomas
 <sobin.thomas@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/xe_debugfs: Add debugfs entry read/write
 validation in root-dir
In-Reply-To: <20260615043050.603026-1-sobin.thomas@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260615043050.603026-1-sobin.thomas@intel.com>
Date: Mon, 15 Jun 2026 14:10:22 +0300
Message-ID: <5cb5116d1d72fae6d6bc5059d935f7bc8e448469@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, 15 Jun 2026, Sobin Thomas <sobin.thomas@intel.com> wrote:
> Extend the root-dir subtest to validate additional optional Xe debugfs
> entries. Optional entries are those that may not be present on all
> platforms or configurations =E2=80=94 their absence is not treated as a f=
ailure.
>
> - dgfx_pkg_residencies: Validate counter reads (non-empty)
> - dgfx_pcie_link_residencies: Validate PCIE LINK string content
> - sriov_info: Validate entry is non-empty
> - workarounds: Validate entry is non-empty
> - atomic_svm_timeslice_ms: Validate integer read/write
> - poor_man_system_atomic_support: Validate boolean read/write
> - disable_late_binding: Validate boolean read/write
>
> v2: Fixed the optional file check and added fail count.
>     Replaced igt_debug with igt_info in few places  (kamil)

Why is the plumbing in this patch so xe focused? Looks like a lot of
this could be IGT generic and driver agnostic, with just the debugfs
hierarchy and filenames and requirements for each file described per
driver.

BR,
Jani.


>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 198 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 184 insertions(+), 14 deletions(-)
>
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 587e3e785..d92e07092 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -39,11 +39,24 @@ IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes an=
d their contents");
>  	__m && ((__i) =3D __builtin_ctz(__m), 1);	\
>  	__m &=3D __m - 1)
>=20=20
> +/* Validation types for debugfs read tests */
> +enum debugfs_validate_type {
> +	VALIDATE_NONE,		/* Just check file exists */
> +	VALIDATE_NON_EMPTY,	/* Just check buffer is not empty */
> +	VALIDATE_CONTAINS_STR,	/* Check buffer contains expected string */
> +	VALIDATE_INT_GE_ZERO,	/* Parse as integer, verify >=3D 0 */
> +	VALIDATE_BOOL,		/* Check bool value (0 or 1) */
> +};
> +
>  struct check_entry {
>  	const char *name_fmt;
>  	int mode;
> -	bool (*condition)(struct xe_device *xe_dev);
> +	bool optional;
> +	bool (*condition)(struct xe_device *xe_dev, void *params);
> +	void *cond_params;
>  	unsigned int (*iter_mask)(struct xe_device *xe_dev);
> +	enum debugfs_validate_type validate;
> +	const char *expected_str;
>  };
>=20=20
>  static unsigned int gt_iter_mask(struct xe_device *xe_dev)
> @@ -56,7 +69,7 @@ static unsigned int tile_iter_mask(struct xe_device *xe=
_dev)
>  	return xe_dev->tile_mask;
>  }
>=20=20
> -static bool has_vram(struct xe_device *xe_dev)
> +static bool has_vram_region(struct xe_device *xe_dev, void *params)
>  {
>  	return xe_dev->has_vram;
>  }
> @@ -131,6 +144,108 @@ static bool find_not_tested_files(int dir_fd, struc=
t igt_list_head *hit_entries)
>  	return found_not_tested;
>  }
>=20=20
> +/* Validate that debugfs buffer is non-empty or contains expected string=
 */
> +static bool validate_string(int dirfd, const char *file_name, const char=
 *expected_str)
> +{
> +	char buf[4096];
> +	int ret =3D 0;
> +
> +	ret =3D igt_sysfs_read(dirfd, file_name, buf, sizeof(buf) - 1);
> +	if (ret < 0)
> +		return false;
> +	buf[ret] =3D '\0';
> +
> +	/* Check for empty buffer */
> +	if (strlen(buf) =3D=3D 0) {
> +		igt_warn("Empty output from %s\n", file_name);
> +		return false;
> +	}
> +
> +	/* If expecting specific string, verify it's present */
> +	if (expected_str && !strstr(buf, expected_str)) {
> +		igt_warn("Expected '%s' not found in %s\n", expected_str, file_name);
> +		return false;
> +	}
> +
> +	if (expected_str)
> +		igt_debug("Successfully read %s: found '%s'\n", file_name, expected_st=
r);
> +	else
> +		igt_debug("Successfully read %s: %zd bytes\n%s\n", file_name, strlen(b=
uf), buf);
> +
> +	return true;
> +}
> +
> +static const char *mode_to_str(int mode)
> +{
> +	switch (mode & O_ACCMODE) {
> +	case O_RDONLY: return "RO";
> +	case O_WRONLY: return "WO";
> +	case O_RDWR:   return "RW";
> +	default:       return "UNKNOWN";
> +	}
> +}
> +
> +static bool validate_bool_file(int dirfd, const char *file_name, int mod=
e)
> +{
> +	int orig_val =3D 0, read_val =3D 0, test_val =3D 0;
> +
> +	if (igt_sysfs_scanf(dirfd, file_name, "%d", &orig_val) !=3D 1 ||
> +	    (orig_val !=3D 0 && orig_val !=3D 1))
> +		return false;
> +
> +	if (mode =3D=3D O_RDWR) {
> +		test_val =3D (orig_val =3D=3D 0) ? 1 : 0;
> +
> +		if (igt_sysfs_printf(dirfd, file_name, "%d", test_val) < 0)
> +			return false;
> +
> +		if (igt_sysfs_scanf(dirfd, file_name, "%d", &read_val) !=3D 1 || read_=
val !=3D test_val)
> +			return false;
> +
> +		/* Restore original value */
> +		if (igt_sysfs_printf(dirfd, file_name, "%d", orig_val) < 0) {
> +			igt_warn("Failed to restore original value for %s\n", file_name);
> +			return false;
> +		}
> +	}
> +
> +	igt_info("Successfully validated %s bool %s\n", mode_to_str(mode), file=
_name);
> +	return true;
> +}
> +
> +static bool validate_int_file(int dirfd, const char *file_name, int mode)
> +{
> +	long orig_val =3D 0, new_val =3D 0, read_val =3D 0;
> +
> +	if (igt_sysfs_scanf(dirfd, file_name, "%ld", &orig_val) !=3D 1)
> +		return false;
> +
> +	if (orig_val < 0)
> +		return false;
> +
> +	if (mode =3D=3D O_RDWR) {
> +		new_val =3D orig_val + 1;
> +		if (igt_sysfs_printf(dirfd, file_name, "%ld", new_val) < 0)
> +			return false;
> +		if (igt_sysfs_scanf(dirfd, file_name, "%ld", &read_val) !=3D 1)
> +			return false;
> +		if (read_val !=3D new_val)
> +			return false;
> +		/* Restore original value */
> +		if (igt_sysfs_printf(dirfd, file_name, "%ld", orig_val) < 0) {
> +			igt_warn("Failed to restore original value for %s\n", file_name);
> +			return false;
> +		}
> +
> +		igt_info("Successfully validated %s int %s: %ld -> %ld -> %ld\n",
> +			 mode_to_str(mode), file_name, orig_val, new_val, orig_val);
> +	} else {
> +		igt_info("Successfully validated %s int %s: %ld\n",
> +			 mode_to_str(mode), file_name, orig_val);
> +	}
> +	return true;
> +}
> +
>  static bool file_in_dir_exists(int dirfd, const char *file_name, int mod=
e)
>  {
>  	int fd =3D openat(dirfd, file_name, mode);
> @@ -139,10 +254,39 @@ static bool file_in_dir_exists(int dirfd, const cha=
r *file_name, int mode)
>  		close(fd);
>  		return true;
>  	}
> -
>  	return false;
>  }
>=20=20
> +static bool validate_debugfs_file(int dirfd, const char *file_name, int =
mode,
> +				  enum debugfs_validate_type validate, const char *expected_str)
> +{
> +	bool result =3D true;
> +
> +	if (validate =3D=3D VALIDATE_NONE)
> +		return true;
> +
> +	switch (validate) {
> +	case VALIDATE_NON_EMPTY:
> +		result =3D validate_string(dirfd, file_name, NULL);
> +		break;
> +	case VALIDATE_CONTAINS_STR:
> +		result =3D validate_string(dirfd, file_name, expected_str);
> +		break;
> +	case VALIDATE_INT_GE_ZERO:
> +		result =3D validate_int_file(dirfd, file_name, mode);
> +		break;
> +	case VALIDATE_BOOL:
> +		result =3D validate_bool_file(dirfd, file_name, mode);
> +		break;
> +	default:
> +		igt_warn("Unknown validate type %d for %s\n", validate, file_name);
> +		result =3D false;
> +		break;
> +	}
> +
> +	return result;
> +}
> +
>  /*
>   * Return: negative error code on failure, or number of missing files
>   */
> @@ -151,6 +295,7 @@ static int debugfs_validate_entries(struct xe_device =
*xe_dev, int dir_fd,
>  {
>  	struct igt_list_head hit_entries;
>  	int missing_count =3D 0;
> +	int fail_count =3D 0;
>  	int err =3D 0;
>=20=20
>  	IGT_INIT_LIST_HEAD(&hit_entries);
> @@ -160,7 +305,7 @@ static int debugfs_validate_entries(struct xe_device =
*xe_dev, int dir_fd,
>  		unsigned int mask;
>  		unsigned int j;
>=20=20
> -		if (check->condition && !check->condition(xe_dev))
> +		if (check->condition && !check->condition(xe_dev, check->cond_params))
>  			continue;
>=20=20
>  		if (!check->iter_mask)
> @@ -210,9 +355,20 @@ static int debugfs_validate_entries(struct xe_device=
 *xe_dev, int dir_fd,
>  			}
>=20=20
>  			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
> -				igt_warn("Missing debugfs file: %s\n", entry->name);
> -				missing_count++;
> +				if (check->optional) {
> +					igt_info("Optional entry %s not found (skipped)\n",
> +						 entry->name);
> +				} else {
> +					igt_info("Missing debugfs file: %s\n",
> +						 entry->name);
> +					missing_count++;
> +				}
> +			} else {
> +				if (!validate_debugfs_file(dir_fd, entry->name, check->mode,
> +							   check->validate, check->expected_str))
> +					fail_count++;
>  			}
> +
>  		}
>  	}
>=20=20
> @@ -229,7 +385,10 @@ out:
>  		}
>  	}
>=20=20
> -	return (err < 0) ? err : missing_count;
> +	if (fail_count || missing_count)
> +		igt_warn("Fails: %d missing debugfs file(s): %d\n", fail_count, missin=
g_count);
> +
> +	return (err < 0) ? err : (missing_count + fail_count);
>  }
>=20=20
>  /**
> @@ -239,14 +398,25 @@ out:
>  static void test_root_dir(struct xe_device *xe_dev)
>  {
>  	const struct check_entry expected_files[] =3D {
> -		{ "clients", O_RDONLY },
> +		{ "clients", O_RDONLY, .validate =3D VALIDATE_NON_EMPTY },
> +		{ "disable_late_binding", O_RDWR, .optional =3D true, .validate =3D VA=
LIDATE_BOOL },
>  		{ "forcewake_all", O_WRONLY },
>  		{ "gem_names", O_RDONLY },
> -		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
> -		{ "gtt_mm", O_RDONLY },
> -		{ "info", O_RDONLY },
> -		{ "name", O_RDONLY },
> -		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
> +		{ "gt%u", O_RDONLY, .iter_mask =3D gt_iter_mask },
> +		{ "gtt_mm", O_RDONLY, },
> +		{ "info", O_RDONLY, .validate =3D VALIDATE_NON_EMPTY },
> +		{ "name", O_RDONLY, .validate =3D VALIDATE_NON_EMPTY },
> +		{ "poor_man_system_atomic_support", O_RDWR, .optional =3D true,
> +		  .validate =3D VALIDATE_BOOL },
> +		{ "dgfx_pkg_residencies", O_RDONLY, .optional =3D true,
> +		  .validate =3D VALIDATE_NON_EMPTY },
> +		{ "dgfx_pcie_link_residencies", O_RDONLY, .optional =3D true,
> +		  .validate =3D VALIDATE_CONTAINS_STR, .expected_str =3D "PCIE LINK" },
> +		{ "sriov_info", O_RDONLY, .optional =3D true, .validate =3D VALIDATE_N=
ON_EMPTY },
> +		{ "workarounds", O_RDONLY, .optional =3D true, .validate =3D VALIDATE_=
NON_EMPTY },
> +		{ "atomic_svm_timeslice_ms", O_RDWR, .optional =3D true,
> +		  .validate =3D VALIDATE_INT_GE_ZERO },
> +		{ "tile%u", O_RDONLY, .iter_mask =3D tile_iter_mask },
>  	};
>  	int debugfs_fd =3D igt_debugfs_dir(xe_dev->fd);
>  	int missing_count;
> @@ -276,7 +446,7 @@ static void test_tile_dir(struct xe_device *xe_dev, u=
int8_t tile)
>  	const struct check_entry expected_files[] =3D {
>  		{ "ggtt", O_RDONLY },
>  		{ "sa_info", O_RDONLY },
> -		{ "vram_mm", O_RDONLY, has_vram },
> +		{ "vram_mm", O_RDONLY, .condition =3D has_vram_region, .cond_params =
=3D (void *)&tile },
>  	};
>  	int debugfs_fd =3D igt_debugfs_tile_dir(xe_dev->fd, tile);
>  	int missing_count;

--=20
Jani Nikula, Intel

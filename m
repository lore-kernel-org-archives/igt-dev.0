Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040FACD1292
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 12:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5579C10F080;
	Thu, 11 Apr 2024 12:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYvZCBwh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AB010F07C
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712838049; x=1744374049;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=IWM8zu0WtlGS/O2zdGcc4pJxcjR5QH67ahUHNWE4E5g=;
 b=NYvZCBwhZRYEvi0xQvnYRcP4SF7aBTP27gEnaRacsrjhTOIWjaQWsl5D
 RuCctr4Pv5pbIsfnJDW/TqtN6gdMX20Y36UBiGKX0QbalceKKmRiS2ak3
 3SHQtCzm8CO64MvBtsBrnejNzhtBTjW9OV3Z7NBoVMvuCaYOgZHQkSBQ6
 lEnc5QPG8EEqpyc8JvkWaqi3xZq/U0/uy/u30GT+qpzQ+Lj1ctut1YZ93
 /awbH78qvezux115E8jjFLnCdndIFe96Up8K7P6wKaiJpsmOXfEtsU4iN
 B/2X8gJr9VmVQ/Sm2VWLL4fbiYNN6QXyOCakiXnxmClcrEZjfnDTUVp3k Q==;
X-CSE-ConnectionGUID: NH/1q2gCTLuIka25ZqebCQ==
X-CSE-MsgGUID: BZG+jbx2R6S5nIap+N20nQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8417859"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8417859"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:20:47 -0700
X-CSE-ConnectionGUID: qZIqLIXcS8yK86KSRoTkHw==
X-CSE-MsgGUID: 2nSswvGhT3KzMFGY9R/nBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21472450"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:20:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/13] tools/intel_vbt_decode: update vbt defs
 from kernel
In-Reply-To: <20240322204125.17212-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-2-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 15:20:42 +0300
Message-ID: <87h6g86qg5.fsf@intel.com>
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

On Fri, 22 Mar 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Sync intel_vbt_defs.h up to kernel
> commit 962601ac4c78 ("drm/i915/bios: Pimp the VBT backlight
> data BDB version comments")
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Assuming this is a copy,

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tools/intel_vbt_defs.h | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index a9f44abfc9fc..3815aa21d19f 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -485,6 +485,7 @@ struct child_device_config {
>  	u8 hdmi_iboost_level:4;					/* 196+ */
>  	u8 dp_max_link_rate:3;					/* 216+ */
>  	u8 dp_max_link_rate_reserved:5;				/* 216+ */
> +	u8 efp_index;						/* 256+ */
>  } __packed;
>=20=20
>  struct bdb_general_definitions {
> @@ -602,22 +603,22 @@ struct bdb_driver_features {
>  	u8 custom_vbt_version;					/* 155+ */
>=20=20
>  	/* Driver Feature Flags */
> -	u16 rmpm_enabled:1;					/* 165+ */
> -	u16 s2ddt_enabled:1;					/* 165+ */
> -	u16 dpst_enabled:1;					/* 165-227 */
> -	u16 bltclt_enabled:1;					/* 165+ */
> -	u16 adb_enabled:1;					/* 165-227 */
> -	u16 drrs_enabled:1;					/* 165-227 */
> -	u16 grs_enabled:1;					/* 165+ */
> -	u16 gpmt_enabled:1;					/* 165+ */
> -	u16 tbt_enabled:1;					/* 165+ */
> +	u16 rmpm_enabled:1;					/* 159+ */
> +	u16 s2ddt_enabled:1;					/* 159+ */
> +	u16 dpst_enabled:1;					/* 159-227 */
> +	u16 bltclt_enabled:1;					/* 159+ */
> +	u16 adb_enabled:1;					/* 159-227 */
> +	u16 drrs_enabled:1;					/* 159-227 */
> +	u16 grs_enabled:1;					/* 159+ */
> +	u16 gpmt_enabled:1;					/* 159+ */
> +	u16 tbt_enabled:1;					/* 159+ */
>  	u16 psr_enabled:1;					/* 165-227 */
>  	u16 ips_enabled:1;					/* 165+ */
> -	u16 dpfs_enabled:1;					/* 165+ */
> +	u16 dfps_enabled:1;					/* 165+ */
>  	u16 dmrrs_enabled:1;					/* 174-227 */
>  	u16 adt_enabled:1;					/* ???-228 */
>  	u16 hpd_wake:1;						/* 201-240 */
> -	u16 pc_feature_valid:1;
> +	u16 pc_feature_valid:1;					/* 159+ */
>  } __packed;
>=20=20
>  /*
> @@ -880,11 +881,12 @@ struct bdb_lvds_lfp_data_tail {
>  struct lfp_backlight_data_entry {
>  	u8 type:2;
>  	u8 active_low_pwm:1;
> -	u8 obsolete1:5;
> +	u8 i2c_pin:3;						/* obsolete since ? */
> +	u8 i2c_speed:2;						/* obsolete since ? */
>  	u16 pwm_freq_hz;
>  	u8 min_brightness;					/* ???-233 */
> -	u8 obsolete2;
> -	u8 obsolete3;
> +	u8 i2c_address;						/* obsolete since ? */
> +	u8 i2c_command;						/* obsolete since ? */
>  } __packed;
>=20=20
>  struct lfp_backlight_control_method {
> @@ -905,8 +907,8 @@ struct lfp_brightness_level {
>  struct bdb_lfp_backlight_data {
>  	u8 entry_size;
>  	struct lfp_backlight_data_entry data[16];
> -	u8 level[16];							/* ???-233 */
> -	struct lfp_backlight_control_method backlight_control[16];
> +	u8 level[16];							/* 162-233 */
> +	struct lfp_backlight_control_method backlight_control[16];	/* 191+ */
>  	struct lfp_brightness_level brightness_level[16];		/* 234+ */
>  	struct lfp_brightness_level brightness_min_level[16];		/* 234+ */
>  	u8 brightness_precision_bits[16];				/* 236+ */
> @@ -917,7 +919,7 @@ struct bdb_lfp_backlight_data {
>   * Block 44 - LFP Power Conservation Features Block
>   */
>  struct lfp_power_features {
> -	u8 reserved1:1;
> +	u8 dpst_support:1;						/* ???-159 */
>  	u8 power_conservation_pref:3;
>  	u8 reserved2:1;
>  	u8 lace_enabled_status:1;					/* 210+ */

--=20
Jani Nikula, Intel

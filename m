Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805F389332
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 14:30:21 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Tue, 14 Jan 2020 14:30:16 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823928F2@BGSMSX104.gar.corp.intel.com>
References: <20191231132158.3911-1-swati2.sharma@intel.com>
 <20191231132158.3911-3-swati2.sharma@intel.com>
In-Reply-To: <20191231132158.3911-3-swati2.sharma@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/7] lib/igt_kms: Add max bpc connector
 property
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
To: "Sharma, Swati2" <swati2.sharma@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



>-----Original Message-----
>From: Sharma, Swati2 <swati2.sharma@intel.com>
>Sent: Tuesday, December 31, 2019 6:52 PM
>To: igt-dev@lists.freedesktop.org
>Cc: ville.syrjala@linux.intel.com; Shankar, Uma <uma.shankar@intel.com>; Hiler,
>Arkadiusz <arkadiusz.hiler@intel.com>; Nicholas Kazlauskas
><nicholas.kazlauskas@amd.com>; Leo Li <sunpeng.li@amd.com>; Harry Wentland
><harry.wentland@amd.com>; Sharma, Swati2 <swati2.sharma@intel.com>
>Subject: [igt-dev][PATCH i-g-t 2/7] lib/igt_kms: Add max bpc connector property
>
>From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>
>It's been in DRM for a while but was never added to IGT's internal list.
>
>This property should be reset along with other properties between tests since output
>color depth can affect CRC calculation... but it's not really feasible since it's driver
>specific for what the value should be reset to.
>
>v2: rebase
>v3: rebase

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

>Cc: Leo Li <sunpeng.li@amd.com>
>Cc: Harry Wentland <harry.wentland@amd.com>
>Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>---
> lib/igt_kms.c | 1 +
> lib/igt_kms.h | 1 +
> 2 files changed, 2 insertions(+)
>
>diff --git a/lib/igt_kms.c b/lib/igt_kms.c index d20daaad..b0b064c9 100644
>--- a/lib/igt_kms.c
>+++ b/lib/igt_kms.c
>@@ -416,6 +416,7 @@ const char * const
>igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
> 	[IGT_CONNECTOR_VRR_CAPABLE] = "vrr_capable",
> 	[IGT_CONNECTOR_HDCP_CONTENT_TYPE] = "HDCP Content Type",
> 	[IGT_CONNECTOR_LINK_STATUS] = "link-status",
>+	[IGT_CONNECTOR_MAX_BPC] = "max bpc",
> };
>
> /*
>diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 6c919e92..36077d41 100644
>--- a/lib/igt_kms.h
>+++ b/lib/igt_kms.h
>@@ -125,6 +125,7 @@ enum igt_atomic_connector_properties {
>        IGT_CONNECTOR_VRR_CAPABLE,
>        IGT_CONNECTOR_HDCP_CONTENT_TYPE,
>        IGT_CONNECTOR_LINK_STATUS,
>+       IGT_CONNECTOR_MAX_BPC,
>        IGT_NUM_CONNECTOR_PROPS
> };
>
>--
>2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19833C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 07:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BECF10E4EA;
	Tue,  1 Sep 2026 07:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HiP0A2M5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADEC10E4EA
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 07:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788248667; x=1819784667;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0Os94uBOPnQMUtjTnVuOJ0MS9bRBsUF3QfzmasTZ2CE=;
 b=HiP0A2M5azsfZF5SF8tH0vacSL9etiApmd/eikZrx1nSGehudDafBOLw
 z6e7rJlrce5ozxJ6fawJjDpVK4xMSKfq/pV9Istp9uN7v1v34hjmTmRjd
 5qpeeUJMakDKUMCmQnSYckuyJqJIph4mIhg8H7eDL3XkdTCewNU+Sd1nQ
 P+xn727KsTddjQSVJ4twlbHoe2BXfRbECaXCbpf7o1WE+Va3H5EP2cjzI
 VjcDjjF+pdpG0InEAMTz4rKroSPmYpb2UHRfJL6BiyyZh4ZYYrsMs8mkF
 mpLJchG1Dr74H7sb4xZ2vz31fXJftQbf+EAwn3Q6HCWtk3ddCwPKje0rx g==;
X-CSE-ConnectionGUID: zY0TwQzaR4KFE0AaTfPVXg==
X-CSE-MsgGUID: OVWLjlpgSie7h6oTFrUteQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88543488"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88543488"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 00:44:21 -0700
X-CSE-ConnectionGUID: jxZZQdMYRgWUSlOKovYUaQ==
X-CSE-MsgGUID: hBGwGhhgSt+VgccEoUw5bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="273201675"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 00:44:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 00:44:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 00:44:20 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 00:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlaxDQPeqdcb44C5th7kdtt5Ukx4rGg7jP1sr/EATtqJfDL0xSUs0uBy9uez/Xo6aqU+RWcxih6yW9GKKhuNp9slcwAsHxV1RFKPgwWYeuMe3GK3shFmpWkscjyqDEeOHNaeW526DOQg+mYDHy2p1ilIjVzjE9Jmm3Ez9MVuISv/8wI4XQfi41W+6ONyyUUJPUZkLsdGn1mrWmjlxh0QR/KcDa2s0bh3cv9StJpGwGL87YkxdbzhHCcpaDOFrlxVEKegxP12waqJKtwvT957UOmTwzBYSkB5y6T+mAR2GtSknvv23jIqsw2P1pIRHL6CY0zFAIBx4k7Zlg3VdWNrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YocY5W68sPbowYphW1n2hP6VvBUX/aUA6dsOIEfjXd4=;
 b=Z5s9FlapK1qy9J8FrRVN4uPB4Da+rN/Wdao+mFhr5ycTbn5P6facb/JNxiLed10PERuNYg3sgyTzXQ2c5XIPagkgcwJ1tnzbQ9CYxO2C1J3t3j95uPpdHQO8Roe4FybyxHBy4xgRYLKu+9syuaKLeaJzopuA5JluMSRapRzqVy0wSAAA6g0Dfh/4Wt5CR5W7z+ai4bRQ9jwxsjbPfg/TU8N1ybixVtQIksu5l+HaU1z0F4kaWrlYOB//kDOzAW9XotFLzxbU1dERBaKbQJz2+bWyzcOdgncYZQ2Rj1+SMqFW+Mi4JkH/uaizfyGptLgzPXu8nLE31E7QuCNtwsE06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 07:44:12 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 07:44:12 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 1/4] lib/dsc: Add
 igt_force_dsc_enable_compressed_bpp()
Thread-Topic: [PATCH i-g-t 1/4] lib/dsc: Add
 igt_force_dsc_enable_compressed_bpp()
Thread-Index: AQHdIOYqGqxkj05Jik6VX0EA6yreYLa5ZOzg
Date: Tue, 1 Sep 2026 07:44:12 +0000
Message-ID: <PH7PR11MB67969ECF3BB93C4091E87393E5A82@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260731122145.4099468-1-swati2.sharma@intel.com>
 <20260731122145.4099468-2-swati2.sharma@intel.com>
In-Reply-To: <20260731122145.4099468-2-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: swati2.sharma@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA3PR11MB7435:EE_
x-ms-office365-filtering-correlation-id: ec5ee4a3-5e50-41d3-ee64-08df07fcd08f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: qX1J88j4N2xudBjYEKYJxn1bT+MlvT+QqbJO/KIJHgfkDpzhhYICIfaE+kXD1vXcKHTB5HCIOEc+JxneaPPzPpFsOmgRiX6CZgGnpx6bHg6mtn9OX+DeSFNkagh5Q9dvBGGkAWZT2AxB77jeE0GPUnCswbP6BjCywO8lrCzxbo/kAtqBvI7viwkSL4hxc+wqwp1JTwly7+5rkcHDF3JoWSaPe4SJkqCqLU7SxSzUL/f5/nHIO9Pot5jm5u4iHhZaPTI6+echNT843uOuhy8p+AozheHL8SBdtDmuDyvDp8ND5PBzvZiBRX007EvQHQLDsqOX6fH8uSN1QU0mm6ZfC81tQOJcjXYBk/2LVJUOMBDyrrz4boHgOqKsaQ0gwPJgDD+VPrIGRtPlv7sS4LtWtyaUvNoa+fH7ew5e5Qfiyg4hm4ddkLpzan8THMTk3Gr5p2Pcmj7MO5GWVaSIH8Rdzd9MyvZquMbpus4OR/XR2a9updlOJxaxwYaHVvOJZDpttzR/OIKpLb+xx96toMQ3lPCNeV1q0TsZqGLbDO3jGu3vRKDZ/C4DIwf5Lz4wjSgrDDJvfV27L7ldMlfKA8HSzwLw5gyXiOHQmlQiz/vf9lm0rqLatJ1qIv3ySSPN0QNUSe62e1KyXN1PGhygE2qLx7ObvtLGZn+ofsPeUAitwjRv981JXo6tT1WTf2j4ypbpyHHlr1lXkxUJpLCjhJkdqNFRfEGeksVS0sqeYR5qHAw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zqcksnBjXqEuPxij2E/uMPNY9vnsxftFOhqEqvWgvAx7LK5JVlhCc3Zi14jO?=
 =?us-ascii?Q?bexkHL4L9bWu80w0h/h0hnH7ImhD8UBG3uOyT/A1bvicGTUxjxF0pCm72ZIq?=
 =?us-ascii?Q?Pth1M2+6lSubNAEeTkuT8hGsjE6h9fbOP0xYi8iaUVUclRCs4wjyIxk6pvyL?=
 =?us-ascii?Q?HQtwl/FJs/dNICKHo79hNQbVsEckeat7N2TIbTpgwWx8XA+/Ls0EO6jG6rvG?=
 =?us-ascii?Q?fzyRAgyOApFzPzllorf9vkttSLdUDcbAYavNkrDpgy4JsamvGYY2UeyarPEs?=
 =?us-ascii?Q?NFb2T+NqI2y1lnLTWiKhiz4HBWtR18XFeuBR+S73IxvHxbGV9wF03p1efSzz?=
 =?us-ascii?Q?4kpBfysl8g4a8EqrmNAcoMLCZspcBoUtYprO+8ZpKkTRiFG2XTX5H+EC8ZSG?=
 =?us-ascii?Q?9RAQWa4n4LTyUQYTawSgNtxNmtO+SA+oXdLc8SpFM0M4Nv9AYPOkV/JDeRDT?=
 =?us-ascii?Q?e+RvAdEr6ikiZdV+mioegeCIs6HbPJMX1BA/NyVSG2oIvm87e0eduwCs4t6l?=
 =?us-ascii?Q?jGwjNsOjKuR+6XFdUS8bRKaFI4kktflDHvTDU7zSCfOxcWYjm58XaB8tjoNf?=
 =?us-ascii?Q?4JTuCsK6oHO2Z9UV0kNQKcFu1hBDZ/eQyK9uzhljDmjmXid90SyqFvfKfUjP?=
 =?us-ascii?Q?Wf1TsGNegu7LL6sxD9GLkG289ZAHPgCYYFrFwySiwi+6a3PgWYvllGx7X0vV?=
 =?us-ascii?Q?V83bvtadeUOh7cDdeU/7QUejgE/m2DDy7Ix216osFqSH7t4utSx3UuaT99DD?=
 =?us-ascii?Q?BrGtX8cnCS2j+tfIejB5jA7ElxZjKDNkRoV0ZwNa11RQyo9Zn5VnmGSW+DJP?=
 =?us-ascii?Q?ZgOjUymMO8lqPRMC/5lF3AOFRpkd93QS0t/xycCyjoEENH4HGgnCUaNQP/H9?=
 =?us-ascii?Q?0wC6i9N/Ms9BRJ/HrAfu0AGG+iLvok/uZWODYaaAAztTemAaJhdWUb5iYyS/?=
 =?us-ascii?Q?vB1Mgk7aThE9N3pipvgP2uzMZ+0+er6XEFszDc9iCLC4YuMF2Jd0Gcugn2if?=
 =?us-ascii?Q?mesxvXrOG/4stSbBQPFHKw+8sxCVMG1r4pRZ6+W/umq9TJum2YNeVw0bxE0U?=
 =?us-ascii?Q?4awRTgji57Cx0eyDEurqUzVn2bK92snQz28XMMkltUkAk22U8HzvSYNtX1xl?=
 =?us-ascii?Q?M1y3hDW6fVcnorjNroW/AlbONlUaiIhxassgA/p+STWOa+u614OOmCXHItyq?=
 =?us-ascii?Q?2b4XfpWJGsPJw4xc5Hj9EpF9ALECUEZzS8RC0uBpDYjT8QnVM+bDxDCiD9QX?=
 =?us-ascii?Q?46ARzNKihSx+D1Fva5x4Js+aLtwYyrp8CIbRGu/QiRGC8lfzIHdkC+Q9saaZ?=
 =?us-ascii?Q?7KwVUE9+uqwKqiKB4vNSvAn64mXTligrXCrQox09vzNOloCleKUr3J9dG7Wx?=
 =?us-ascii?Q?DJSfhWf3wEuJH0fFQzyAytvD4NIlwkrDQTf/fWdebaDL5zwIJXDUvmZOqBX6?=
 =?us-ascii?Q?eSCjy8NeAR/SChncWlBA/bURkbD6g1canu7Ok5AP3A8grfc0BC+Crb33Twbu?=
 =?us-ascii?Q?OGNI5jBCI86X10YmJGEDst7l+3dDUm2gka8gpSAQhx1P9x3gOZC846Ly5hMw?=
 =?us-ascii?Q?rDKdVa3TXHlBfw5i2Qj8Hir5ZpuJTjKg9Agqw5Vyex8Cc3r70XLmVkM0rbWQ?=
 =?us-ascii?Q?sbIHzJ0x2TfDVLqvQ4Vi+dhwlDOmfXWoURhNH0U5aTz5HsKJUffK0P9bsM1N?=
 =?us-ascii?Q?MHtmJHr1Bv/LuqmDyXHvH4s1YSku2o58f/7W1WJ9KcAA6m3R?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: k4HppFwsaTgZgMf/SeWZhN60u6BwQUGc29lW3942zl8zvjiKCtjrRf/e0cZ2CxNFGYNzWJYh2z6F/YtWldS4pUqNMTgFiilERxKMCqgpJbtxoD3p9b98g0dLbvmqLJqk0Nrqid6zXPMgipRpaxxXFRweR4ZV5Oxj8IPDBW1AhMjVKcVi0obuzpfpPhdkspH0sBM1oGnAOyAZa86wYhhhkOWpkAosgbEIr3e8ftYxbSmbA46Z8NMAIOjrhsN7kUW0CbpRQFkBAspoUmg9nAVDiC/LTlFjpQXlT8DMSCV6i4kZmwUf5yRqx5PLlmgmcfZgA/wlcszXx4j0KqLJmq74kA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5ee4a3-5e50-41d3-ee64-08df07fcd08f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 07:44:12.1966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ndmWwFIi17yuO2hqy5Q1Nn3HqfDjtomKHhMwkiV2PTG+6ybL5YTd3Y8PV8W3AkMp4Z8WRg70Tl1j7wZ4UW9wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
X-OriginatorOrg: intel.com
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

Hi @Sharma, Swati2,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: 31 July 2026 17:52
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 1/4] lib/dsc: Add igt_force_dsc_enable_compressed_b=
pp()
>=20
> Function is added to force compressed bpp via debugfs intel_force_link_bp=
p.
>=20
> v2: Rebase
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_dsc.c | 18 ++++++++++++++++++
>  lib/igt_dsc.h |  1 +
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c index 3754eef07..93b67655f 100=
644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -6,6 +6,7 @@
>  #include <unistd.h>
>  #include <fcntl.h>
>  #include <string.h>
> +#include "drmtest.h"
>  #include "igt_core.h"
>  #include "igt_dsc.h"
>  #include "igt_sysfs.h"
> @@ -166,6 +167,23 @@ int igt_force_dsc_enable_bpc(int drmfd, char
> *connector_name, int bpc)
>  	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc",
> buf);  }
>=20
> +/**
> + * igt_force_dsc_enable_compressed_bpp:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + * @bpp: Compressed BPP
> + *
> + * Returns: 0 on success or negative error code, in case of failure.
> + */
> +int igt_force_dsc_enable_compressed_bpp(int drmfd, char
> +*connector_name, float bpp) {
> +	char buf[20] =3D {0};
> +
> +	snprintf(buf, sizeof(buf), "%.2f", bpp);
In igt_force_dsc_enable_compressed_bpp, fractional DSC bpp steps are define=
d in increments of 1/16 (0.0625).
 Representing these exactly requires up to 4 decimal places>
> +
> +	return write_dsc_debugfs(drmfd, connector_name,
> +"intel_force_link_bpp", buf); }
> +
>  /**
>   * igt_get_dsc_debugfs_fd:
>   * @drmfd: A drm file descriptor
> diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h index f63345848..0ba06d8c5 100=
644
> --- a/lib/igt_dsc.h
> +++ b/lib/igt_dsc.h
> @@ -17,6 +17,7 @@ bool igt_is_dsc_enabled(int drmfd, char
> *connector_name);  bool igt_is_force_dsc_enabled(int drmfd, char
> *connector_name);  int igt_force_dsc_enable(int drmfd, char
> *connector_name);  int igt_force_dsc_enable_bpc(int drmfd, char
> *connector_name, int bpc);
> +int igt_force_dsc_enable_compressed_bpp(int drmfd, char
> +*connector_name, float bpp);
>  int igt_force_dsc_disable(int drmfd, char *connector_name);  bool
> igt_is_force_dsc_disabled(int drmfd, char *connector_name);  int
> igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
> --
> 2.25.1


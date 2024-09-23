Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C80CF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 21:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F4010E49A;
	Mon, 23 Sep 2024 21:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kn4DWB/1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615E810E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 21:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727125386; x=1758661386;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iqbZdM4GSnk6W3akwsDTP4gW+dBYAVwiQEfKOVMwKMw=;
 b=kn4DWB/1lyznLHOywbfuaAyv8MZZctWHPwG8w+RDuy7j0Zxmj7zDrzCG
 eSjJBtryuhM33yBJac+sA2pB5zNZxIdp8ubpCMDnNjakbYoObNQpdwVbp
 m8MfYXeYPAuvgeXoSCyAmlMuFu6rWe8DUHt/96J/C81kYfKGdHfY5jYv0
 oSAjFgrprOXMH7cSsMi43a30jsoiLU6hLFHGFu6jP0nyiWg6t1CAKR9TW
 2jVa3wu/0T4VY1Gxwwngh8Ke6tUWBpRKFoHbCP5eUOlHMTFJQUmr8x9o6
 NgQwieFordDJIsJtH0J+0HVGOWoi8UIVrvHq32JvMrX3yT+OSJ7NrgSkG A==;
X-CSE-ConnectionGUID: FO5fRZV/Sf6te6cKEQzRsg==
X-CSE-MsgGUID: Buzw6i8ZT4qNhmLw8Vb4Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29980474"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="29980474"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 14:03:06 -0700
X-CSE-ConnectionGUID: iocHnCiNT9q56gZotwNEhg==
X-CSE-MsgGUID: XKk8xNpvT/GqPnyTIwgvog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71231728"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 14:03:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 14:03:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 14:03:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 14:03:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 14:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yX47mBs/tZP+sVxlt4WMLURR3Urt5XgssKyC+6jJNsUv55MYa5/6tSVo5HQMDNGSbv06MGS0aX2SXokitNO6kz/3aKbgrO8w9JlMdgl9xBBi1VSSYBX5BkvqSDCYoRZVGajjqT6rJxGjQWb0PEb9oq5q9i3RQqRiTxDVvTaouZMCcHf3JFQ5LXBcfehd3QeDWrDrC3ot/mxm2TalHarB9xdSH3YJl4BS5wteaYnG4/bs/3g0MwEW/fBN0uvcMt+8gyo2gB04WAQM9TxcQrXcD/zPxm910eFnwT50858RMkXnbeubjAtHSLvRg5RbxuIbIlOhluT4P0h0UGbYGdGJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vqC/q6ZwUBJFqc6+1OYbMEN23u0j/4lvV7qTOr4QiE=;
 b=tr2wnQy2Suwm0asn+3yF89aHHVCgzlqhJN2xrSYscMdM8rHX2f+IjHF7KuB4+bobviOJ/bIZmaD4orG6Ss/WP83iwU45AkPTMc0VRbVhKGnXyHOuZ/0AG8AZE+8WH0GVO+AcSbHT9HjImwndRaVuifQUeEnMJ+tPQRuQAOJzpMrw0dsPRypHw/BxU3qjKN7WNka7s52E21fF2pv/29n95/fEFo/8gXfCGRsv9wUkT+l/ElXHo872+UbeuOvbX8D2Xvyd+R8bCDMzDPOAS6OMYbR3KZvCux7v+KRuhKp33w3F0+y1iebcvUeDy+3mq6XrO2IOQVWNTogpyMc+47+UzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 21:02:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 21:02:59 +0000
Date: Mon, 23 Sep 2024 16:02:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 5/6] igt: Get rid of AT_LEAST_DISPLAY()
Message-ID: <fpqtwj2aevnrq2viwkjqnuzcku5jxyv6xkvcexsxjj7buqq6am@mjarx46cofle>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
 <20240923204557.32123-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923204557.32123-6-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:303:8d::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4722ec-ea4e-43d1-4ad9-08dcdc131b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HAeh52phIZqIXBTV06Zd7gdXgjwlssscTlwigjSWGz27OK+LMo+hr2IgOK?=
 =?iso-8859-1?Q?igx6oNxYS/Dwxr7Ggo8zCbayIzen3uE+OPqxPU/fr4a9xcg/xBKeqX3wFx?=
 =?iso-8859-1?Q?iKCoCJQKOL4z2+3F7Qm+U87tyzp1Zdb8YsFKUy4HjLsfe6OrS9YeuZqiYS?=
 =?iso-8859-1?Q?lRRpgWD25VyFdDFUsAsvRwBS864d3ysVLYqyAVx6kUCzkgHgcJiUacYevm?=
 =?iso-8859-1?Q?YPuJ+U42ccr5+DzbPH9+TsENQgQhpqAuq37vJiWygsbRBYEw3WiAoPiiGW?=
 =?iso-8859-1?Q?kLaIrRtu7U3vkbxvzJOT9k2IF8ycadobsqsLSFjCmqsCRQOgBNPb1Rjhu/?=
 =?iso-8859-1?Q?tMwjlGrHkvhTMbSimk6AAtALMbKiz3OypTSGSEuHz/i+Jlw4k804LDFwIY?=
 =?iso-8859-1?Q?tuedE1XfooKtZpwZHYPmvrm4uWsS5Maon/oac/KSAwWu3KacVEtSL0PSvj?=
 =?iso-8859-1?Q?gg/O1UPKfA7F3F0MTmCe+odFCIQwKpE8P22aXrd3h7L2SpOsjYwSUMwDnj?=
 =?iso-8859-1?Q?HLcxJp1SNo8NwqYM274nzP+pu9WDAobpUdeyaN2MYVP/QiCDeGXcVxZSRP?=
 =?iso-8859-1?Q?reV2ED62GIAyv37RFNRoE9K+ormRQ8+QFAI1bwlwS0e1ipNVbfJsoKnBi8?=
 =?iso-8859-1?Q?HFsiM+0Ch5QkORHEQY+Bzm+gTJf5pfFwOOdqyivFWfJwLO90nRFFTuJ7qW?=
 =?iso-8859-1?Q?/SvjGS1nDOhfmvJ2oMQrZA4cSb6L1U/XPtunMjqd4aYMt1WqpPqKouxOWK?=
 =?iso-8859-1?Q?ptv84nMBIHus49oB+C73XV6ngkW+xuOLnYpc9O4/Ha22IfituwRqRxyYc+?=
 =?iso-8859-1?Q?8lqbRR5NkUZ8xnrjkPTPmnwV+NKsYecVoUDqmUbvt85h8Viy37tCia8mMl?=
 =?iso-8859-1?Q?un88Oe0SjxKoEY3RLxvCIbLszvtVN23aMAj7D2XjPw/LQNRgV3//p6pkDu?=
 =?iso-8859-1?Q?7UMs1OD+g8Sr0+vlxOQqlqoPuBgFOoMKPbtG5FnoCfCqjMAKir4u9x7UsY?=
 =?iso-8859-1?Q?TJhvVuxS6VpkSLFSrBBwH1ti3f95lyLck2pAUf9MWQmE2mDB7X5PRN/re3?=
 =?iso-8859-1?Q?3sJyQVZjsepBtvdLAvEMhIO8oaJHo0+P6C0hJpYQ6AIzpTVE3lYF56p/6Y?=
 =?iso-8859-1?Q?M6h1+dCrWE6+/7uCd7ZqCm0WAQi5UdpZL/W65CwBaiEjZ2gNdwo1+cLm9+?=
 =?iso-8859-1?Q?d7/CbzN+3q+gdGR0NyjEmdMBcDc8g2KWnHcJv6lXEghGYSo+wIkuN8Ba/s?=
 =?iso-8859-1?Q?tuQZ49YHrztiYByybncmVrVrVvt+WaJR0sdfgNK+KBAXgY3GR1DGyksPyq?=
 =?iso-8859-1?Q?k4VGb4IoSpu4ooOXwbTJdJta5Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?piFhYfCQVtT89MwkjBmT9TF7KbGsWyRkxZ1ERf9rG9gFiZgCXZYBo/8Ohc?=
 =?iso-8859-1?Q?3QxxQFEaKLeca1EmMpCZaCy51x2oSFzaM+ar42Wj4h0BLy+rrx+c3sddg1?=
 =?iso-8859-1?Q?w7++d7g3Xy0MuJZCgzMGtUHOozJLf2TBkx60RIt5zMHWRiuXBlCoKvakPm?=
 =?iso-8859-1?Q?q3We1UV6CxCrNTs0ziyUBIdurnQRiUGSaD7aousQhhn4KTybKqiWeV4Ovg?=
 =?iso-8859-1?Q?R0/bdUr8GQIglrKM1dZE1xrY3EPqCVOhrWJvlvvCBZ/H0vb5j1RTNLpdq5?=
 =?iso-8859-1?Q?DRWDddYXbilMeDZMzsplteh4Sa5XrnuQydAasCp6vVWJFpB2olVyVNgECG?=
 =?iso-8859-1?Q?FdBlRWck5WiYJjNvbq/B8MeTq4kIQXQ/hXqBJZav2ldVOVBYmvoq3VrzDk?=
 =?iso-8859-1?Q?AvDTVGPeb1b1vuIxJqdi7rSJ01husGVujAZzpnKT0ed2uE+iFlvxrtrrOD?=
 =?iso-8859-1?Q?X/mfJmKCrCMY31J1B3LzdWDfek8jsZ/RbMhKvv7OU35jXc6vNYw9aae3sm?=
 =?iso-8859-1?Q?4zJUBRZq5uv51xa1e3PKjBQezw/OFWcdtN6jEo6d9czwQZFF2mU3034m+i?=
 =?iso-8859-1?Q?3WfNNAG+d7cuZ9sM/ROHaAwS9Qy63XPQCNvplLSzHysJ6n5c6YVcOrSMSw?=
 =?iso-8859-1?Q?qvMJwrAnrZIBIdL6F//ITqTkcJVCzoB8I6dmFgFK2BIv5GyECki3R2JSKW?=
 =?iso-8859-1?Q?EkjztfBBzgnee3j5k1uQKkg7N2l21USTsAiIdS/hs8SCNe8g14E/P2ucyU?=
 =?iso-8859-1?Q?y1EYpw+b9dT6u8RduWPwxR6rpic9Rikw7DisLwVyH5FfwZ9rEayCdNItg7?=
 =?iso-8859-1?Q?BXTshzl0ZADhK2uRzSm4XCNitxvoDqOC85rYt0oDlq8Ef8Br/JkN4/c2JL?=
 =?iso-8859-1?Q?G+wDxqmA6d9adJ9rqB1so1ykCOfjPSld3uqdg7bWSuKkEOrx93ShNAjDnB?=
 =?iso-8859-1?Q?Kh9BN/8G+4PAtYL3+8i1Rlu6TM6Hc4tsnf7c2tchBUQ9VeyMtxhI1riaRF?=
 =?iso-8859-1?Q?tBYdGy+RGqHSRVQw4kmb0wufO6qfLZ4E3SIVf3RAP/naGloPEGzIbSP6Pf?=
 =?iso-8859-1?Q?pI2/58lUxhWFRLHIWSaN3HxsUMXT+ggMq4gbYad+UyV1b2k2JzljczXFXg?=
 =?iso-8859-1?Q?cX9LuQXAU46qr+1xXWOi8TuSdGNDUgKsuAiYr75p7QJAdFd9flKdVtDSIN?=
 =?iso-8859-1?Q?VDYyG121Y8NKW+uIPqPv/AudKR2dBnAUjl6C+3uQNA53+iEE8QmjWCDXQV?=
 =?iso-8859-1?Q?fEDVHbmUfWwqwMmmHni1192IFu224tfmaIzXc+BApFChjevv3ZJrvxzQvO?=
 =?iso-8859-1?Q?Vsi4+u4hbfe3l5As9nZDNxTdpAtssz50Rw9e2j2R8FRMugAyqdWwYlQ35I?=
 =?iso-8859-1?Q?TeXqptIeCNqTqDlAcL3+fza9QbAxh85mPAI+RyD26t7lN0crtmi6tYsEUE?=
 =?iso-8859-1?Q?0TmxaNSDiB76CXtExXdhiA02OHf8RJXQ+n0j1WjDWwHl/lSWj8wem6CxSc?=
 =?iso-8859-1?Q?MB7IpnCD7eBC0qdDY3bft3ue7mD8VocQSYPECHYSDOptGJfXHawNfUoa3B?=
 =?iso-8859-1?Q?1l3/A+jj4x1CsxXJAT1WV4T7q76vYioSimDmR+ZQ8WOpPN2bo4Ll4TQpzY?=
 =?iso-8859-1?Q?xEp7OSCu88SgUn+u00MLLdpWYB2iKWVgpvNXZH+zDXspbYoiZ3MQLqaA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4722ec-ea4e-43d1-4ad9-08dcdc131b04
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 21:02:59.6999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTrLYUbMLnfjN/Id1m1sE4X483c+696Z2hpH8e43SJqMc6mJJGeWPZs/36+8LmpraHns3DLYeO33HemW0v0wudAR0gy6AxUNOeCaE3G6Rpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
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

On Mon, Sep 23, 2024 at 11:45:56PM GMT, Ville Syrjälä wrote:
>From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
>AT_LEAST_DISPLAY() looks completely pointless. Just
>compare numbers naturally.
>
>Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> lib/intel_chipset.h     | 1 -
> tests/intel/kms_pm_dc.c | 2 +-
> 2 files changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
>index 270392c83c2a..85c075a4ad8b 100644
>--- a/lib/intel_chipset.h
>+++ b/lib/intel_chipset.h
>@@ -210,7 +210,6 @@ void intel_check_pch(void);
>
> #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
> #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
>-#define AT_LEAST_DISPLAY(devid, x) (intel_get_device_info(devid)->display_ver >= x)
>
> #define IS_GEN2(devid)		IS_GEN(devid, 2)
> #define IS_GEN3(devid)		IS_GEN(devid, 3)
>diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>index c87e1d4084fb..541e94cb5b05 100644
>--- a/tests/intel/kms_pm_dc.c
>+++ b/tests/intel/kms_pm_dc.c
>@@ -92,7 +92,7 @@
> #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
> #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
> #define KMS_POLL_DISABLE 0
>-#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
>+#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) >= 14))
> #define SEC 1
> #define MSEC (SEC * 1000)
>
>-- 
>2.44.2
>

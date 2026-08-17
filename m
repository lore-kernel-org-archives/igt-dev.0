Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEB4C5DF66
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 09:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8542610E3E7;
	Mon, 17 Aug 2026 09:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVYQi9bs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC9710E3E7
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786958523; x=1818494523;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iT92uvKMuD5caw0R5Qs7WueZeJW1VmHdAg14CBmaj1s=;
 b=KVYQi9bsci3R5xKddRC63B7+yZyirv0qYKKHY609VGdzo3iL37iZd9xN
 MqhzOUwQDexfIb5OWg6OEyYmAwhW8J0L4b5s/TuaQFpWPEbGp1+prcAh8
 E+EnS/bQJLoa8rvRk9YUTKHe7/Pjk8poDyfPBJ9i0sUVs0mUrXLnmlwmV
 wpQEiSaYJS8zWq7FTE2CtE8FkIURte+/VM1IhJnlXTvLJhT+gCssjYjjR
 fHj39JiJJSkSrQXh+MkSg8XeAVMZaBD1iW54uTrmdNX+CpRSEh5WK20i8
 iGgAH2riOOPNPPq1GJHTnuP2iuIkl3ncSvRNgENpaUTc1hshnA9CZsd3v A==;
X-CSE-ConnectionGUID: nstscwjdTk2Cz525f0G5OQ==
X-CSE-MsgGUID: 2CpBzga+TbW5VNOtZnuZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98945331"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="98945331"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:22:02 -0700
X-CSE-ConnectionGUID: GnQT606lTQiWyOCIKnAKeA==
X-CSE-MsgGUID: rwhhgeZgT3eR3VgH0OKXag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="288332712"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:22:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:22:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 02:22:01 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1cXoaqknngiFjJilVCCQrZVa9fkhLaXEluYUG9Q8j4FgS/03uz5MQ7mxrbi/wWDpBj6VF1Prt6TAOUUmkG5mxpG73NIkNOxBAtMVY+lNM9UZfFRi1QPs4Ld3zW3PvcwRDugYkCHKy3njLKK4/P5QEQQhvgnIVBYpHO2WFaPt8IEVOzR+3HFgyicXH4pkyiax/BePThrfIsKySWApfzx4jXNK4yNsNSUAbsrATREVoT9jcdCEQ3HY5i1epMeDQHQpti2DxFOveNzs8iPlw/A5Z8NgaZ3dLOCgrR7Fgag9EdUsjVCVpiMq4pgIkxO6IkxKc1Y7DzpHK/0rf2vhvkU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t0E75Nk/tcHUQTQfLN3eb6Li8dJVJt1pEeOWXqFSLo=;
 b=oknIsGwoSC6pLtrWTlG477eh3SwpTBAWGEDLUOWPlfj9wKzGbbSFI8XxSiy2YKVU/N1v3Rtxq9FRE7eTbsT5v0LHd1A4bfqPfv/xOssmdwKlb2TEEAhZS2BphIEZaAh0BZ7/dRH+6ZNAIIR2y7lIit6bpTukot6BU8bMiOFhV11jPR8G4MQ5hih0XtK6CWmV2slc3jHy3a7s5TuESIvu5vUSa8pjXvdfJCdY1KQJi4bM/uEYphzSKKrHlG1mkaFuS5Bi2H5MazpqyMThv2zclFOzBt1MYfyYZHVsjjYxGvrcgmdW9/qrcBR+2Ch9oGeoGrwHWXL0MyarIMyMqbnpqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:21:58 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0315.011; Mon, 17 Aug 2026
 09:21:58 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t v5 0/4] kms_dp_linktrain_fallback: Add UHBR-to-HBR
 fallback subtest
Thread-Topic: [PATCH i-g-t v5 0/4] kms_dp_linktrain_fallback: Add UHBR-to-HBR
 fallback subtest
Thread-Index: AQHdLiIcLxUxl/dmNkSwdRC8KlAmMLah8euAgAACrBA=
Date: Mon, 17 Aug 2026 09:21:58 +0000
Message-ID: <PH7PR11MB679620384BF43A2B334BD04EE5A72@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260817082612.1101382-1-sowmiya.s@intel.com>
 <6a1c71f29004da4f88d9f6f0c22128cd735ef06d@intel.com>
In-Reply-To: <6a1c71f29004da4f88d9f6f0c22128cd735ef06d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jani.nikula@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH8PR11MB6998:EE_
x-ms-office365-filtering-correlation-id: 6ca7ee5d-9e27-4864-aed6-08defc40fd16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|3023799007|18002099003|22082099003|38070700021|11063799006|56012099006|5023799004|4143699003|10067099003|6133799003;
x-microsoft-antispam-message-info: ueGo0hubh/OArjM9cG8/1+o/i0RxGs8mb+uJJfDQbBdDwxWiPrKvt9BDagxMtStry00XagTzx7y7IQd+0YQSTCL3yimhJplcMycLyMn0nCcnsmwLJBdKxYLOfCgHQBBLOcPXVS3SSfMsB+B6O52/+jR+S684tqMa8w+tbc4cSuomOi/c9yrc0ag2rbs6iK1UxU4q5+GGlsTQJKV1jDsXsC5cA9T8QJZkD6gdVdTAgaJ1fCPNRPfAcFpHU9REPpAgt52HZ/fCTDabOBb02ljdGPHLtXWyoTw4EEj+uzsYbt4pWPDmxV1qaMjoLvbvx2WEZNEK7qJabwqroeBfSTMwcqzAhJXOms8DML6xtzX81a2D85eEmRwqI7scp+szRUROO2Mw1eNDQA5wEWWJjgvl4j/WHahJqF1Qjx65ut2TH5f2yZVNclsKX6H+ci1tQGEKFAM5IxrFbrfMd3uSun8Cp9mGDvH4Hf5jXh68rjmVfvVR78afwJ2UpWja5zopdybl/QAF2Q/ruFC4X6iBtBqgkHqrcLXuunOftA3DXVP/87tbtpJDbBEVA++P2NcUPF8OGrHfLS4KOC5BcCL49O8otlifHtwLpcP9H12SIvFGrxQlzE/yA1jWbticdfVkBJtGQfCPmPpRjPaUncTUjAEmlQydgQ6Z0s1XQ3DWtEVRtkwadNdeyUUWQNIQmXmcdfdy76rGEeZW8JxGSI2vnt3E6mS1SuxzqcH1sVlVF+8kfF4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(3023799007)(18002099003)(22082099003)(38070700021)(11063799006)(56012099006)(5023799004)(4143699003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sqQrNXBYaJ57KDvDZq4ZUyx0aFT6ED65anD96fJArUsP10lbIWtdgUlzrxW6?=
 =?us-ascii?Q?qun/moGz/Z1jsNiwswpdrqAxo7qeW60OpofHCNMmuoVvzJ5ncpi/39tYQnVX?=
 =?us-ascii?Q?2gggcVNzg87CnatnpmdAQ+nViAJKWZH/llkS7baXyE2ah2sGlNY/seDlAsoT?=
 =?us-ascii?Q?09a9NIoKjbpyZvSiWGjWChvBoOTTs9r0Z4WYiLJB79NJGCCYmqxpB0250VRd?=
 =?us-ascii?Q?EwPAd1uua1B35sduPOGI2BpmqoytpsL11YggMA+7v5ur+Rmn8NHuh1Hk3Cgv?=
 =?us-ascii?Q?EW1skmn0/7iSFI3Kkp9LymmWGvVZky4crNUoxFZPNfgGWlHUViWx3Nrv4c2f?=
 =?us-ascii?Q?aqYp1r35tbT+yUCSg/3V5vibdd4dQeDcS1EGnAG9/pC6nhkH7vIBq/rqPIIg?=
 =?us-ascii?Q?+4K/W0DM14RS6GBTblV7Wl8Wxze7OOjnpsMNGPlCxpZGKX/jJ8SUqbuA6m0C?=
 =?us-ascii?Q?1QbiA9my4PP+Nz3HGJuxPajXZ2pKMUoYR2hB5/yNwo8AmnPvukwTf6tgM2z4?=
 =?us-ascii?Q?w+cGyWt8f4sI6MVZBqqxrdK96v7+4+fYY9OZhq/QNtWDopnIzoyPiqo2up24?=
 =?us-ascii?Q?TipZyO+i747M1f5T7AcZXQANseWa/MpzOCvmzhP8pvXsvmz5JduZXGOKlLRz?=
 =?us-ascii?Q?0ambTP1Hn3i5z4kNxhuPfQMzN1JhuetsvZasxEOWvX9uqkTpzGdESL0V0N9U?=
 =?us-ascii?Q?+RKwmyamHJVS11X8GKP67+8kU24FGt1e/U/nrBEaO0HmIzt6+3KNb/lpxDjy?=
 =?us-ascii?Q?3RKFKsr546P8vbfB/XMDz45A+0xtwDFrQCvtaONhs2k+0rM6mgw+E2MTOJ12?=
 =?us-ascii?Q?LCtsNWL8oeZEyS/1W1Hbx5TQ627eHCBjlPaeWIO893+gtMLpmtNlZqawWgyX?=
 =?us-ascii?Q?8xGrGHaj8Ms41mFcMm9BHNwySwtIn1QKkAbEbF6RxPY56DM8jhYzvkB+aB9m?=
 =?us-ascii?Q?+HzsJLxesBabm0g3TbbqL+hYEBiF962aXWNujPOiQbZjmMjPpGhVEa7PQdfE?=
 =?us-ascii?Q?Fwg15uxbvRbYTkQAutobYQR8v3xw8w1ZT9GWMghn5OPCN5bGKkTP6wHIgtyB?=
 =?us-ascii?Q?a1oqYnPBkBnTxvN9RuJJ0846D/k+PcX3Wh+eu8SK1iJozwGGr8J7Pg1JMU1L?=
 =?us-ascii?Q?SxuIZdu144IT5lHM+FU08MjO7C+8lwxwnwPpW3I+VxMzNVX4BKppUTP/46fF?=
 =?us-ascii?Q?iL5EM3WACkB2spRivn48Zl8NfG16cDb5uOfvUxJr0We859k2/P6UViaNWI2h?=
 =?us-ascii?Q?c5cLr6PxOKCdgfY/OaHU1a5m/FElN41teImRvp7gM4OQWs3rwCJ8Ma+YoQiJ?=
 =?us-ascii?Q?nqH8j/GtZ/HBIpsfPeUJl8fz0L/VXNiJUzDZZb823FtweKr2NXPp8NvfNOZS?=
 =?us-ascii?Q?AMp+YTC9Zo4DfjGyuFKy1apuzrUX8tBnMsqaWw2JyhaWHqdxrv+t7qjbS1wc?=
 =?us-ascii?Q?zrQIHelix05NKqn85o6hXnRJmfb9Yu0e/+zzizu8ao6HSQKogLV+7mMqRxMZ?=
 =?us-ascii?Q?D31BJJiz8XSMIvGWwaFh0zIFQklksjmoCDsj28cmVyPGbqeLuRsEUFvnokh8?=
 =?us-ascii?Q?br8u7Vagtgu91vcFD213nyMnwNSBvDvwqD+7BMb7ELXwLWKznzkn5fbhm1Kt?=
 =?us-ascii?Q?GSE6783X2ThIh1w6a70edjqHY6HMkSCz0U+znuh1GEPvUe4D3WtW+mgFLCIC?=
 =?us-ascii?Q?GWniB1W9wEvonWXDxREjzLl9LQkAxhu8tIE4HueiIR3+ZqC9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Fjx2KLfhWTixTFq5bOnEYlHPEsRxx2O/8ABVzNYLJ6rUhbu7ZT7BgtW+aMzuns59z+XMCnNdwTYh4RwpMwA6MKM8RluOSkWiSrPDlPIMZL5t/yVVCTJohyILbLoH7dBjiHTIklwwylJQgol0g4v/2k07ldD8t8mVlYaKvbjO4FuFapqMv3BR/zJ5Q6Ml6DbkymbeMz/yJgWN/Li/52zp9YGJXWmI7UoxFMJWB48agVQwyqrd+KLyMgk9rvccDvsQVtdr0Rnej09m38iDSFVRMn4ueN6lpNToc6mILZXl9RkBVJbJmGKhaoi619FubTE+ASr052kq3bcZWjlSv/W2LA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca7ee5d-9e27-4864-aed6-08defc40fd16
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 09:21:58.6947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJENW6nh/zi0swFstfLmH7aOiY61a3GWRBlg6F0pX1exDp3MtDF9EDLAOnCe46Kj1FeUdo/276ygEgCRld0yjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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

Hi @Nikula, Jani,

> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: 17 August 2026 14:32
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: Re: [PATCH i-g-t v5 0/4] kms_dp_linktrain_fallback: Add UHBR-to-=
HBR
> fallback subtest
>=20
> On Mon, 17 Aug 2026, Sowmiya S <sowmiya.s@intel.com> wrote:
> > DP 2.x links use 128b/132b channel encoding for UHBR rates
> > (UHBR10/13.5/20) and 8b/10b for legacy HBR3 and below. The transition
> > between the two encodings goes through a port-slice reset on the
> > source side. The existing dp-fallback subtest only covers
> > 8b/10b-to-8b/10b fallback; this series adds a dedicated subtest for the=
 UHBR-
> >HBR direction.
> >
> > Adds two library helpers to lib/i915/i915_dp:
> >   - i915_dp_is_uhbr_rate(): mirrors the kernel's drm_dp_is_uhbr_rate()
> >   - i915_dp_get_next_lower_rate(): parses the force_link_rate debugfs l=
ist
> >     with proper strtok_r/strtol/errno handling
>=20
> It occurs to me anything named "i915" is misleading here. This is about I=
ntel
> display shared between the i915 and xe drivers, not specific to
> i915 alone.
>=20
> BR,
> Jani.
>=20
Agreed on the naming being misleading - but every other function in i915_dp=
.c/.h already uses the i915_dp_ prefix (i915_dp_get_current_link_rate(), i9=
15_dp_force_link_retrain(), i915_dp_reset_link_params(), etc.), and all of =
those are used by the same xe-capable tests too. If I rename just these two=
 new functions to intel_dp_* now, the file ends up with two inconsistent na=
ming conventions side by side, which is arguably more confusing than the cu=
rrent single (if misleadingly-named) one.

If you can confirm, I can add these two following the existing i915_dp_ con=
vention for now, and send a separate follow-up patch renaming the whole fil=
e's API (and called from other functions) to intel_dp*?=20
> >
> > const char * signature for i915_dp_set_link_params() so string
> > literals can be passed directly without a writable-array workaround.
> >
> > Fixes a pre-existing bug where the file-static
> > traversed_mst_output_count was never reset between subtests, causing
> > all MST outputs to be silently skipped as "already visited" in a full-b=
inary run.
> >
> > Adds the uhbr-to-hbr-fallback subtest. The subtest pins the link at
> > the highest sustainable UHBR rate (stepping down if the cable cannot
> > sustain the sink's max), forces repeated LT_FAILURE_REDUCED_CAPS
> > failures, and asserts the rate drops below UHBR10. MST topologies are
> > supported since all siblings share the physical link. The existing
> > run_lt_fallback_test() is extended with force_uhbr parameter to avoid ~=
45
> lines of duplication.
> >
> > v2: Resets MST traversal state per test run
> > v3:
> >   - Drop "exercising the port slice reset path" from SUBTEST descriptio=
n
> >   - Revert unrelated cosmetic hunk in setup_mst_outputs()
> >   - Single UHBR capability gate using i915_dp_get_max_link_rate()
> >   - remove duplicate gate using i915_dp_get_max_supported_rate()
> >   - Fix link rate log units (10 kbit/s, not kbps)
> >   - Add igt_reset_connectors() to pin-loop early-return path
> >   - Replace UHBR10_LINK_RATE define with i915_dp_is_uhbr_rate() helper
> >   - Replace open-coded strtok() parsing with i915_dp_get_next_lower_rat=
e()
> >   - Hard-assert "fallback not reached" instead of returning false
> >   - Remove dead traversed_mst_output_count reset in run_dsc path
> >   - Merge run_uhbr_to_hbr_fallback_test() into run_lt_fallback_test()
> >   - Use "auto" string literal directly (const char * param fix)
> >   - Move reset before UHBR capability gate read in run_lt_fallback_test=
()
> >   - Document force_uhbr parameter and "clear the pin" reset behaviour
> > v4:
> >   - name the UHBR10 threshold and make i915_dp_is_uhbr_rate() a
> >     static inline in the header to avoid a cross-TU call
> >   - parse intel_dp_allowed_link_configs instead of the source-only
> >     i915_dp_force_link_rate list in i915_dp_get_next_lower_rate()
> >   - avoid the implicit long to int narrowing on the return value
> > v5: commit display reset before fallback
> >
> > Sowmiya S (4):
> >   lib/i915/i915_dp: Add UHBR helpers and const-correct set_link_params
> >   tests/intel/kms_dp_linktrain_fallback: Reset traversed MST output
> >     count
> >   tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback
> >     subtest
> >   tests/intel/kms_dp_linktrain_fallback: commit display reset before
> >     fallback
> >
> >  lib/i915/i915_dp.c                      |  58 ++++++-
> >  lib/i915/i915_dp.h                      |  24 ++-
> >  tests/intel/kms_dp_linktrain_fallback.c | 202
> > +++++++++++++++++++++---
> >  3 files changed, 260 insertions(+), 24 deletions(-)
>=20
> --
> Jani Nikula, Intel

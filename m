Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2116FD3CC9F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 08:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEB310E6F6;
	Thu, 15 Jan 2026 08:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdRhP8Pu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DAC10E6E0
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768464653; x=1800000653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3h9w5lTE9NtZ/SGUN/6D5qhsvM6Q5zhSqNFwuAuUA58=;
 b=cdRhP8PuJgff4TMZSeCgkUM4gZCi/z2I1BeaoOSYK3KZWKJX+FHQGnbz
 UuyQueWENhdyw6/2hBZFCZkE55iFbRJCRbL89nuMbbitLV18n924PDX/4
 wl2h65wAvV/jnA9F3Vo1Y/mDctIQR9dGYnV4acYvzJ2XcPtKzNDAtpDb8
 Jx8LZAh/I3QgeQF1P6M/bK8Gv6uvBnfCvXG0jqEE3GrpPuIV1/HACSZ89
 Wk9EG+y1KX4WVo9Y6kGtclxYvHGX009pa6plI64Q5MWVEWE/2FkTpOOCi
 rt0CMkC/vqZtOco1JZMU10UNnPNCBilbNkYw4H8XnC9O2bMkombU+U1b/ A==;
X-CSE-ConnectionGUID: vHg804TBR12yg12DtTFp8A==
X-CSE-MsgGUID: CplW9sH3QdKYmN7bGYO4Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69825312"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="69825312"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:10:52 -0800
X-CSE-ConnectionGUID: zq0JysLLSbmgIFethMIc8g==
X-CSE-MsgGUID: dHWHbAmvQyOTkqJSNoaoqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="205407665"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:10:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:10:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 00:10:51 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:10:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZDj2e6cSThZMhNklJw2flYVHjYX3iBzkTYQ4TXR3lihyQH3JA0IZPCTDUqHvDC862dt1X40JMvkSnzKc02azlXVFCTOPQwxdWUCLjCY+pOnR1AuK1Ac9CVvoFPzoNDoxJrWQdY3kzaDxX6PeFrUC2jaBK/JhnVFAmsUsjIUKk2NzVNnEjhQMecICHrmCpGfzoL71x9sdlQM8JvDztxFk9UdmFZu8oFw3DaleSmJr5z97owgFrHmCWLmqw/XjW4NO46ksGJBD6i40AQELZ1LEjTN9AZuHQrobl3d3YxvKlinyrVxAvt52jgxuXXtj/r02MEr01QBquLcF/o4/D1GbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/ZCegIonf7cDSX1R/YHDJLWEYrwS0zefMkHiMgsVBo=;
 b=O/sh2VNTBPW2Ytg+8GInDw5kilH2JxhAn49EfncPXVQa/B3clXi0C5Vl6gtYKl/Oic4dxtDcDoTZYGChX9rxoC0LhKveaauP/OlKbFn/3Cz951l2qUMW+T81OWe5HQMTIui3Lc0/EkqRYTCe+g0q44oXviqdfTO26atAO/l6BN57Jkhyh12Zi4ktzhv5sNb5rhYIAnQ7iJu4RtE1p6JUc5dDOQCfYiSryFxasWvok/3FHdMF8B5B7CGRDwD4PM4s4SE069nUpHfG9wGuYiQu2V0LSVTA2O5D/bogqWPm74lMeQGzTJk5y7P8Wxnv7YltEamJbiaqezTHieotNCVIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 08:10:48 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 08:10:48 +0000
Message-ID: <e2494309-02f0-43ee-8f71-c6d5c648a887@intel.com>
Date: Thu, 15 Jan 2026 09:10:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 05/10] lib/igt_sriov_device: Add helper for PF/VF
 sysfs path formatting
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-6-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0091.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::20) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 68eb3faa-c7a0-4849-4d0d-08de540d976b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDU1S2htZHdwcitqUG11SlU4TkQ2TnZseXhMRzJQamdTWFhDMUIzRGo3RStD?=
 =?utf-8?B?N3hJa2dNSDI4eDkrSWdiT0J6N2xkdS9ZNS9sV0ZGVFhVVER2UEswWnlLbUNM?=
 =?utf-8?B?WkhsakluTEdIay81RFk3MlhwYi8zWHJGbTdFakZHVERNOUs3WHp1amdZbXFp?=
 =?utf-8?B?VzlLeWNWaGk1MENjU1QxWUVkanU3K1o4L05nUVhqUjRQOGlUSERFK01hUnpP?=
 =?utf-8?B?NXBnVzNRdUpyT1h5RE9COXBnb0R2TlNkdk9QRmg2L1RVL2JQTmNuS2ZFS2cr?=
 =?utf-8?B?QVNqMmNPOUNhemFrcnhET0FUa3lDMDhuaFhobEFGdGpyajQ4SmM4c29qQWo5?=
 =?utf-8?B?OWVkYkxIaUJEOUhMZVRjMVdRZ2xSMHZrMmhDSXlTbHpjWXRKbkYxemZmdHo1?=
 =?utf-8?B?QjBXSlFxRFEwbXZUc1F3Vzl2VURSU2ZQTFJ1czJ2S0xJbGdOUUZmeXpnSXBY?=
 =?utf-8?B?aXFYYi9JclpHVXNTUDJ3S1I1Vktnc3lKRkpZWThGUFMwVER6blROOTA0SGRJ?=
 =?utf-8?B?RTR4NE5OZmw2QW94UW5lZk51Q3htcG56Wm9nUjB0L29PNWtPT0dSaTJ4RmhJ?=
 =?utf-8?B?ZGVJWjQrZGFzQkUyK2c2QmZhSDhLb0ZxTWhxaHhuVU16NWcyR1pOV0xCWW85?=
 =?utf-8?B?a3FicVI5ZDY3YnZQZ3pHTndKVTBEM0lTR3JmU3hUc2crUzJjUmpJTE9aTEVP?=
 =?utf-8?B?cmFJQkpHQzVsQ0lTQlhUMzhmL3dnZEJCRkw3NjQvVzBlUnpKOS9yZld6Q2Rj?=
 =?utf-8?B?UzBna2VGM3BuVHo0a2YrQXhZdkJqTkJDMGdrVDRtYlIvQlFJd3hmRDdQR1JW?=
 =?utf-8?B?a255cU9LS2FvUGpobDBjd2lINVVTaHc0Y3JNZVdTNXdFNGU1YkU0Sjl3VGow?=
 =?utf-8?B?QlllT2c1TE0zZjU3YVVsbjRFb3ZseHFFMWthVndVNTF3QUJPbnZlQ0svR00x?=
 =?utf-8?B?RE9vN3U3UlF4Qkt5Tmhyd3Jid25yUklMSG01TlJlaEZJUWlQV0ZrT2dFYUp1?=
 =?utf-8?B?M2pHZU9YUnZndFhBd04yUFRZQ0o5cC9qTC9MVGdOd0hKVHBHOW1sU0pURGdy?=
 =?utf-8?B?eXVjQm1sTWY1dEhWV0tSdHh3T1oybEZVWVFyMWx4NVdrNDJpaXg2eDM1Rnls?=
 =?utf-8?B?eEhubTVpOTNNK21TOFJRRTRoYjdqcFpUY2FQcktkY01mV2t6TW8xLzNQRFdS?=
 =?utf-8?B?OXp3TmoyY21XaWsyUC9BVnpBb1laYzBTdDZYZ015MXJSWkNFVitwWE1JajBI?=
 =?utf-8?B?OThROGxWSmZlMlRaQkR4Um9sWXdnZkQvd05IaHJDOXdoVU4xa3lqN1J4Q2NY?=
 =?utf-8?B?UVRLbGQ4NjZIaUZTSVQ0Y2M4TUZnVXJEc29RR1dYZG5RejlBMkpZK1RieDdM?=
 =?utf-8?B?SHBWRGsrV0gydTd5WjNBd2FWMllhbFF1cUQ0NWYyTXZoYzZZYThwQ2FLYjQv?=
 =?utf-8?B?dFdoUDNiUGVtdFI1cElMcEJjTVBWN2NQSG5Ibnh4YjhsdDRLMTZwRDFLQ0cv?=
 =?utf-8?B?eW5BVGhrRFBZRmdIKzVUdkNwSnpvZDhqQUtqTTJsU0p3UmU4dkRkWkpwOTdN?=
 =?utf-8?B?UGpvUkFQRGlMQ2VyanQ3SXRYZFBMNDFXazAwTEQwMUkvM0pYWmZvNk1RRzk1?=
 =?utf-8?B?dXFINmx0RUZyVzd5SkRSOHNkdkszWUhpQnMxZ0ZPWHdMVjdtWVJOUW45S0Fu?=
 =?utf-8?B?aE0rb0ZRT09oeEQyMDdicEppdFVxMDlOcE44b2tKQndVbUpwRklQQmRPbXRm?=
 =?utf-8?B?clMvaEIrL2hCcmI2STRhQlFjQy80bnl5cGNKUVR0elpJSThTei9YT2JZL3F1?=
 =?utf-8?B?U2UvWWJNVSt2TlZGS3BLMFJjVGlCZ085ZlJGS2dNVncySytET3BTaWx6UlpD?=
 =?utf-8?B?S2RjYU1ram1QZENNTzBLOVNhKy9YZ005aXIxaDJaU1ltbmliYkRVT2kwcU40?=
 =?utf-8?B?TzZVTkpJcmlVbnpMejg5Yjl3RGhXWWNOaDJiOUJuNFl4bkpoVmF6S2NkaEtI?=
 =?utf-8?B?NmZNQ1FvN3N6RVFkOEdDSkJSd012cjlRcGJYN1Jzb0YxZ2o4N2VmOHRFMita?=
 =?utf-8?B?NHUzckZqcUg3dUJkakhEa1g2bmFTQTdOaTM5ODFSOFdXTHRFNExuWUlOSEdx?=
 =?utf-8?Q?AbPg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3hHREFRa3NEOTlyVEpyVHhXcjlNUTVxYnRCcnJXaGJaT29JcmxHWjhIRjY2?=
 =?utf-8?B?aU5hNkpBcnE5cUY5VXpsK2VnWFF5M01ZbzhFaWc5RzRJU1pheS9maTRyM2x5?=
 =?utf-8?B?UGs1WnJKaDZZQm9mbng4bEwwaG9HcFJnd3dIeU9OM096ejBsdVF4elVRdmlH?=
 =?utf-8?B?Wnp2OVNHTTZaMWdCb0VBUE4vTlVVRnZhS1N5cWdEY0NkbEtMR1dWY0JyWDBJ?=
 =?utf-8?B?Qll6RlpvYm5VNlNVRndKQ2h1L3QydUovT0wwRWNiRXc5ZlVnTFlvcGwvbEdx?=
 =?utf-8?B?cy9udXRBTlpMNTlna09MWGhPRHVBTHNnQm83QnRQa041Sk5iVWFQdyt3U3Mr?=
 =?utf-8?B?ZkdVZm9MVWNIR2cvOFllZGc2SVFUdHovQWpNR1lla0JTeVc3MGhYakY5bVZi?=
 =?utf-8?B?ZUtraloyMzB0TEJTc01reVpXZ3h1Um43MnVheHRoZU9MaFdCMEpKdTU0UVFF?=
 =?utf-8?B?WlowV1kyaTUycGNETmVNTzF1dDlVbVZmVUFTRG44cFBtRzJSdFFpVXV1RVp1?=
 =?utf-8?B?QmtCT1N5bDRoTkNRQ3hqWUNhb0dEVWJMaUswaWRnemVlQ1V3aXdOR1N0ZEVE?=
 =?utf-8?B?SGoxSklFdXh5STFhWDZ6ejlxODdDOTB4TGdiVXFPMVpybVU1ZWRNVXZ6TTQr?=
 =?utf-8?B?bkxNeTdvZ1dIRDZxeEhXZnBNV2VqUlVtcWUxNTVmRG1xVUpSK29ObDlyNnRX?=
 =?utf-8?B?NTBHNWVTbE4xZVh5c2IyRnhDL0lVRDNsdHBlMGVOb1psSm1yaWlnMXVKSjFx?=
 =?utf-8?B?a082aXhIQnFpalVtcjdnOU5NNnU2d3ZRN3FUdk1qV0JxUU1aclI3aWdkcTJ1?=
 =?utf-8?B?Nzd5R1oxY0pLbWZ1dDltVDlYdXRtRk9MUUQzRHBuc1Z6NW84bzdRa0VoK3Bh?=
 =?utf-8?B?THlUY2g1M1JscmlDU3QrUlVhZnhVRWFnbE01cTBPYVpGN0FtVWkyMFZhRUJF?=
 =?utf-8?B?QmNVZytKMjVGWCt4SnBnUW1pNmFwbmtIOVBiQ0o1VGtSNXdCNlNiYU5ZVUpX?=
 =?utf-8?B?ampDdHhQZGZuYjFHUGVTNEU0YXNjSFhSdDBPSHkrb0dyR0hTLzBPR3hBU0No?=
 =?utf-8?B?Wmt4SmJOb1NUampzSUE0VU93YzgwR1Jvd0FLUi9YcWVFZis1V0pFTVBBeVlK?=
 =?utf-8?B?eE5uMTA0OTFVLzZxVVVid0J4Vng1UjlaQlEyTUhsdTFUMUplNTFUOEhzNTYr?=
 =?utf-8?B?Y1RoMDRIeDlERmhTemtRUzRTQTFUZTh0NEc3MFNhanU4OVZPZDYwQ3czZUIx?=
 =?utf-8?B?dGJ3akliekJTY2ZvV1hwd2ZPTHJsN0NUcDFCNDJGR2NqczVGbHpLUkNkYjhR?=
 =?utf-8?B?UUlJbGl4UWt3QllHSjVxeUhKckxBVFFaQThram91SjIxbkpoV1JVRUN6VUgx?=
 =?utf-8?B?NFJTV0VtanUxQzUvWnZRMlZPeHNtRGsvN0VvRm90UnNIZStpdzRwTXRlbVZ5?=
 =?utf-8?B?Q3pmTEFpeERaUXc3U0V6a0h1c0lNT1FUc0FvSWRyVGNzOWFibGl5TFVlLzM2?=
 =?utf-8?B?MWRHSGxnaHJhWEJMTjFRWnFjbjBBaWh3Y1Jkei9mekhidFU0T2VLL1dGVElD?=
 =?utf-8?B?Z0JrYnVYdnNvN3ROV2tQeWZLcWxBNjhIM2xXV2swTEtWV0J4d2VxdFpqamRs?=
 =?utf-8?B?SEtQS3dja05JaTRFUjFqcUtYMkZ4UlluVTkySmg3RzlBTG9aL203aHJsWlFa?=
 =?utf-8?B?MXM3c2VGenhYQ2t4UzVWbEJrSW5KdzlqMXdubkFzSHA0K0wxaEwyTG1hOWth?=
 =?utf-8?B?UHVIcml5cThDQTdoRkxZemIrdTR3WjVTN1FjQjRERDc5WkhWWlpxOGF1bmF5?=
 =?utf-8?B?ektqbUNnbkdObTNsS2Mvb2xOWHhTVlF5RmRCY1dQek1kYUJhMy80aU9DWm1M?=
 =?utf-8?B?bnhNZ2VYSVR0L1pCQTFWVUlKek5zRHkrNWFGMVdkY1JsTDByQ05OQmhFNUxk?=
 =?utf-8?B?bkxNMTR1UkMrM1p3VU1xNlZyRlVsUU92N1RKRlNSdS81TVJMandnV3p1eC8z?=
 =?utf-8?B?ajNLNDFEWjRKTHAwcWZ4MEFuekR0bzNzQzJXSzcyMmFjM0tQZzR2UzZMYkYx?=
 =?utf-8?B?Slo0L0FHVnJmeHQ0bWpDam9Ua1VLSSt1TXJRd3F6SWVxMWV3TjlGU1FUa0h5?=
 =?utf-8?B?d1ZMeEdXcm5aUldOWU9tbmJ6RFJYMGZsMzVwSkxabmRZS0RyVVhHcUE1MEtn?=
 =?utf-8?B?RWJRK2tqK050VFpMaGMrZGlubU9rUUtGRWpXWHh2MkpnMDMxNDNFU3ZRVS92?=
 =?utf-8?B?WitWaTZybXR5RjM3dVRPN1FYdUIwcmhyZHNTK0FZMm9OZXdUNTZJZS9HeHZv?=
 =?utf-8?B?NXVBbDdyYmhvOHdOTWI4cXhNR1FtdzIrdE93U1F4alBxaXA4TFBoUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68eb3faa-c7a0-4849-4d0d-08de540d976b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:10:48.6831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSI8gRkJoUmWdm+i3+zDiLP28AxPjIYK4dbZan8TdOPa0/HZ1kEBwuj0iF9TX4T/heVKrw/0MJcbK/nUbSm28g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
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


On 11/25/2025 11:23, Marcin Bernatowicz wrote:
> Add igt_sriov_func_str() — a small utility that returns "pf" for


nit: probably we'll need a function that returns "PF" or "VF%u" some day 
for some info/debug messages. Something like xe_sriov_function_name() in 
xe driver.
As this one is dedicated for paths, maybe better to include this in name 
already, e.g. igt_sriov_func_path_str()?

> function 0 and "vf%u" for any VF index. This helper allows callers
> to build SR-IOV sysfs paths without duplicating PF/VF conditional
> logic.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   lib/igt_sriov_device.c | 19 +++++++++++++++++++
>   lib/igt_sriov_device.h |  1 +
>   2 files changed, 20 insertions(+)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index ffa996d6b..788ffbfa1 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -42,6 +42,25 @@ bool igt_sriov_is_pf(int device)
>   	return value > 0;
>   }
>   
> +/**
> + * igt_sriov_func_str - Return "pf" or "vf%u" label for a function number
> + * @vf_num: 0 for PF, >0 for VF index
> + *
> + * Helper for constructing SR-IOV sysfs paths.
> + *
> + * Returns: "pf" for @vf_num == 0, otherwise "vf%u".
> + */
> +const char *igt_sriov_func_str(unsigned int vf_num)
> +{
> +	static __thread char buf[16];
> +
> +	if (vf_num == 0)
> +		return "pf";
> +
> +	snprintf(buf, sizeof(buf), "vf%u", vf_num);
> +	return buf;
> +}
> +
>   static bool __pf_attr_get_u32(int pf, const char *attr, uint32_t *value)
>   {
>   	int sysfs;
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index 930e97982..84d29b1bb 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -34,6 +34,7 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>   bool intel_is_vf_device(int device);
> +const char *igt_sriov_func_str(unsigned int vf_num);
>   
>   /**
>    * __is_valid_range - Helper to check VF range is valid

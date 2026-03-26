Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D737106F2F0
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 08:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4AA10E9E5;
	Thu, 26 Mar 2026 08:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtKm+uZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D69A10E9EC
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 08:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774512373; x=1806048373;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aFIw6no8tG3y1Np7EFSFbMxTjsEDYju/C8O1VT9vydQ=;
 b=GtKm+uZRO3TzJmTi8rBVi9POmkiXnh2SqaFwXSpZ7me64oldMqg3xIEz
 cYJO8UoCHIdzTUL+MOSooGxtkVMdZje0cU2XjzOQFJi8DxgOsaZ3n8vLh
 uaPh7qPytqULlKyFok67nPERXhSUITZ9ytpI2HmZYZIdcgOAB9xL1ix77
 EZxn+eDimFhGaGWPYBzZiDNZWyxFl3B0zFd4SGkn5lrKrCFXUv9O/6xXq
 IXueF86bXVQgOf5Q3bfW6Gz1xfrNN/d/lbdXMpFwOPGABGoUxtQXnmWWW
 I3g1cKbXMS9Gg+x5zSHE/T2LSbCqsO0Of13OQKaUyjTpdWkU4ycXwf9bV w==;
X-CSE-ConnectionGUID: h6ZIR8GKS8iq8FCC+OIXRg==
X-CSE-MsgGUID: titP/gpEQEOBstPcuCdkFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75450522"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75450522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:06:13 -0700
X-CSE-ConnectionGUID: JelS7PbARo2rE2mUwDSiYg==
X-CSE-MsgGUID: YSF4Ai9hReOFnmIIfpSE1Q==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:06:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 01:06:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 01:06:11 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 01:06:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f92DXjJaLZ4kLLFd8CbWa3tN27fbRnKLJM2/GBvSyFTH80bArYVQsoeOHz1BdIC+GvGvtsqgYbQc4gd1/5ycrPA9LpIZUe+KyjKJb8OpQjICGtxqMUo1kD5WanT6aJZuDJdvG6u85/h6sphQFb+/3uBPeERdsnlF1234lK96eX+XZ2P+8a7Z0sJi28L8PvdLs+kfZA2XrCtwyszR80kZdBkFXp4RCK6/x43VpPiFuJaJMPAe31kqA8dcrDsMO8SiAAOhU9Y1iv6QWd89j3oUOgzIre0zlTYAeP4VDm2NdEwYgim83xOogLllBB7wg5sLWHq5OTBWegfQvtJWRnbKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eegpFyx4FTnrUjFRU4Tih9+8t0+GUQ9OivtlnFuYFk=;
 b=kbwIDpSzagFS6iIzB+HvSb+B3ShjM6muPUf5dmPcYVLpLsZWo6QSOmTBWcNSNSq7C2rPzVjGcENWAuvmghJWeFbDsf51juTihlc6O0WaYwNfZ25PBPrb/X1vSK15UpY0BPKpxIadIUKEjYxnKpfMmF+3Wpd0NlVBjEusmompI7pgzqzwhwBN1LwZ9oPvC5QlQm6kwWbE6Uj6Dh/9u2Z1M0JY19IRkNtgbhZXglVPxfZNJoJcXLNfiFmYoN/fzP87WgUdXRCqlPEWHr9eZn8xYUuYqvEDu/GCQJvfxn4X9pcf+SgGCI559zV6nFJ5iFLINgICdImyBOeuqnLOuR6d/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 08:06:03 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 08:06:02 +0000
Message-ID: <8bb385fc-25ee-4f46-875d-c2f7e1598b5e@intel.com>
Date: Thu, 26 Mar 2026 13:35:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] kms/feature_discovery: Add VRR capability
 subtest per output
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <mohammed.bilal@intel.com>, <sowmiya.s@intel.com>
References: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
 <20260320064342.772014-1-ramanaidu.naladala@intel.com>
 <374b755a-f834-4daf-9b3e-36d171c030c2@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <374b755a-f834-4daf-9b3e-36d171c030c2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|PH7PR11MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c88c3de-7de7-4484-1d6b-08de8b0e85ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: NNjkwBD3uSeDf0xmd4Ny8Yi+GARnUyIYAUVLrxWJUmJ/P6xzy6WUf5grnyNioEKRyeLyByfimGDA2fWM7q8Lt/l4h4wxNqL+dBpCSxYRYFNehdcwv3yxtCBaMh5g92OiaUAv7Q4inswkc/f1Z+rMZor+0HRW4HBJ8LzEE7ZThVr1ACmnjGLtwWHbQHIr/Tk1IPyToLSIcnge6sxBglxZXGfMY6BI+nthn2UQC/UuCf5zL7nSWGuZ+5xkDNV7oLGsMoDOo6yAWOBAXm8CElL7M8s5U7kJxe1SVDGChuEtxBv1ypGgnCPGeD0iMeVKbv0oUSej2qWtmRc/dr+SZySCL7KmFVAnH03rkoDOHYJxUep5lz2gNDX4X6LrM00JM8f4cIPVPZHauxuW/U2AM1SvLmVVQI04oJW4OhX9mcsNq/c6bpdZw6ucCNzbQAiVSlwhTDadrWAvedRDE2e36YdflozpAYnKycmwvZUsFRTobgklkNQae/bi8Fm66lbNFRHu5iU6bSuNTGiVJ6dbOCEzIdESRfiiOzipuUyh3tuJfEduA01kLAx2lh7zrHC2ehHpMl38cRRVzgJ9cDsUHhaWAFfj8UhtS0QlYQA9EzXcWUfVWn22A5GlLWJ4XDyzIPAsyUGhqaV+6Bfv276Mqt1mpNAGiZHi4v+fJS+zajVUnthjn8gmxkJ2rEuOl/OtVXe+laHAxAgMqIHuM6q6S4lfr6YwyyAOVCz5HCAauW6wNgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T25KY2dkeFJldjFZTXU3Z2tHL1hTUXVrSlBkQUlOblJiRUVDblVFZVBIMnRo?=
 =?utf-8?B?cVJ1QjFuTnkwbzdadmQrMVR2bUhTMlRPcHB5SUpraWdUT0pLVG9CVS9JdEZ5?=
 =?utf-8?B?aWNNTWowQ05Xd1EraVRTZTJvS0JOZkFkSENrNk1IOFFqZVE3UGQxYzNXdkNK?=
 =?utf-8?B?ZmR3NGJxMW15WnRxMnQyYXZkeU50U3hCRE5Pa2M5QTJsRVNueU5TbklhSzEx?=
 =?utf-8?B?Q1VwbHFVUXFTUjhVUndOVDZjUnRpWGFhVGlsdmlTem5hc1UvSzBRelYrZS9G?=
 =?utf-8?B?V09tbjZrN2I4L2MvTSt4aHppeXFLOWxTK2xsb1NEdk5ndkVnS3VFVkh1WTAz?=
 =?utf-8?B?bnRHc09qUTdhbVhjNjNQcVBXWk1ZM2g2OVAxRWtuazZpQVdlZ2hFQTM1aSsr?=
 =?utf-8?B?MFVGdmE5cTJqREJPNzNxU2lQSE1WNGJrb0JPbkQ0c283cVlVeE9sVHoxNFo4?=
 =?utf-8?B?V2h0YTgvVTBPd3BqMHBSRnBYTEVUVjhmQmZLOHdPcHI4S2ovcXFLOHlqMzlH?=
 =?utf-8?B?eHczZHRrMDg2TlAyS20vNE5WdkpVYWltanZmb1RJY0NDMEpTcnNlYXVGR3po?=
 =?utf-8?B?WFFZY281blJvRDIzS0xHVXNOU3lRTVYxK1VBYlczYmkwakEwdmdPT0RTeVJ3?=
 =?utf-8?B?eTVRZXQydDlVMzlsSlRldUFOeTUzdlFhUFJ0SkJuRFRWdUM0V1QwbWdoQkUv?=
 =?utf-8?B?dCtibnBEU3U5cmJ1SWZWdmRLbVpBcGx6OVZ3ZDlvL1BhcUpwL1p6aGdJa0pq?=
 =?utf-8?B?QURMNXhrWGx0a0pUczlXRlZhbjhDK3RZeHhJZEFtdTlYSndSRjc3UG9CVUpi?=
 =?utf-8?B?aDk4N2R3ZExvaDZTRmF4YXVpRHpIRlFoV0owbVVBeXkyTVJITnFkZ3g4N1JV?=
 =?utf-8?B?WW5NWHl2LzNnU0Vta01xbzJpU2ZtY3ZjV1NJK3FKVzRFdnlCSitUaTRweUdF?=
 =?utf-8?B?OTBranJCd2RWYkRrQ0dpdTRPM2tzUVRqOThDMzA4VlR1NFJmMTNuYThkSzBs?=
 =?utf-8?B?NU9ua1VEaUZGbTJ3dStnTFRCSFlKWmZhUDZib1FrUE9rMENvRXc2d2dBV1RI?=
 =?utf-8?B?MERWWXNRYUpWaTVuY1NIRHNQb2liRm5SdE5qaGRzTnRDNXVNNlVUQ1g3SnZx?=
 =?utf-8?B?bkxOK3ZiSXh4blZNVVVacmc3U1JJWWJZc2ZacmozRDJ6L3RJUEwrQjlMWUF3?=
 =?utf-8?B?NmVpT2dsMDR5UjVPN3QxR1FENk9SdXIxSjN1NG5qUFlrR0RDVEZyeXovTnB2?=
 =?utf-8?B?S2xPQzdEbmhUb2VxNVNqWUpBQjNpak9kdmd6SVd1MHZUaHh1WTlDY0wzdkgv?=
 =?utf-8?B?THpVZHNTT0lObG5RU1ZpVnpLeDlURnYzMHQ5aGpBT2RLb0R6SkhZdy91NE9F?=
 =?utf-8?B?T055WWRxYU0xSXJ6QWtGUUxQVWR1YlVVVGs2Y01scHZHTkNhZTdURkJtcnNi?=
 =?utf-8?B?VFVFS3p5WUhhVTVQVnM1T0VLd01ZRE1WeElnbFZWT1B3cXErTTRLdWVzQ0lE?=
 =?utf-8?B?SE85QmljSkdnNkttQkF1YlpWOHZUY0ovYlJ2RVAwaGhiN0NXcjdTWklpeHFj?=
 =?utf-8?B?THJUS05XQjROZVY2V1Y1cExWMS8zS1hsTDVoa25FN1I5WWlYRC9IcS92TVRC?=
 =?utf-8?B?TTNSVE5pMzFOWWZNUWorV2o4bUdyRGRrSkV5ZWE5L3ltSHB3M1BaT1E3cTBX?=
 =?utf-8?B?VzRXY2VuZUxXbnYyMCs5Um5Zck9teWdlWVVSbE01WkJTaTJrbEIrMnpFVFZY?=
 =?utf-8?B?VVRzYllCbi9XWDYxdTFzamRzamJhQ1ZtK1JKWGRwUk9OM1BZdjV2L2ZvdExz?=
 =?utf-8?B?QnF1dkhGMExqVlRnQjkxdWNsVFlia3paQVVJMlRLSGVvN0hKMzJBaTlQc25o?=
 =?utf-8?B?dDJNbjhEbFVSdjk0LzhUR1I4RGliN2hrb3hoZVR5ditkQzZZS0YveU5EREdL?=
 =?utf-8?B?OUdhYW84bGFzY1lud1NSQUNNQU5YRkkzZzZkTktsODl2S1JQQ01TekRnSmcw?=
 =?utf-8?B?ZndxQjlaYW0vcXUvWGU3WnM0ZWwzbWUxRU1zMzI2WEFaMUVOZm1aVnhXSFpD?=
 =?utf-8?B?M0Q5ZmdhV0poQlJxN0d0eGh6Ui9Zb084Wk43VHJVN1lpUG5PZEtpT3lONVNV?=
 =?utf-8?B?WkNDZVI2RURzcURQcUZrcjNPZGVWNWoreUlOK3cvWThMcWV3SzBpODRtdHV6?=
 =?utf-8?B?NGFhQkgwSDkrQ3RXbTU3UjdXTi96bUZCNTRUamdRY0Q1YjFSeVlXbDFhYXYw?=
 =?utf-8?B?STRieExzSGdwdkFWd05UK01kQTFxNUkyNFpFQ2lUd0lncXJBUVk2b2k3aUk0?=
 =?utf-8?B?a0dLOU80V3JkS3dxZUdhV3g4UXRoamFaMXB6OGJDSlhaWTI5RUF4T2NZam1p?=
 =?utf-8?Q?xj9h8LsF+NLq5Yd0=3D?=
X-Exchange-RoutingPolicyChecked: fguc3ly1nAcvZvmJVhx0v82kCzJU80F7gtXpWfZ37+lKfzpgaywsGE4I1bzyGw/Qadlfqb6vj9bflt7vOGIDi2UxVf4FXTmKI/fqchDCotzaeHc1Y8Q7mL+mGukHi1EcczSDbZCQ3sBatWm6QmHJ0b2Eps2LpeJazH94L+M4/f3nnWm+Mdfsssq0iJUrfqjHR+4SI8OwLTGJUMDJNEVp4PnSlcaFyKOZESf2zcl9zcpVmYj6nofL2WNQJy1hne6sGqTEA8HtNaa9KEfWOxuUUMHmpftIcV7ZtoNwjC9xiN/pZRXgzNfaPC3ICO0vbMNYr+9Ar8z1l2e5jLMBG0IhNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c88c3de-7de7-4484-1d6b-08de8b0e85ac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:06:02.4635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qrmwt8gR7yC2sVRE/L76A9ei8iDquvmXLxSGzat3fM5W3/2lal+BsoEjKpX9xazYJVI7IJqjz/6s1po0VjHXpL+n4Suqq8NJAaCgVwJyZWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
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

Hi Swati,

Yes it is wrongly coded. i will fix this in next review. Thank you for 
the review.

On 3/26/2026 12:42 PM, Sharma, Swati2 wrote:
> Hi Ramanaidu
>
> On 20-03-2026 12:13 pm, Naladala Ramanaidu wrote:
>> Add a dynamic "vrr" subtest that checks vrr capability on each
>> connected output, skipping if the driver or output lacks VRR
>> support.
>>
>> v2: Address review comments. (Bilal, Sowmiya)
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_feature_discovery.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/tests/kms_feature_discovery.c 
>> b/tests/kms_feature_discovery.c
>> index 28ec89c55..7b197b848 100644
>> --- a/tests/kms_feature_discovery.c
>> +++ b/tests/kms_feature_discovery.c
>> @@ -60,6 +60,10 @@
>>    * Description: Make sure that we have eDP panel with PSR2 support.
>>    * Mega feature: PSR
>>    *
>> + * SUBTEST: vrr
>> + * Description: Make sure that we have VRR support on output.
>> + * Mega feature: Adaptive Sync
>> + *
>>    * SUBTEST: dp-mst
>>    * Description: Make sure that we have DP-MST configuration.
>>    *
>> @@ -157,6 +161,21 @@ int igt_main() {
>>               igt_require(psr_sink_support(fd, debugfs_fd, 
>> PSR_MODE_2, NULL));
>>           }
>>   +        igt_describe("Make sure that we have VRR support on 
>> output.");
>> +        igt_subtest_with_dynamic("vrr") {
>> +            igt_output_t *output;
>> +
>> +            igt_skip_on_f(!igt_output_has_prop(output, 
>> IGT_CONNECTOR_VRR_CAPABLE),
> o/p is uninitialized here.
>> +                      "Driver does not support VRR.\n");
> This doesn't look right. Can you check if we have some CAP reg to tell 
> driver's capability to support VRR.
>> +
>> +            for_each_connected_output(&display, output) {
>> +                igt_dynamic_f("%s", output->name)
>> +                    if (!igt_output_get_prop(output,
>> +                                 IGT_CONNECTOR_VRR_CAPABLE))
>> +                        igt_skip("VRR not supported on this 
>> output.\n");
>
> Instead of igt_skip we should have igt_require(). Please check how 
> other feature discovery tests are written.
>
> Follow same pattern.
>
>> +            }
>> +        }
>> +
>>           igt_describe("Make sure that we have DP-MST configuration.");
>>           igt_subtest("dp-mst") {
>>               struct kmstest_connector_config config;

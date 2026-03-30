Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5866110D14A4
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 11:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D510610E49B;
	Mon, 30 Mar 2026 11:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCwsACwv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228B610E49B
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774869972; x=1806405972;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xAz7AnsWWBHVqLn38J87zxwZ4Ap+dCpPJUi5H2ucKf0=;
 b=iCwsACwvPzgiZ0YBQxAg3K9unVg1qob6LMYV8YnqXx5nuTqD+tertypM
 KnQxrmgdv2W5fh4Gr6arvxXusH7PWmDPKcXH7L4ykQTOWEyufafGxpI1x
 rITkmNiEF7dAC5Jh5JZyf9ufF4alBLJ/vdQq196G2k34IfmLLrdGYMIDF
 YN9aA5bIU0uf2Mfog6fmQ/gWtzZo0lWXgHhu70avXuVENnBFjK/eELYq+
 knRQypG+7bZiJ8LFBzm209J83aANrssRtM2MpwvXXnM+zTcwCR0ek1cOg
 HXcdoVcc7IlZ8T2US4NI+EMhwRKmxu42IsGa2w9gtdGM7BFEv9Olm7fCB w==;
X-CSE-ConnectionGUID: VQeGiHH3T2SfS8WdU6vUlg==
X-CSE-MsgGUID: EDRkbkR7TXeUC4Em8iVSMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="98471707"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="98471707"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 04:26:12 -0700
X-CSE-ConnectionGUID: w9DacpJFTIW9vIJykva84w==
X-CSE-MsgGUID: 6UsplifIQLavxfS/zQvtjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="221629041"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 04:26:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 04:26:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 04:26:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.41)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 04:26:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkNE3JWrIfKRz611GiI0wUt4qBBZpv1/PFrSjEzo9zR0BaEzZofMeJP716VL0OxIsRKSn+YHnPQQqu7GrpnrpZHdsueCxKr6700BC13NFUAJ1ISJ+wqI2/G5sXhTEJDA7ALKa6FYM0HxJyAIHFiXK4nSPi3fKr0Z/D6qPjtwL2gj+QflPWaDkKaxG/blo/s0SJYHbvxGFD6gH+xQkpDwgnBQnq8d7GesueB6PPF+b5+cntaYVIJTpbwkVX7kTAPWY2ZUSG90004Pxp+Sn2qdYxj3Perkn7Sw/ktO5m7JzFYqs4ZgTdzIoaY6bBlX0fgS759K8syYjaY5kG7qgt4RYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hdbhLx3szUDQ+FTEgl3iDy5zvbS407Au6LiSJhJPl8=;
 b=ncganxaMRSP4P5d3xQv1HPDZdAWbUmDYDUcgQxqYZBbiIiRT73HGvYjfkS7qgrU3UxkowXsAwRmM/dIsZRqRJZlbKNnMJh50cWbDP8hdS0XmtsqI2W3bjlktiWpwcxQnnCT/njZ+BcyGF770XY3xMSkes6Uq3xFiwGONU1Ujh0aezTPRWhWKohEsP1ey8ETvVWZ1fbrmIVUEzawA684g5Fmhpsy2BbXqcmOHCVIRu/rJ7xzTA/r2hak8C5ic1cOqHf48TLIL+nwVKrXwI4JVglp6N2m3w7scLJUMSCX09vEYwmZ1TO9y2Hj11ZAknNGAOI6dWYc7CfWu9M91ZbLLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Mon, 30 Mar 2026 11:26:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 11:26:08 +0000
Message-ID: <e3b22647-b9e2-4c85-a10b-562cc036cea6@intel.com>
Date: Mon, 30 Mar 2026 16:56:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20260326092956.2154139-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260326092956.2154139-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB4802:EE_
X-MS-Office365-Filtering-Correlation-Id: 801d8074-f94e-4cc0-ea2a-08de8e4f23ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: HcQQ79rvxrJOROfHZwagQ4JwbikA6m0y9dSNm2GJyYRw2NbbJpn7tiqp/aRnCqdVKk2fb7M6GQt4Vdgio9IBGLpww4JRvMuwMJOf4tc8XV4wER8FXrklEDFrBFCnXCJHitmGn8u9CQeDUdNgcGmi0hyL985rb2iDySPoMNbXBWOa1ZaThhWdPI4mYz+Cx2zW2KlF6ME5zdnTB+zuVeGVwKVuQTYNrw2xTBI7sMRiVZvalryej7G+uDR3tf9Cpiqz6L+LuhfQA54sJOQLY0lDH+LQwXgZKK79kTmFbYjisXdr0XUEA3LtI0q8U9dC3YBVPKWE2z5H0U4UgHoX3lkbtFcIxI0JxaaCR/V1ktR7AUVxYbAh44js5SMsO57eIx6I5JyUEH2iji3ysbmeYynnzsnGO2sZA/HZWzoUhtN1eFefl/Y050SsYRpBrxLCOdtEUryztR6nUFp0rz95KTvPRHwbMz6k7ERVd4jgwaTG7ClonNHmLTpeKn0futlFScWr4Ts8fGrhNkk0yuMdksL+L0Vn08hsUcdmNiFpHUVdC4locM3v+hBz9iLDZclrj/e6qaiDcPMIxVAvRIUP8SxT4qp4oL5gZhRLc9eLGEsqB9jKga5Kk19Aq55i9sHHJjrhPZWtyLU1FeyWv9Ci05ppi55+6loXpQlBQXX3TF91OHZeEGDyYD0v+PIxjLhc0F8BUW5ZiqqTxpIJoA5hF+/6JE2N3JMntHsb+0A1chVkPeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG8xVktBbDhKUEliUmlzbHh5K1AvK0hWb2h2amVjZkpQOU50a0NacFRrMWlV?=
 =?utf-8?B?Wm1YdDUwYk1wc0dTZ2tTSWRueC9LME8rVTBzSmNrd2ZVOEl0em9xdEF1WmtB?=
 =?utf-8?B?cE1ZNnhocTNkbytXeDdxNDRoYVdCVzZRb2FjSDVHVDJHTFVYL3R1aUprb1hm?=
 =?utf-8?B?WVcvTGx2aCtJR2t4b3B0SUpUYjdYcnpYbHd6NTVhMHFaWkxxQjN4QjJFU2tB?=
 =?utf-8?B?aE1Mejhka2RrejB2dTdOYStrc1RNZ3FHZzFVT1NDK215LzludTE5ZnBCbWxW?=
 =?utf-8?B?Q1hDOXFQM1ovcFB6ang1akkxU3l0bFpkWUh1ZStYNWFmdmZOdURtYXpQcUlC?=
 =?utf-8?B?d002STNKcURpR1RDODRnWEU1ZlpmVzhqZldlcWY3eXFCd2UwRzZpcm40NXF0?=
 =?utf-8?B?eFYzbzZNNTVURzh6UjVvVDFCM0hCVExGbjMxUzZ4SVZXanBObDJZNTZCMFB0?=
 =?utf-8?B?anJxUEJTV2lOY0NGSGo0c1BXYTNVUHh2UkFLODJ4WExBV1paWXRGUWNJR1RH?=
 =?utf-8?B?RXpjZlE2cTdhaWZROTNSTTB5YWYvcGM3YkVLbm1EWWpqM1ZqdFFKUU1zb2VV?=
 =?utf-8?B?YkhtRWI4NlN5aFFSY3k0cUhSdWpENDE2eExRTFdvdEpnZklFWklvblVpUkFK?=
 =?utf-8?B?T2FCSExGbGdUVjlGTlp4OGFzV1VRMkR1bUVkYU1ITmlSNVNGSW90TGtFMWNN?=
 =?utf-8?B?RlgyNFdDWUd4bUJESWp1K2NzL2NKODhWY2Z6UGN3SHFyWXBWeVFjeUFCL0w1?=
 =?utf-8?B?RFhoWTJEaUR2UVFWckQ0cXVHZ2sxWVVXdWN5Qlhud29zeFZLSzc2YUMzYVZB?=
 =?utf-8?B?RHVtZXorb3BteU1NSWlNNzNEQU1LdW1uWHptaEtZMFEwRFBoZUZmRzhGV015?=
 =?utf-8?B?dGRxUjZYUHFmb3B6N212MDJNWnp5VjlYdXhBTy9oK2VZaXJRRjZCNG5iWURh?=
 =?utf-8?B?bHBwT0cxNENmVXJvUkVYMFVjMVhTajlLbzJ0aVkwM1lEbkEzRFBtbnlqS0Yy?=
 =?utf-8?B?WU1HVXdrNmpqSU0wUmZ2eG1naXpXR2x1MG5TOE91bkk4bjFiYTQrS2YwRERu?=
 =?utf-8?B?ejZWSGtSNlR4b25NUUtiLy9Pb005VDlDdldrQXAyWkJpVTUvMTU3eUJFQjht?=
 =?utf-8?B?cUNGY2UxMCswcmJiVUl3MW5SaDBFRTM5QWFIRlVRUDY5OU1WbUFoaEs1Ykd2?=
 =?utf-8?B?Z1QrS3B4OXRObTRQZXA0VEFYZnJXTHczTk4vSDVTU0luV1l1b0RDMFFrRDU0?=
 =?utf-8?B?S2lna2ZITy9SbmkyN3NTVXF2VHZnUEhsMiswMXdsenJvZE11WTRRZFplTW4v?=
 =?utf-8?B?NERlamQvT3BqMGJKbnJzZ05sWkV3VUJzZmdnMXM5U3lXcnB2TnphWnNBb2lO?=
 =?utf-8?B?Q1htS0R2MkVUYWNoTy9LVzdHYy9CejRqR2hUcnRZRll1WTBoVXBvOE9PVFhr?=
 =?utf-8?B?QURWVlVyME9xYmFiZ1czcFdwRWU1ZTdjSVExemRqTW9zeWRDMnlSWUYzamE0?=
 =?utf-8?B?R1dYMzk0b0RNOTFSRS9taWl3bExNTFRSQ3o5RUJXZzBLWmdnYi9KakMzSTRo?=
 =?utf-8?B?anVBbXh4NUhFK0kvTTRiN3I1T3l2T0VXWCtnb1BqcnJ0VnZDTDEyaENqVEZW?=
 =?utf-8?B?bXArWHIzb2N0NnpWemRSRm5rOEZ0Q25aOWNPSVJ2YWJvUmNvL3JyZ1Y1UFZQ?=
 =?utf-8?B?WkVBVWJqNjlyaElFblRhd0NaZklRd2lkL2JhcDBDbTFkRWYyY2hoRkNjcHRa?=
 =?utf-8?B?eUhwdGlKd3h2SThzMHdyLzNWZGp0RmIrSzJ3UmFtR1JpODBKdjZaNW5tQUp6?=
 =?utf-8?B?UzdHQzFBMVZjSmcxYmtNVjFWVVp3bFdaRmozRGdZMmlsRTdoMXB4c0VERkda?=
 =?utf-8?B?OHlHSlFGb0llSlU5N1Z1ZjJwT0lXVm9OaFRXK0FaUUVYT3RkVURobmFTa0x0?=
 =?utf-8?B?OTNwWEtjZHBlSXJGdnlYNWtVazNMR01rcjc2emtIUjgrTGdtYksvRnBKbW9h?=
 =?utf-8?B?ak4vcWNWdzZuanJ0YnhZdllMZFJHdEF1S0tpMVVaTVVzYStFVU5NcW12MWlo?=
 =?utf-8?B?b0dxSmhRZU9nbUZBOW80TnhqeEpCSTJSVWZhSHFWY0Z0bUhDVDl2azJ5c2hI?=
 =?utf-8?B?WWl6ZjdmbmFsMWlycnFGRHd5RStnNjNWeW5ha2YxSm9VVkN5amMwdU0xKzNQ?=
 =?utf-8?B?a29YNWp6S1N0dXhDT2t2WkNmZmJlS1I1QjZYejJDNFBlUTRENHJ3V3o4VXYz?=
 =?utf-8?B?M2lVUDdEdkJTTUJ6QkFiM1h1ZzN5OEovejRFZEU4bXgxWG1NbVhuNEREREVK?=
 =?utf-8?B?K2xKVW1yTnQxaU9wUG8zM0dBbFFWbUx4cEM3c3BiOXhsU2tTYWFVdz09?=
X-Exchange-RoutingPolicyChecked: TCeXq/nULyPK0CCc51wtBMWH8L+5HspbeyI4Aov8AOvUyW2V8Rc7C+TYOtCBjn7HEMQa0XDcG2uq7TYaOYsuqwiqkqkSjB0LQIn3vxHasRk6bh4vszI1gcsFskA53VzKAS907m7WDv8LCmFVbhT9ViuVzUxOY98TTjQqOY7vOSLLi7+Mxamyw2kOyrgVogpPBcvc+8p+/tqVI2N76UcMqjyNEAD4z7jJVQYMgdaJqYLFnUa7jJKm9q+ObJZZ1RbSIJtoOQ2T47VDujJ6nu+FriIwfDwCvb48xlg/bhW0HUdsJmGHsKK6SdfOx7Xo8HkzeBU3zYQGqVFapLv7nKSMzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 801d8074-f94e-4cc0-ea2a-08de8e4f23ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:26:08.8974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01nf8Q9EqNO/mu36+9KMUiU+1foa5MxlqfrD9lZvto4e8x0Gh4d24ZXo2EJnMMZPst9Ge6G4KOkALes44tJ2cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
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


On 3/26/2026 2:59 PM, Sk Anirban wrote:
> Calculate actual suspend duration using CLOCK_BOOTTIME instead of
> relying on the autoresume delay approximation. This ensures accurate
> validation of idle residency measurements during suspend cycles.
>
> v2: Use CLOCK_BOOTTIME (Ville)
>      Use Fixes (Jani)
>
> Fixes: 5c85b336f75b ("tests/xe: Add a test that validates residency during s2idle")
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 61b63ed4f..f2b802273 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -215,18 +215,27 @@ static unsigned long read_idle_residency(int fd, int gt)
>   static void test_idle_residency(int fd, int gt, enum test_type flag)
>   {
>   	unsigned long elapsed_ms, residency_start, residency_end;
> +	struct timespec ts_start, ts_end;
> +	long elapsed_sec, elapsed_nsec;
>   
>   	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
>   
>   	if (flag == TEST_S2IDLE) {
> -		/*
> -		 * elapsed time during suspend is approximately equal to autoresume delay
> -		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
> -		 */
> -		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
> +		clock_gettime(CLOCK_BOOTTIME, &ts_start);
>   		residency_start = read_idle_residency(fd, gt);
>   		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
>   		residency_end = read_idle_residency(fd, gt);
> +		clock_gettime(CLOCK_BOOTTIME, &ts_end);
> +
> +		elapsed_sec = ts_end.tv_sec - ts_start.tv_sec;
> +		elapsed_nsec = ts_end.tv_nsec - ts_start.tv_nsec;
> +
> +		if (elapsed_nsec < 0) {
> +			elapsed_sec--;
> +			elapsed_nsec += NSEC_PER_SEC;
>
> You could use igt_time_elapsed. Also remove the below check that hid the bug.
> It shouldn't be needed when boot time is used
>
> Thanks
> Riana
>
> +		}
> +
> +		elapsed_ms = (elapsed_sec * MSEC_PER_SEC) + (elapsed_nsec / NSEC_PER_MSEC);
>   	}
>   
>   	if (flag == TEST_IDLE) {

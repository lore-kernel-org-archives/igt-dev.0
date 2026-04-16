Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F7EF433D6
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 03:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EDD10E808;
	Thu, 16 Apr 2026 03:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyIPyAwi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7C510E808
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 03:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776308668; x=1807844668;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=plTHa5l6n5znTPWva7p33CN88NfpV9wXoz71PV1ZUIQ=;
 b=gyIPyAwiggcsh5fVgvwdBIBQxH02nTylzhVd9kxqqD4yc/cD3T8Hxdfk
 Ukz7d5vtJjsJToAVN9LXezSzXyR5yBYXa5y0t4r86sZ4hjSJw9enuqYCz
 SFuUQxY07igm5GsFeaxKzfLwKbcxZmtBbnuGX0Ue6tKRo+A91ClnL4wVz
 70p0sZi0yWLFAKu+4L15zDQOxPO0nkgEG1K7pImkLJSsrB4gJXrvLtYvH
 rC+axftzwQwymrWA+1QNossgfF7cFv5DsT7aEp26xaNK0UBDvflVkHWZi
 ZKCBrQ1ZqBwKey3+A/p66bEM/7v8fd8xqudbVckae/xIoCqC9slX+XXH7 g==;
X-CSE-ConnectionGUID: ztTzwiphTTaiq2NT1F08AA==
X-CSE-MsgGUID: lspNWNG5QRmb7i8wXyxtIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76997959"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="76997959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 20:04:28 -0700
X-CSE-ConnectionGUID: Fb1wg05ERFe0D8PjGWcKiQ==
X-CSE-MsgGUID: Vv7WM0DzTX6cW5t0TS6NqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234979009"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 20:04:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 20:04:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 20:04:27 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 20:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmAX32+hrEkX2+i5EpfW8FLfIqvf5L+GvXi5PDfx3lYQAg9nnVSW2IfAGTWS88rt/Z5fFBmUB7WvgvOgNmjvjqbIAJPDSxHBKWMQf3td8J8S359xWFVEjt4DtJaFUrgYUC+cf+wc/mbIFzJVVJQXELMT8jSBMkHnxXNByZsDb7IHAG4js59Q1mcFISwewdJbqqQ6VjVbsUsl35kZXyX1hbeaNCj7I6UmR1uN9h8OaCT8PaYOOklUV65SOXx03zGSoIWpVIYPIT+vFgAvm/4X1kU3Ntfi/NCrlTqqc5MvZXjILZrvD8zDyo835vSGgGfX34sVJVbQxldl/ZsBTwE1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bA2YIGPC3myrGtF438hiC/Pbnv8rqeB0W7edoF6KFPs=;
 b=FWEB06WBprlNay8HpaQJFYw3r/+BmzjR2m/NFprZBdXfroBzD/y8HReOLW2mxYHKrcB7NBMvIJxYiPqmkiFZR2MhVR3iv1yieRZ/Dojk5nX8jKdIOMbaZQZNxhJmthvwbCVvCpn4ma/IufIIX/3oWso0c5R9Z1laLYpDObIPrYBW9xr73vXvAjtijnc6XWHNlvJy16e0QxxpdRriBu+YemJP1DyzNRU6qi9ZO403eAQKBwzBlbhpt3YL93T4jzSf5RY9pVkNV3R5JGkkfTTKgSqRnxqordxJuMVHDljdWtOrdT6BAfzREwWSfckm8sceq4nOwMPhKWPQl1hQQ2QWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 03:04:24 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9791.035; Thu, 16 Apr 2026
 03:04:24 +0000
Message-ID: <95c99a4e-b6c5-48e0-b0f6-49b830c426e9@intel.com>
Date: Thu, 16 Apr 2026 08:34:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_invalid_mode: Remove outdated fixed mode
 check
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20260415182853.1045081-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260415182853.1045081-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0ab698-b81a-47c6-6fa7-08de9b64dcf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|42112799006|18092099006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: E7rYY1krTiL2J8DmnUN+mraLngktBVkMPqEBjHUcfM+p28pI3DxcIKy09hMNtJF4aXaONZrZRSl9YrGn+80zoYOUfWEcO3XjvDqjFRbpHIvblflHy/ikZG8AjiTuwmLKZu9spdDe4Bzq4IV6D8CVQiMb/QC6OTaVsELm2QTKQL8r6flJh0EBy0whPRYZJhqXjqBE/mU70YvyFfbu5t4TPuXcpPrRm5Hdl0Ws0CBFgwtiNIyiKCeFRmR52yUrhaftU0pAfW7qj27Ly8NyYc+gC0IXhlhqyX4PVqd+mmQzja/lApD8ZnHmhVWMF+evzhag9ua6RKRspoqfMLpiUIWUsrW788o0mKoLz+423S0VolvRWXZkVZZkk8I35vyuvmB7jwvMoTiRSIy+eK9DOLc525C6tMfvCExksEWxD/1T51w2YEXB4mcss/+Bl8BwvlhRZd9jR0lU7ApMazfD6K1zjvFngCSQsp2VS/8YeME6nR4aDW5RF8LoFA05cHlOrrHQX/cTlns7iqaxTSGinlPUr2N1nYO8fdDvdMePgR/+bfxw1Ux8ijlwPngCc8LudgnBIHOlge6T7Si5tSFILWvSPVJLsokDpjgYQI+9aYaowFN3bqXcEDMjFrm0IaRAbG/RYyslG0e6o49RmsdgZyxpZ4WqKpclAaUEkdJS42g+oa48Y06yA2xWko+af98hPamdp1zJAs4WCIHfBCwChswjK8UCCkrFics5ug9h8iRk9GY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(18092099006)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXN5amF2NVE0bjlOd2JpZzRhakRNbExWeXVYVW5rNVB1ek55WWRSWDZReU11?=
 =?utf-8?B?OXlzUnFjVURTVkhLVXF3K2dnTHRQTzYwYm43anJ0TDZFTk15OHdSNnVuNWRl?=
 =?utf-8?B?WmNvYnNtR2xGRk9WVk1xcThBZkN4V21JYURmVVg1d0YxNWFVT0RnY2VFS05l?=
 =?utf-8?B?OWMrTkVURXpjZEVtaWx3WTR4d1JKYkFIbHdnbkN6QU4zbGs0dWgwODkzZlVq?=
 =?utf-8?B?QjJ0UXR5dmlHSWdIZDFXbGd3b2FUTVNudGlPM3F5NTZlMWxXMmprTUVvSWRQ?=
 =?utf-8?B?dEdSdXlBRUtlem9qeHBJNU42TEhsbE9Td3pnNW5LYnNjb1BFeG8relFSbUVl?=
 =?utf-8?B?cklrS2dpcll1MVN5WmY1VXo1cGIyVDdRWmVYeEpBODduMlcyd3VNZkY2bkVX?=
 =?utf-8?B?S2tYQ09qU21WRGdyREVKSUZRRnRHMmZPeWlxRUVJd3MyMTVEY25rNFpwMHFl?=
 =?utf-8?B?emlGMTFUSElTU3Z3OTgyWnZrMGhBNytyKzdYeHlWS012YzFQTkl4THhBRUtj?=
 =?utf-8?B?T1NITlBPdFI3bFp5RzkxUnNYUUdMTHlGTVY2NWVTV3EvckhZbk1xNElXeHJi?=
 =?utf-8?B?dmNHcFdaT2pVbytDREVOZ3cydmEyRm9JVEVDM0pSZkVxbllOVlVkVHpvcklk?=
 =?utf-8?B?VjNvN2h3aGo0UWJaMmJaMlhNN0NUVFE2azJoMmJMWGhkdkJ5QmNIeElDbWlr?=
 =?utf-8?B?dE1FUGpkZW0vdDJPNnpqeFNKU3cvZFNycHYxR3A5aUtSTzEzYXJNMU9nUnoy?=
 =?utf-8?B?U0UwY1ZSWFZWQmx1WFgzZXFvalZmWUZ5b0JVdmx3c25zSmVzTUl0V0tFZVhZ?=
 =?utf-8?B?ZjhSWWN0QjZOSTdNZVBzU2ttNmFJLytZM1owYnQ3S0wySzg1bDRoNHFBS2V1?=
 =?utf-8?B?SVBHcG5EemJJZmNEWmxiYm92eERsRTVMb1Vxb0dKcnN6SCs2OVVLeTcwVmVF?=
 =?utf-8?B?R3Buc2dvZm1jR1N6ZzMyWWppYjFBUzZUK0s1bllNZ054elpGQ3dpYW5vRG5s?=
 =?utf-8?B?VkJEbVZhZVJ4SFEvcU16TkJSQnVuSElVVHdEelRzQ1hqVU0rUExxWTRNR01x?=
 =?utf-8?B?alJsdnNvT2RBSzVzQUZCUEE4UGZpWGM0d1lvdWJxckRIaWF5TExHL1hON09J?=
 =?utf-8?B?N2xVd1lubDFQdUo5cTF0VENnSlhxbGhzOTB2RWVycno0R09NMlVxSkFiY21u?=
 =?utf-8?B?MGlsZ0R0a2xKaXhaL1Z1cEpQcmoyTzFQWW5Gc3dENDhyU0hLTGJZQm1ScUNE?=
 =?utf-8?B?ckZFN1YvdjZNdUJrL3c3eklUSDNaYWMyUmQzamNidTlRVmxpdEJiblU5TlhW?=
 =?utf-8?B?eDhPN1dPY21zd0YxNnZBRDRQVEtDeXd0OVZWdXFScm9NN1VFZ3A3L3pCTUVK?=
 =?utf-8?B?ZlFQbWcxT2pJOGJCNEJWcXZoYlJRUEU1TWtwWmw0OS8vN3pQQkV2UHRpTG5Z?=
 =?utf-8?B?RlRodW1vbVlYc1k0anFENWhBRExDT08wQVN3dExIa2d4M2NvKzRhVDF1bmtN?=
 =?utf-8?B?VVRIRnMvRnEzR0JJYnVBNDdRbTFkUURERENmalBnQzVMbEVpM0FLbGZsaDFu?=
 =?utf-8?B?RDdneDNyRlBOWng3bUNVZGtBdWpzeGdGNkhyT2RhOUZpbSt1bUpSNTJCVGJ2?=
 =?utf-8?B?Nkx3VDVZdHAzOXpGWTVTamQzYkFTamFISUU2ekpZeS9PcndVMENzc25ab1lj?=
 =?utf-8?B?aDRmNlhaVmJCTCthdFEvRGV2TEsySmc5cWlxV3J1S2l0anVuQnEwQkNodGg2?=
 =?utf-8?B?N1NzZ0FmalRPU1gvTVhBdHZCMHM3ODZOblI5SWwzYUJmS0Q5VVZUQWJJRVJI?=
 =?utf-8?B?YldvdEJzZ00rVzBWUE9JR2ZidUJSTmUrRXM0TW5sNStKMFovSnl3U25JRWJK?=
 =?utf-8?B?ZExqMUVtVldVd3pjV2xYZ1NseUZJM2R2NmNVTk4vdkMzM0VhMERuWnpONEhh?=
 =?utf-8?B?cjR5dzZ4LzdyejBjeEZsa1p2dzFpK1owRVM1ek9TWHRSQU1sWHpCanRyRUFm?=
 =?utf-8?B?SFEwaEJMV3lCQ1RtbEpFZnFJSEdCM010QWp4dHFTN3dGMEE1bjluTHVaekV1?=
 =?utf-8?B?dVlUb2x1Sm9tbGhvWUJtN2gwU0JuNFVmREFub1RJaVJnd2lrOGxIUGZZOTVT?=
 =?utf-8?B?dFZJSXlxbUhDOFBOMGhOc0x3RWphRXVRL0NvYzhYdWhsNVMyMGNJVjhGaXVn?=
 =?utf-8?B?NlUwUTB2MjJNUXpUbVZxZm1GdXR6V3I2aHk2WTNPbTNYQ0NjNTR3bit6WVVM?=
 =?utf-8?B?eVJ4OTJja084S2JPbEYzcysybEhnaGVXS3pWWERVbnZyN2kyMGErYUJLYlQx?=
 =?utf-8?B?Q1o3SmJhUloyNnBSMW5oQVlIRklyaUdJT1R4YUZSbmZUREZKRyt6QT09?=
X-Exchange-RoutingPolicyChecked: R5ADMFQNjdqw7qxWwKmtSy9hcBINwn1gVuQaaV2R5oz4aylZjTuSmM5oPzRULlJ+Y0f+QhKdC1ViR61OqJjvZHyN/vnEce0qvCn13mGM++r7JMKnwEkS6MxS7zzTG4lni3bCdRiZPY/XDBlsUf1eJXhi/WWGMeDqKwW4yNK82ecvPPIKN2BhBOQuGwtJgFNUq48260f3++usDlvJYypHhnfVEjTtntV+m0Qvhe3uSmm/ClHHul6/rdXlXoB4HL+w1VJQXBYMqtK086dG5BJbbYThfQy0fxRHLQUweGOenXKf0QCjBzTU5TVWjGuuSQWvk/XlkktytnjWriApeonrcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0ab698-b81a-47c6-6fa7-08de9b64dcf3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 03:04:24.4505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjYP4PDWPzG+PVFcvxpC3kOXXOA7Fen194W4a/21jiflDEMJAXypALDi2TivCrWUo3tVTGNJgFuqzWgLzOkRLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
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


On 4/15/2026 11:58 PM, Swati Sharma wrote:
> Remove the has_scaling_mode_prop() check and associated FIXME in
> adjust_mode_clock_too_high(). The kernel already rejects modes
> whose vrefresh doesn't match any of the connector's fixed modes,
> making this skip unnecessary.
>
> v2: -remove the outdated fixed mode check entirely
>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_invalid_mode.c | 19 -------------------
>   1 file changed, 19 deletions(-)
>
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 5edffb649..8bdfa70ef 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -72,14 +72,6 @@ struct _data {
>   	bool (*adjust_mode)(data_t *data, drmModeModeInfoPtr mode);
>   };
>   
> -static bool has_scaling_mode_prop(data_t *data)
> -{
> -	return kmstest_get_property(data->drm_fd,
> -				    data->output->id,
> -				    DRM_MODE_OBJECT_CONNECTOR,
> -				    "scaling mode",
> -				    NULL, NULL, NULL);
> -}
>   static bool
>   can_bigjoiner(data_t *data)
>   {
> @@ -128,17 +120,6 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
>   
>   	igt_require(max_dotclock != 0);
>   
> -	/*
> -	 * FIXME When we have a fixed mode, the kernel will ignore
> -	 * the user timings apart from hdisplay/vdisplay. Should
> -	 * fix the kernel to at least make sure the requested
> -	 * refresh rate as specified by the user timings will
> -	 * roughly match the user will get. For now skip the
> -	 * test on  any connector with a fixed mode.
> -	 */
> -	if (has_scaling_mode_prop(data))
> -		return false;
> -
>   	/*
>   	 * Newer platforms can support modes higher than the maximum dot clock
>   	 * by using pipe joiner, so set the mode clock twice that of maximum

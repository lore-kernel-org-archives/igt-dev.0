Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12166C79FA0
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 06:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9961210E03E;
	Tue,  8 Sep 2026 06:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heLeZrFl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4871E10E03E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788850309; x=1820386309;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=vsHGX6ivfwRqDPl2b1q+akDo6B3E5716k/i5CwJwhMI=;
 b=heLeZrFl3V6NJePM/fhAU+f4BpCS3W3L5RTdaOpa2ccgGQ1wSP4ImDw5
 6y7n5OSyJmnIAZylkTTayRMu7hRUJX3+SdSdflkFbVfuwDl0IlrUUflqf
 wesSsoUHFbxXSmRpVMg8SVh6oyETh7yqpQ+fcmsnbg6bcpo76ZMpw1qXG
 FEbMXvO2XmPlpQTC2uBgZY++dt0PxleEPvw2KpFoNHG7vKDPZ4HcfW9v6
 utSR3VtJA+ZPghFBmRvAo/3fGqEH+iKyH0J+znvrsg7liYG2YbfQ3pxOu
 aKzsDrrYR73n3j5XpodcmeGMfJoqk/8dCMXIhiZrsnPSAVcPK3JJ5g4Ip g==;
X-CSE-ConnectionGUID: KH5OoPj+Tq+OQdhoCpMjug==
X-CSE-MsgGUID: H3xWhGQFSE2aU1RBt9DDBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100402270"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
 d="scan'208,217";a="100402270"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:51:48 -0700
X-CSE-ConnectionGUID: UTGsqy7KStu/uUv4krYcgw==
X-CSE-MsgGUID: 5GwEh23oTR6Z+SLjjWSa/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
 d="scan'208,217";a="276172416"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:51:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:51:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 23:51:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ra5OxK23X4ASPJH2HJdq8QxMJJd+diuazkTur1L99cJPZsku6ZZJLrFFIXCx6OqT4j3AUOHQpEQPSvNHVDJ2NXwSRvmDSAt7ruvTKI2uAb99AzSMitW9dsPEYgG2PAzaTjfECQV5g7GXHaY7wsgqDOhrutS2h2J95V/eS+AdIKnJHi5JVc+9Wm6CpT0xkoWRqbCI4pyzxppa7/cAwKB/3i6MPj6wS6tW/XbP1FWx49C8XWyVTpTYhDuUDIiZD67A8QeLYgMHOETB2Xt+TXRz3bfWS8aRAgVD03+yXQbi4gDTjrghk8w4Ns5yy1pG1WPmhoVUMRW72FekkP48nz7qfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyVd/rR1Jvoo7yXloxlmYkxX8MYDXcdQDu7E1UVXIKs=;
 b=IlVybZpuSeJOIFBu45ABKLOoprVVpxWkeRGQYPpX0lusDJCIJHo/k5x66L2PBIVY0VN9O8Fzaec5rIpSgh7ltzPor/HYt3zmUVzEhbyzwSWuHSeNetrr8TTefwm56/CidFUsvO6ZXtrF99RDfNc0s1asejPTN/kziNzNTuqXLmnRpDamzmWmNalDYQiw8ykG/wwrhpCAlLuwUlqoO1JQx1LgANhP+VFMw3tQIkpPyVQFmocZkt8G6EczdLTQ17gpFvIlRhseFGABR24T/OU0iJXJ8pvo3UHaEP2ZpnIoeBXNMT217KXe2Py+pkmkkUieqyldrcGSMPrQR2R4mSz/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS6PR11MB371697.namprd11.prod.outlook.com (2603:10b6:8:4a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 06:51:19 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 06:51:12 +0000
Content-Type: multipart/alternative;
 boundary="------------b8aGyvE6mu6qWbPiZ7PUtBJn"
Message-ID: <cd67b174-423e-4528-b820-4be0317d2d9e@intel.com>
Date: Tue, 8 Sep 2026 12:21:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel: Add kms_hdmi_audio_bw test
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260819073858.185542-1-swati2.sharma@intel.com>
 <6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com>
X-ClientProxiedBy: MA5P287CA0333.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::18) To MW4PR11MB5871.namprd11.prod.outlook.com
 (2603:10b6:303:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS6PR11MB371697:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bafbe4c-a3a6-4f35-df09-08df0d759166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|3023799007|10067099003|4143699003|11063799006|22082099003|8096899003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 1+BbckBA9tklhy3nPSivurEoDqLt/697sRxQmHqbQ9JKfj5YDhhe4ZSzFzXoyeXmq94CeqKGA9ktLxuehDXdfQJKlm1FGUPs/iKmJ4O5nkqdPr/q/TN+5BK6WHjRkkOuD7wp0plC4VCwpzCilNJy0L1Lqc8SEim1f4lWHeaSC9JoF/q8MzYQCN7V/zkvNfkLxZkznFWvaOVcltihdoy9Xc/NObbdZQpv+AVZqdStM3Q3F90mWwsXQzGgiHyHAcRJvW8qLL1Pwb4+nnyK7s2fiydOSdqa+1sCbObocIyp/NTtEKg2cPFCMfpkYw6TLOaR+r0/Y4wCwbyqEwI64U98gxEUU3eDwFTmo4RI0EDcrc3FfTE9GoCUfnFP4Dt0qgZSEBbwc20GuriN2H5VHvqy1vHLT4Ovgaaj6nvxjMw+w13/LKuoXnxYdOY0KZgfr+4kWpycUCxKhdSyuAZLIAh+p+ZnKUSPkP87e5yr9AAs/HIMUI3TTRuDE6GfUN5tLfSD4yhlUjMTIEG9TNNoh92L+LMt5Ry3sNCe7svY8evsE9tJByW3lKLqA+HhETd3+DaULCOFEGxsyijjm6Qlqw/K5x11L/V6rh98sS93RS3J0qTeRgXZq6nKg7+qe/UpSbRmD92qyXEDEBriW/SNvnHDRhxSJMo0IJaG5GKczk+fPY0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(4143699003)(11063799006)(22082099003)(8096899003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjZDd0pnYkJWeHNKMlNFeHptUHFtZnBxRVovcHdieFJ6SGg0TVdlNGYzdEFE?=
 =?utf-8?B?SjcwckpnWnlKUC9ybi9mSnJCSDFrdFZQUzRrRzJNbmVzcnNGK0NKMnNxNWx4?=
 =?utf-8?B?RXN5L3JjS0xjRTlYeDZseW9scFI2SHBmOVN2S203NFVudHFhNXltYVRDWUxv?=
 =?utf-8?B?VmFHY0ttd1ZVS0dJcE9nYk5BT0NtNTF5eUdPdTRLODBxK2FjR09ENFAySEF4?=
 =?utf-8?B?MHRvWkdBeWRheno5RUFtQTJKbE4xdjV6eFRjOHB5ZmRkUGF5QmFuTjQwanVs?=
 =?utf-8?B?T0FBTWVPT3ljc3VibVRXWVA4emkrUlIxSGRFeTJJZ1Yyc0lQSzRnYWNLWmlJ?=
 =?utf-8?B?TDJOQXNBSGZoV3B4bm1sRDZJeEVDakN3T0w5TkxWbzhEV1JGTXlEazZnVXRE?=
 =?utf-8?B?c3FaTkpWTUtNTEw1dndTckdENnFQTVVuYVNoYjZPb3M5eWVCdDYvRElONTNp?=
 =?utf-8?B?ODFKSEdodlNDaU5OWUxkN2NzWkpPSWNoZkZESmsvVjI1dEdDdXJ3Z1Zmc3JP?=
 =?utf-8?B?YzRjNFczVklVQ0hyZzR5MHB1U0UveVRWOGUrM1M5VXdnMEtac0lQNm5pUnVq?=
 =?utf-8?B?b1hZQU0rRFRKSzdQbGFvYXlTNnd4QTJPWmNSN0pZeWJUN3c1OTh3VUhzMjlK?=
 =?utf-8?B?Nnh2WGFQcklEZFFBK1FsTWt3cUxvdGkrcmkxQWtlSTRoeFdPalBSSzFINXIv?=
 =?utf-8?B?LzdWdHppS2J1aGdSV09wekVpaVhNd1pycUpxeVRVQmJNR250SkNUYndWRFVz?=
 =?utf-8?B?R2FSTjZNcmxtTGVYNVEwemZNQ3JjaTQ5QmJ3WjN1RWNIMHJiTWoramJEKzRk?=
 =?utf-8?B?ZFMxQi9PbE5PR0tXT3hUV2toaVoyZGgyc3JUNUJPTnlWVGJsODZlOEl0QkZv?=
 =?utf-8?B?OWxpVFFwQURXd0R4RUtmQi94aHZUeUlKRXVlUlAyamlBMmRzMzZQcXVKUjU2?=
 =?utf-8?B?azMyUWNxRVBnV3dnTmN1QW5lMDRmWEZlM09xV0htcXVMYU4vd2lJRDlrYXBY?=
 =?utf-8?B?RU04THpHcG1LOE12cS9FdjZkcGtQMHI0UXhUK1ZuR0IrZ3dQSXV4WTM4clM0?=
 =?utf-8?B?NzNnSVA1S1BzaW5CemF1b2poT2ZmUlZ0Sy9KOFMrcU01aURsR0w5bnAvYzY2?=
 =?utf-8?B?Wk1zRHFWaGhuMUNRcUQ4VEZoN3hmT1dVQnF3bTJHQ0ZGemxJZmtlMnFhYVB0?=
 =?utf-8?B?d25HbU55MUVMV2E3NFE2VWU0eHE5MndZV2s1T3ZUSEN5WnhyNkE3OXFISkdU?=
 =?utf-8?B?T2dkdVJGV0Y4NkZ2RVFwVWFjZlR2ZlRPdEpOd1JiSmtGU0tuc1ZqMUNvTDlm?=
 =?utf-8?B?RWFGQ0hyTElsVVlkZjZHZTVaSTg4RGYxb0N4ZFovSVU3MGt5TzJ6alRhaXZZ?=
 =?utf-8?B?bHlzL2lyZnMrMDJ3dFljc0YzUSsvVzZTNkY5VHVpdW1hbnM5M2JMeWRVOG9t?=
 =?utf-8?B?Y3lpdXRrYURURTUvaTl0YU1HM3BzWUsxSjRCeVAzNzJyK050dk5RMTdTQXBk?=
 =?utf-8?B?dkFZZXNQaW56L05xbUJVVGNLOGFmU2xPN1h5dG1qOUJYQzd2d29MelFRc3Z3?=
 =?utf-8?B?NzJDcENFSzIrMVRPcHJyODdML3ZaWWtXbXpZK3hJTWlVODVnYlAraXJ2d0Jk?=
 =?utf-8?B?U3J5Q0VMa3FpWE9mUVpwMmRmWWtjNVM2UDdWaXB3eHhQMXFOVW1rcGIweFlz?=
 =?utf-8?B?TEVDeXF5a0t3blBLNXdxZVRFRCtpYTFkWVdXZHRjTWFYcG1LbWhBaHBNenZG?=
 =?utf-8?B?enY2TU9rYnlPcGpZUk94TitFY0FYK1RWR2VCZm1Zb0kzdGtFdWt6ZWVxdE5l?=
 =?utf-8?B?d1kzSzN2bzU4cmk5bDQ2aHk3TUtXclZvRUlqWTdNQVVadUQyRlNWMnNUblFJ?=
 =?utf-8?B?SEEzRUFTcThMLzFydFV5QUppejJqazl5VHdIYXVKQXgzQ2xmOHpsU0hIeHkv?=
 =?utf-8?B?RU1YWDdwb3docGRLZDZBNVR6K0pJdCsvbXAwZGRxSERxc3dpaDNVK2o5aHdN?=
 =?utf-8?B?aTJPTWdTOEFFVnVRWEt3aFhtTkJhdXUzaFBOY2F4WFgvQzQwWVdud2VHV1ZQ?=
 =?utf-8?B?MFN5dkpKbEIxdDVlaE9rV0pWQkdqL0s5SmtMQmw1OW1aNFZmNmJMRTdsc3N2?=
 =?utf-8?B?dlNvMjAzQmk4THlHVWM5Mk0vbStqelUxc2lnWmRRZmJub3R4TWFtS1dzUUdW?=
 =?utf-8?B?QkVHVDZqYitKclZQaDgzU3hmaEwwVTVqaVlLZjhNc042WnBtUHQzVW1PL3VH?=
 =?utf-8?B?OXlDakRnekpTT092T3FXTGQxQ2N5cEFpUE1MY0RnekpIVlVUeGpBbGhUWkNv?=
 =?utf-8?B?MHZJOEpGbmFPZHFRNXc4NWRjMHZNRjB3V2twcmkyUkFlUGlGSE9VUlJzMjJh?=
 =?utf-8?Q?iKeh7HMCjouve3Dw=3D?=
X-Exchange-RoutingPolicyChecked: XefflZ2gFwo1Dp7MKWWeQYIEUPw1QsNOXnRRA2zgo22UZz4APYHQE7ahok1R/wIkc2gv47WUSjz+rspGIcewVPp5iLulEpc/eYzc7UUl0XUsxofXoX5TayQesHk896jtYa/NrRXfDu4Do5Onpqt0h85tqx6EhCJsGa1djh/f2xzsJFrHMsxOZJKmaFYDJ0/iI3w+DjGQbOFReNcJQGZoeCDoR3lfnAeI92yMWSF0prRkocJ0kbfnX2maK/F2q5ra3KDCCu/ua0k+xi4d+UiyC8ePD+DL0n6Cyj/8gK8rJReMt9cATDtdK4WoPtvXeR91vYioBXWuDMkY/iBpWhxwKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bafbe4c-a3a6-4f35-df09-08df0d759166
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5871.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:51:12.8505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmFRXZrog+nDe4u69JI9OfjarMzC/GQcPXqLxTH5usHOCGdP2GjMleu5jxsxkUlKMbqSt+uVxFL9U5NN8cbsGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB371697
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

--------------b8aGyvE6mu6qWbPiZ7PUtBJn
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chaitanya!

Thanks for the review.

On 31-08-2026 02:25 pm, Borah, Chaitanya Kumar wrote:
>
>
> On 8/19/2026 1:08 PM, Swati Sharma wrote:
>> Add a new IGT test to validate HDMI TMDS audio bandwidth constraints
>> under constrained horizontal blanking intervals.
>>
>> The test injects EDIDs declaring all 7 CEA sample rates (32kHz-192kHz)
>> and observes which rates the driver exposes via ELD (EDID-Like Data)
>> under varying BPC and channel configurations.
>>
>> Subtests:
>> - audio-bw-supported: Baseline with hblank=160 where audio bandwidth
>>    is sufficient for all configurations.
>> - audio-bw-pruned: Constrained hblank=80 (CVT RB2) where the driver
>>    must prune unsustainable sample rates or disable audio entirely.
>> - suspend-s3/s4-audio-recovery: Verify audio state and sample rates
>>    are preserved across system suspend/resume.
>> - runtime-suspend-audio-recovery: Verify audio state is preserved
>>    across DPMS off/on cycles.
>>
>> The test uses the HDMI TMDS bandwidth formula from the spec:
>>    pkts_avail = FLOOR((CEIL(hblank * bpc/8) - overhead) / 32)
>>    pkts_reqd  = CEIL(R_AP * T_line)
>> where overhead=74 (HDCP 1.4 rekey always reserved by the driver).
>>
>> Assertions verify:
>> - Audio is active when bandwidth is available (pkts_avail > 0)
>> - Audio is inactive when bandwidth is exhausted (pkts_avail == 0)
>> - No sample rate requiring more packets than available appears in ELD
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>> ---
>>   tests/intel/kms_hdmi_audio_bw.c | 626 ++++++++++++++++++++++++++++++++
>>   tests/meson.build               |   1 +
>>   2 files changed, 627 insertions(+)
>>   create mode 100644 tests/intel/kms_hdmi_audio_bw.c
>>
>> diff --git a/tests/intel/kms_hdmi_audio_bw.c 
>> b/tests/intel/kms_hdmi_audio_bw.c
>> new file mode 100644
>> index 000000000..4b6f0d001
>> --- /dev/null
>> +++ b/tests/intel/kms_hdmi_audio_bw.c
>> @@ -0,0 +1,626 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: kms hdmi audio bw
>> + * Category: Display
>> + * Description: Validate HDMI TMDS audio bandwidth constraints by 
>> injecting
>> + *              EDIDs with all sample rates declared and observing 
>> which rates
>> + *              the driver exposes (via ELD) under varying BPC / 
>> channel /
>> + *              hblank configurations.
>> + * Driver requirement: i915, xe
>> + * Mega feature: Display Audio
>> + */
>> +
>> +#include "config.h"
>> +
>> +#include <math.h>
>> +#include <string.h>
>> +
>> +#include "igt.h"
>> +#include "igt_edid.h"
>> +#include "igt_eld.h"
>> +#include "igt_aux.h"
>> +#include "xe/xe_query.h"
>
> What is this used for?

It doesn't seems to be required and has been removed in v2.
>
>> +
>> +/**
>> + * SUBTEST: audio-bw-supported
>> + * Description: Baseline test with hblank=160 where audio bandwidth is
>> + *              sufficient for all BPC and channel combinations. 
>> Verifies
>> + *              that no sample rates are pruned.
>> + *
>> + * SUBTEST: audio-bw-pruned
>> + * Description: Constrained test with hblank=80 (CVT RB2) where audio
>> + *              bandwidth is limited. Logs which sample rates are 
>> pruned
>> + *              per BPC and channel combination.
>> + *
>> + * SUBTEST: suspend-%s-audio-recovery
>> + * Description: Validate audio state restoration after %arg[1] with
>> + *              constrained hblank=80 and 12bpc.
>> + *
>> + * arg[1]:
>> + *
>> + * @s3:  S3 (suspend to RAM)
>> + * @s4:  S4 (hibernate)
>> + *
>> + * SUBTEST: runtime-suspend-audio-recovery
>> + * Description: Validate audio state restoration after runtime 
>> suspend/resume
>> + *              with constrained hblank=80 and 12bpc.
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Validate HDMI TMDS audio bandwidth constraints. "
>> +              "EDIDs declare all sample rates (32k-192k); the test "
>> +              "observes which rates survive in the ELD under "
>> +              "constrained hblank timings.");
>> +
>> +typedef struct {
>> +    int drm_fd;
>> +    igt_display_t display;
>> +    igt_output_t *output;
>> +    igt_crtc_t *crtc;
>> +    struct igt_fb fb;
>> +} data_t;
>> +
>> +/* All sample rates declared in the EDID SAD */
>> +#define ALL_SAMPLE_RATES (CEA_SAD_SAMPLING_RATE_32KHZ | \
>> +              CEA_SAD_SAMPLING_RATE_44KHZ | \
>> +              CEA_SAD_SAMPLING_RATE_48KHZ | \
>> +              CEA_SAD_SAMPLING_RATE_88KHZ | \
>> +              CEA_SAD_SAMPLING_RATE_96KHZ | \
>> +              CEA_SAD_SAMPLING_RATE_176KHZ | \
>> +              CEA_SAD_SAMPLING_RATE_192KHZ)
>> +
>> +struct rate_info {
>> +    unsigned int flag;
>> +    const char *name;
>> +    int freq_hz;
>> +};
>> +
>> +static const struct rate_info rate_table[] = {
>> +    { CEA_SAD_SAMPLING_RATE_32KHZ,  "32k",   32000 },
>> +    { CEA_SAD_SAMPLING_RATE_44KHZ,  "44.1k", 44100 },
>> +    { CEA_SAD_SAMPLING_RATE_48KHZ,  "48k",   48000 },
>> +    { CEA_SAD_SAMPLING_RATE_88KHZ,  "88k",   88200 },
>> +    { CEA_SAD_SAMPLING_RATE_96KHZ,  "96k",   96000 },
>> +    { CEA_SAD_SAMPLING_RATE_176KHZ, "176k",  176400 },
>> +    { CEA_SAD_SAMPLING_RATE_192KHZ, "192k",  192000 },
>> +};
>> +
>> +#define ACR_RATE_MAX        1500
>> +#define TOLERANCE_AUDIOCLK_PPM    1000
>> +#define TOLERANCE_PIXELCLK    0.005
>> +#define HBLANK_OVERHEAD_STD    30
>> +#define HBLANK_OVERHEAD_HDCP14    74
>> +#define DI_PACKET_SIZE        32
>> +
>> +static void rates_to_str(unsigned int rates, char *buf, size_t len)
>> +{
>> +    int pos = 0;
>> +
>> +    buf[0] = '\0';
>> +    for (int i = 0; i < ARRAY_SIZE(rate_table); i++) {
>> +        if (!(rates & rate_table[i].flag))
>> +            continue;
>> +        if (pos > 0)
>> +            pos += snprintf(buf + pos, len - pos, ",");
>> +        pos += snprintf(buf + pos, len - pos, "%s", 
>> rate_table[i].name);
>> +    }
>> +    if (pos == 0)
>> +        snprintf(buf, len, "none");
>> +}
>> +
>> +static const int bpc_values[] = { 8, 10, 12 };
>> +static const int channel_values[] = { 2, 8 };
>> +
>> +/*
>> + * 1920x1080@60Hz CVT RB2 — hblank=80 (constrained)
>> + * Available Packets/Line = FLOOR(((BPC/8)*80 - 74) / 32)
>> + *   8bpc=0, 10bpc=0, 12bpc=1
>> + */
>> +static const drmModeModeInfo mode_1080p_hblank80 = {
>> +    .clock = 133320,
>> +    .hdisplay = 1920,
>> +    .hsync_start = 1928,
>> +    .hsync_end = 1960,
>> +    .htotal = 2000,        /* hblank = 80 */
>> +    .vdisplay = 1080,
>> +    .vsync_start = 1097,
>> +    .vsync_end = 1105,
>> +    .vtotal = 1111,
>> +    .vrefresh = 60,
>> +    .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
>> +    .type = DRM_MODE_TYPE_DRIVER,
>> +    .name = "1920x1080",
>> +};
>> +
>> +/*
>> + * 1920x1080@60Hz with hblank=160 (relaxed baseline)
>> + * Enough hblank for audio at any BPC.
>> + */
>> +static const drmModeModeInfo mode_1080p_hblank160 = {
>> +    .clock = 148500,
>> +    .hdisplay = 1920,
>> +    .hsync_start = 1968,
>> +    .hsync_end = 2000,
>> +    .htotal = 2080,        /* hblank = 160 */
>> +    .vdisplay = 1080,
>> +    .vsync_start = 1097,
>> +    .vsync_end = 1105,
>> +    .vtotal = 1111,
>> +    .vrefresh = 60,
>> +    .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
>> +    .type = DRM_MODE_TYPE_DRIVER,
>> +    .name = "1920x1080",
>> +};
>> +
>> +static igt_output_t *find_hdmi_output(igt_display_t *display)
>> +{
>> +    igt_output_t *output;
>> +
>> +    for_each_connected_output(display, output) {
>> +        drmModeConnector *c = output->config.connector;
>> +
>> +        if (c->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
>> +            c->connector_type == DRM_MODE_CONNECTOR_HDMIB)
>> +            return output;
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +static int hblank_of(const drmModeModeInfo *mode)
>> +{
>> +    return mode->htotal - mode->hdisplay;
>> +}
>> +
>> +/*
>> + * Driver always reserves HDCP 1.4 rekey overhead (74 clocks) even when
>> + * HDCP is not active: 30 (standard) + 44 (HDCP 1.4 rekey quiet 
>> period).
>> + * FIXME: once driver exposes HDCP state, use 30 for no HDCP, 74 for 
>> HDCP 1.4.
>> + */
>> +static int avail_pkts_per_line(int bpc, int hblank)
>> +{
>> +    int overhead = HBLANK_OVERHEAD_HDCP14;
>> +    int tb_blank = (bpc * hblank + 7) / 8; /* CEIL(hblank * bpc/8) */
>> +    int avail = (tb_blank - overhead) / DI_PACKET_SIZE;
>> +
>> +    return avail > 0 ? avail : 0;
>> +}
>> +
>> +/* Packets required per line for a given audio rate and channel 
>> layout */
>> +static int required_pkts_per_line(const drmModeModeInfo *mode, int 
>> freq_hz,
>> +                 int channels)
>> +{
>> +    double ap = (channels <= 2) ? 0.25 : 1.0;
>> +    double f_pixel_max = mode->clock * 1000.0 * (1 + 
>> TOLERANCE_PIXELCLK);
>> +    double t_line = mode->htotal / f_pixel_max;
>> +    double r_ap = ((freq_hz * ap) + (2 * ACR_RATE_MAX)) *
>> +              (1 + TOLERANCE_AUDIOCLK_PPM / 1e6);
>> +
>> +    double avg_pkts = r_ap * t_line;
>> +
>> +    return (int)avg_pkts + (avg_pkts > (int)avg_pkts ? 1 : 0);
>> +}
>> +
>> +/*
>> + * Build a CEA EDID declaring all 7 sample rates in the SAD.
>> + * Deep-color flags in HDMI VSDB match the requested bpc.
>> + */
>> +static const struct edid *
>> +build_edid(int bpc, int audio_channels)
>> +{
>> +    static unsigned char raw_edid[2 * EDID_BLOCK_SIZE];
>> +    struct edid *edid;
>> +    struct edid_ext *ext;
>> +    struct edid_cea *cea;
>> +    struct edid_cea_data_block *block;
>> +    struct cea_sad sad;
>> +    struct hdmi_vsdb hdmi;
>
> nit: Let's call it vsdb.

Done in v2.

>
>> +    struct cea_speaker_alloc speakers;
>> +    size_t offset = 0;
>> +
>> +    memset(raw_edid, 0, sizeof(raw_edid));
>> +    edid = (struct edid *)raw_edid;
>> +    memcpy(edid, igt_kms_get_base_edid(), sizeof(struct edid));
>> +    edid->extensions_len = 1;
>> +
>> +    ext = &edid->extensions[0];
>> +    cea = &ext->data.cea;
>> +
>> +    if (audio_channels > 0) {
>> +        cea_sad_init_pcm(&sad,
>> +                 audio_channels,
>> +                 ALL_SAMPLE_RATES,
>> +                 CEA_SAD_SAMPLE_SIZE_16 |
>> +                 CEA_SAD_SAMPLE_SIZE_24);
>> +        block = (struct edid_cea_data_block *)&cea->data[offset];
>> +        offset += edid_cea_data_block_set_sad(block, &sad, 1);
>> +    }
>> +
>> +    memset(&hdmi, 0, sizeof(hdmi));
>> +    hdmi.src_phy_addr[0] = 0x10;
>> +    hdmi.src_phy_addr[1] = 0x00;
>> +    hdmi.flags1 = HDMI_VSDB_SUPPORTS_AI;
>> +    hdmi.max_tdms_clock = 340000000 / (5 * 1000000);
>
> where do these number come from?

Added documentation for these numbers in v2.

>
>> +
>> +    switch (bpc) {
>> +    case 12:
>> +        hdmi.flags1 |= HDMI_VSDB_DC_36BIT;
>> +        /* fall through */
>> +    case 10:
>> +        hdmi.flags1 |= HDMI_VSDB_DC_30BIT;
>> +        /* fall through */
>> +    case 8:
>> +        break;
>> +    }
>> +
>> +    block = (struct edid_cea_data_block *)&cea->data[offset];
>> +    offset += edid_cea_data_block_set_hdmi_vsdb(block, &hdmi,
>> +                            sizeof(hdmi));
>> +
>> +    memset(&speakers, 0, sizeof(speakers));
>> +    speakers.speakers = CEA_SPEAKER_FRONT_LEFT_RIGHT;
>> +    if (audio_channels > 2)
>> +        speakers.speakers |= CEA_SPEAKER_FRONT_CENTER |
>> +                     CEA_SPEAKER_LFE |
>> +                     CEA_SPEAKER_REAR_LEFT_RIGHT;
>
> Not really a problem for this test but we are adding 6 speakers for 
> anything with greater than 2 channels.

Fixed in v2. Speaker allocation done for 2 and 8 channels only.

>
>
>> +    block = (struct edid_cea_data_block *)&cea->data[offset];
>> +    offset += edid_cea_data_block_set_speaker_alloc(block, &speakers);
>> +
>> +    edid_ext_set_cea(ext, offset, 0,
>> +             EDID_CEA_BASIC_AUDIO | EDID_CEA_UNDERSCAN |
>> +             EDID_CEA_YCBCR444 | EDID_CEA_YCBCR422);
>> +    edid_update_checksum(edid);
>> +
>> +    return edid;
>> +}
>> +
>> +static void force_edid_and_connector(data_t *data, const struct edid 
>> *edid)
>> +{
>> +    kmstest_force_edid(data->drm_fd, data->output->config.connector, 
>> edid);
>> +    igt_skip_on_f(!kmstest_force_connector(data->drm_fd,
>> + data->output->config.connector,
>> +                           FORCE_CONNECTOR_ON),
>> +              "Could not force HDMI connector on\n");
>> +}
>> +
>> +static void cleanup_connector(data_t *data)
>> +{
>> +    if (data->output->pending_crtc) {
>> +        igt_plane_t *primary;
>> +
>> +        primary = igt_output_get_plane_type(data->output,
>> +                            DRM_PLANE_TYPE_PRIMARY);
>> +        igt_plane_set_fb(primary, NULL);
>> +        igt_output_set_crtc(data->output, NULL);
>> +        igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +    }
>> +
>> +    igt_remove_fb(data->drm_fd, &data->fb);
>> +
>> +    kmstest_force_connector(data->drm_fd,
>> +                data->output->config.connector,
>> +                FORCE_CONNECTOR_UNSPECIFIED);
>> +    kmstest_force_edid(data->drm_fd,
>> +               data->output->config.connector, NULL);
>> +}
>> +
>> +static int try_modeset(data_t *data, const drmModeModeInfo *mode)
>> +{
>> +    igt_plane_t *primary;
>> +    int ret;
>> +
>> +    igt_display_reset(&data->display);
>> +
>> +    igt_output_set_crtc(data->output, data->crtc);
>> +    igt_output_override_mode(data->output, mode);
>> +
>> +    primary = igt_output_get_plane_type(data->output,
>> +                        DRM_PLANE_TYPE_PRIMARY);
>> +
>> +    igt_create_pattern_fb(data->drm_fd,
>> +                  mode->hdisplay, mode->vdisplay,
>> +                  DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> +                  &data->fb);
>> +    igt_plane_set_fb(primary, &data->fb);
>> +
>> +    ret = igt_display_try_commit_atomic(&data->display,
>> +                        DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +                        NULL);
>> +    if (ret) {
>> +        igt_plane_set_fb(primary, NULL);
>> +        igt_output_set_crtc(data->output, NULL);
>> +        igt_remove_fb(data->drm_fd, &data->fb);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static bool audio_is_active(void)
>> +{
>> +    if (!eld_is_supported())
>> +        return false;
>> +
>> +    return eld_has_igt();
>> +}
>> +
>> +static unsigned int get_eld_rates(void)
>> +{
>> +    struct eld_entry eld;
>> +
>> +    if (!eld_get_igt(&eld))
>> +        return 0;
>> +
>> +    if (eld.sads_len == 0)
>> +        return 0;
>> +
>> +    return eld.sads[0].rates;
>
> This is heavily dependent on the semantics that currently we only add 
> one SAD in build_eld. Let's document this atleast.

Done in v2.

>
>> +}
>> +
>> +static void log_eld_rates(unsigned int declared, unsigned int 
>> eld_rates)
>> +{
>> +    char decl_str[128], eld_str[128], pruned_str[128];
>> +    unsigned int pruned = declared & ~eld_rates;
>> +
>> +    rates_to_str(declared, decl_str, sizeof(decl_str));
>> +    rates_to_str(eld_rates, eld_str, sizeof(eld_str));
>> +    rates_to_str(pruned, pruned_str, sizeof(pruned_str));
>> +
>> +    igt_info("    SAD declared: %s\n", decl_str);
>> +    igt_info("    ELD reports:  %s\n", eld_str);
>> +    if (pruned)
>> +        igt_info("    Pruned:       %s\n", pruned_str);
>> +}
>> +
>> +static void assert_per_rate(const drmModeModeInfo *mode, int channels,
>> +               int pkts_avail, unsigned int eld_rates)
>> +{
>> +    for (int i = 0; i < ARRAY_SIZE(rate_table); i++) {
>> +        int req = required_pkts_per_line(mode, rate_table[i].freq_hz,
>> +                         channels);
>> +        bool in_eld = eld_rates & rate_table[i].flag;
>> +
>> +        /* A rate that can't fit must not appear in ELD */
>> +        igt_assert_f(!(req > pkts_avail && in_eld),
>> +                 "%s: req=%d > avail=%d but rate present in ELD\n",
>> +                 rate_table[i].name, req, pkts_avail);
>
> This check does not protect againts cases where the driver over 
> prunes. It asserts true all req <= pkts_avail cases, irrespective of 
> in_eld.
>
Added check for over-prunning i.e. rate that fits but got dropped.
>> +    }
>> +}
>> +
>> +static void log_per_rate_analysis(const drmModeModeInfo *mode,
>> +                  int bpc, int channels,
>> +                  int pkts_avail, unsigned int eld_rates)
>> +{
>> +    const char *layout = (channels <= 2) ? "L0" : "L1";
>> +
>> +    igt_info("    %-6s %-3s  pkts: avail=%d\n",
>> +         "Rate", layout, pkts_avail);
>> +
>> +    for (int i = 0; i < ARRAY_SIZE(rate_table); i++) {
>> +        int req = required_pkts_per_line(mode, rate_table[i].freq_hz,
>> +                         channels);
>> +        const char *expect = (req <= pkts_avail && pkts_avail > 0) ?
>> +                     "fit" : "NO";
>> +        const char *eld_has = (eld_rates & rate_table[i].flag) ?
>> +                     "yes" : "no";
>> +
>> +        igt_info("      %5s: req=%d fit=%s  (ELD: %s)\n",
>> +             rate_table[i].name, req, expect, eld_has);
>> +    }
>> +}
>> +
>> +/* Run the BPC × channels matrix for a given mode/hblank. */
>> +static void test_audio_bw_matrix(data_t *data, const drmModeModeInfo 
>> *mode)
>> +{
>> +    int hblank = hblank_of(mode);
>> +
>> +    igt_info("=== Audio BW matrix: %s hblank=%d ===\n",
>> +         mode->name, hblank);
>> +
>> +    for (int b = 0; b < ARRAY_SIZE(bpc_values); b++) {
>> +        int bpc = bpc_values[b];
>> +
>> +        for (int c = 0; c < ARRAY_SIZE(channel_values); c++) {
>> +            int channels = channel_values[c];
>> +            const struct edid *edid;
>> +            int pkts, ret;
>> +            bool audio;
>> +            unsigned int eld_rates;
>> +
>> +            edid = build_edid(bpc, channels);
>> +            force_edid_and_connector(data, edid);
>> +
>> +            igt_output_set_prop_value(data->output,
>> +                          IGT_CONNECTOR_MAX_BPC, bpc);
>> +
>> +            pkts = avail_pkts_per_line(bpc, hblank);
>> +
>> +            igt_info("\n  %dbpc %dch hblank=%d avail_pkts=%d\n",
>> +                 bpc, channels, hblank, pkts);
>> +
>> +            ret = try_modeset(data, mode);
>> +
>> +            if (ret) {
>> +                igt_info("    modeset: REJECTED\n");
>> +                cleanup_connector(data);
>> +                continue;
>> +            }
>> +
>> +            /* Allow ELD to propagate */
>> +            usleep(200 * 1000);
>> +
>> +            audio = audio_is_active();
>> +            eld_rates = audio ? get_eld_rates() : 0;
>> +
>> +            igt_info("    modeset: OK\n");
>> +            igt_info("    audio:   %s\n", audio ? "active" : 
>> "inactive");
>> +
>> +            igt_assert_f(!(pkts == 0 && audio),
>> +                     "Audio active with 0 available packets\n");
>> +            igt_assert_f(!(pkts > 0 && !audio),
>> +                     "Audio inactive with %d available packets\n",
>> +                     pkts);
>> +
>> +            if (audio) {
>> +                log_eld_rates(ALL_SAMPLE_RATES, eld_rates);
>> +                assert_per_rate(mode, channels, pkts,
>> +                        eld_rates);
>> +            }
>> +
>> +            log_per_rate_analysis(mode, bpc, channels,
>> +                          pkts, eld_rates);
>> +
>> +            cleanup_connector(data);
>> +        }
>> +    }
>> +
>> +    igt_info("\n=== End matrix ===\n");
>> +}
>> +
>> +static void test_audio_bw_supported(data_t *data)
>> +{
>> +    test_audio_bw_matrix(data, &mode_1080p_hblank160);
>> +}
>> +
>> +static void test_audio_bw_pruned(data_t *data)
>> +{
>> +    test_audio_bw_matrix(data, &mode_1080p_hblank80);
>> +}
>> +
>> +static void test_suspend_audio_recovery(data_t *data,
>> +                    enum igt_suspend_state state)
>> +{
>> +    const struct edid *edid;
>> +    bool audio_before, audio_after;
>> +    unsigned int rates_before, rates_after;
>> +    char before_str[128], after_str[128];
>> +    int ret;
>> +
>> +    edid = build_edid(12, 2);
>> +    force_edid_and_connector(data, edid);
>> +
>> +    igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 12);
>> +
>> +    ret = try_modeset(data, &mode_1080p_hblank80);
>> +    igt_require(ret == 0);
>> +
>> +    usleep(200 * 1000);
>
> Is this empirical? I understand it is being already being used 
> kms_hdmi_inject but 200ms looks like a lot.


hmm. right. Replaced with igt_wait(), keeping upper bound as 200ms.

>
>> +
>> +    audio_before = audio_is_active();
>> +    rates_before = audio_before ? get_eld_rates() : 0;
>> +    rates_to_str(rates_before, before_str, sizeof(before_str));
>> +    igt_info("Before suspend: audio=%d rates=%s\n",
>> +         audio_before, before_str);
>> +
>> +    igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
>> +
>> +    usleep(200 * 1000);
>> +
>> +    audio_after = audio_is_active();
>> +    rates_after = audio_after ? get_eld_rates() : 0;
>> +    rates_to_str(rates_after, after_str, sizeof(after_str));
>> +    igt_info("After suspend:  audio=%d rates=%s\n",
>> +         audio_after, after_str);
>> +
>> +    igt_assert_eq(audio_before, audio_after);
>> +    if (audio_before)
>> +        igt_assert_eq(rates_before, rates_after);
>> +
>> +    cleanup_connector(data);
>> +}
>> +
>> +static void test_runtime_suspend_audio(data_t *data)
>> +{
>> +    const struct edid *edid;
>> +    bool audio_before, audio_after;
>> +    unsigned int rates_before, rates_after;
>> +    char before_str[128], after_str[128];
>> +    int ret;
>> +
>> +    edid = build_edid(12, 2);
>> +    force_edid_and_connector(data, edid);
>> +
>> +    igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 12);
>> +
>> +    ret = try_modeset(data, &mode_1080p_hblank80);
>> +    igt_require(ret == 0);
>> +
>> +    usleep(200 * 1000);
>> +
>> +    audio_before = audio_is_active();
>> +    rates_before = audio_before ? get_eld_rates() : 0;
>> +    rates_to_str(rates_before, before_str, sizeof(before_str));
>> +    igt_info("Before runtime suspend: audio=%d rates=%s\n",
>> +         audio_before, before_str);
>> +
>> +    kmstest_set_connector_dpms(data->drm_fd,
>> +                   data->output->config.connector,
>> +                   DRM_MODE_DPMS_OFF);
>> +    usleep(500 * 1000);
>> +    kmstest_set_connector_dpms(data->drm_fd,
>> +                   data->output->config.connector,
>> +                   DRM_MODE_DPMS_ON);
>> +    usleep(500 * 1000);
>> +
>> +    audio_after = audio_is_active();
>> +    rates_after = audio_after ? get_eld_rates() : 0;
>> +    rates_to_str(rates_after, after_str, sizeof(after_str));
>> +    igt_info("After runtime suspend:  audio=%d rates=%s\n",
>> +         audio_after, after_str);
>> +
>> +    igt_assert_eq(audio_before, audio_after);
>> +    if (audio_before)
>> +        igt_assert_eq(rates_before, rates_after);
>> +
>> +    cleanup_connector(data);
>> +}
>
> test_suspend_audio_recovery and test_runtime_suspend_audio are almost 
> identical. Can we converge them?


Done in v2

>
>> +
>> +int igt_main()
>> +{
>> +    data_t data = {};
>> +
>> +    igt_fixture() {
>> +        data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>> +        igt_require(is_intel_device(data.drm_fd));
>> +        kmstest_set_vt_graphics_mode();
>> +        igt_display_require(&data.display, data.drm_fd);
>> +
>> +        data.output = find_hdmi_output(&data.display);
>> +        igt_require_f(data.output, "No HDMI connector found\n");
>> +
>> +        data.crtc = igt_first_crtc(&data.display);
>> +        igt_require_f(data.crtc, "No usable CRTC found\n");
>> +    }
>> +
>> +    igt_describe("Baseline: hblank=160, audio should be fully 
>> supported "
>> +             "for all BPC and channel configurations.");
>> +    igt_subtest("audio-bw-supported")
>> +        test_audio_bw_supported(&data);
>> +
>> +    igt_describe("Constrained: hblank=80 (CVT RB2), audio may be 
>> pruned "
>> +             "or disabled depending on BPC.");
>> +    igt_subtest("audio-bw-pruned")
>> +        test_audio_bw_pruned(&data);
>> +
>> +    igt_describe("Validate audio recovery after S3 suspend with "
>> +             "constrained hblank.");
>> +    igt_subtest("suspend-s3-audio-recovery")
>> +        test_suspend_audio_recovery(&data, SUSPEND_STATE_MEM);
>
> The documentation for igt_suspend_state says "A memory sleep 
> (non-hibernation) target state, respecting the system's mem_sleep 
> default" if your intention is to deterministically go to S3 use 
> SUSPEND_STATE_S3 instead.

Renamed subtests and updated documentation : SUSPEND_STATE_MEM 
and SUSPEND_STATE_DISK

>
> May I know why only these two power states were selected in particular?

To cover 2 different recovery paths : SUSPEND_STATE_MEM 
and SUSPEND_STATE_DISK. Similar tests in other binaries aswell.

>> +
>> +    igt_describe("Validate audio recovery after S4 hibernate with "
>> +             "constrained hblank.");
>> +    igt_subtest("suspend-s4-audio-recovery")
>> +        test_suspend_audio_recovery(&data, SUSPEND_STATE_DISK);
>> +
>> +    igt_describe("Validate audio recovery after runtime suspend with "
>> +             "constrained hblank.");
>> +    igt_subtest("runtime-suspend-audio-recovery")
>> +        test_runtime_suspend_audio(&data);
>> +
>> +    igt_fixture() {
>> +        igt_display_fini(&data.display);
>> +        drm_close_driver(data.drm_fd);
>> +    }
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index a62f447df..facb7ab5d 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -259,6 +259,7 @@ intel_kms_progs = [
>>       'kms_fbc_dirty_rect',
>>       'kms_fbcon_fbt',
>>       'kms_fence_pin_leak',
>> +    'kms_hdmi_audio_bw',
>
> needs to be alphabetical order?


Yes, done.

>
>>       'kms_flip_scaled_crc',
>>       'kms_flip_tiling',
>>       'kms_frontbuffer_tracking',
>
--------------b8aGyvE6mu6qWbPiZ7PUtBJn
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Chaitanya!</p>
    <p>Thanks for the review.</p>
    <div class="moz-cite-prefix">On 31-08-2026 02:25 pm, Borah,
      Chaitanya Kumar wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com">
      <br>
      <br>
      On 8/19/2026 1:08 PM, Swati Sharma wrote:
      <br>
      <blockquote type="cite">Add a new IGT test to validate HDMI TMDS
        audio bandwidth constraints
        <br>
        under constrained horizontal blanking intervals.
        <br>
        <br>
        The test injects EDIDs declaring all 7 CEA sample rates
        (32kHz-192kHz)
        <br>
        and observes which rates the driver exposes via ELD (EDID-Like
        Data)
        <br>
        under varying BPC and channel configurations.
        <br>
        <br>
        Subtests:
        <br>
        - audio-bw-supported: Baseline with hblank=160 where audio
        bandwidth
        <br>
        &nbsp;&nbsp; is sufficient for all configurations.
        <br>
        - audio-bw-pruned: Constrained hblank=80 (CVT RB2) where the
        driver
        <br>
        &nbsp;&nbsp; must prune unsustainable sample rates or disable audio
        entirely.
        <br>
        - suspend-s3/s4-audio-recovery: Verify audio state and sample
        rates
        <br>
        &nbsp;&nbsp; are preserved across system suspend/resume.
        <br>
        - runtime-suspend-audio-recovery: Verify audio state is
        preserved
        <br>
        &nbsp;&nbsp; across DPMS off/on cycles.
        <br>
        <br>
        The test uses the HDMI TMDS bandwidth formula from the spec:
        <br>
        &nbsp;&nbsp; pkts_avail = FLOOR((CEIL(hblank * bpc/8) - overhead) / 32)
        <br>
        &nbsp;&nbsp; pkts_reqd&nbsp; = CEIL(R_AP * T_line)
        <br>
        where overhead=74 (HDCP 1.4 rekey always reserved by the
        driver).
        <br>
        <br>
        Assertions verify:
        <br>
        - Audio is active when bandwidth is available (pkts_avail &gt;
        0)
        <br>
        - Audio is inactive when bandwidth is exhausted (pkts_avail ==
        0)
        <br>
        - No sample rate requiring more packets than available appears
        in ELD
        <br>
        <br>
        Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
        <br>
        Assisted-by: GitHub Copilot:Claude Opus 4.6
        <br>
        ---
        <br>
        &nbsp; tests/intel/kms_hdmi_audio_bw.c | 626
        ++++++++++++++++++++++++++++++++
        <br>
        &nbsp; tests/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +
        <br>
        &nbsp; 2 files changed, 627 insertions(+)
        <br>
        &nbsp; create mode 100644 tests/intel/kms_hdmi_audio_bw.c
        <br>
        <br>
        diff --git a/tests/intel/kms_hdmi_audio_bw.c
        b/tests/intel/kms_hdmi_audio_bw.c
        <br>
        new file mode 100644
        <br>
        index 000000000..4b6f0d001
        <br>
        --- /dev/null
        <br>
        +++ b/tests/intel/kms_hdmi_audio_bw.c
        <br>
        @@ -0,0 +1,626 @@
        <br>
        +// SPDX-License-Identifier: MIT
        <br>
        +/*
        <br>
        + * Copyright © 2026 Intel Corporation
        <br>
        + */
        <br>
        +
        <br>
        +/**
        <br>
        + * TEST: kms hdmi audio bw
        <br>
        + * Category: Display
        <br>
        + * Description: Validate HDMI TMDS audio bandwidth constraints
        by injecting
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EDIDs with all sample rates declared and
        observing which rates
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the driver exposes (via ELD) under varying BPC
        / channel /
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hblank configurations.
        <br>
        + * Driver requirement: i915, xe
        <br>
        + * Mega feature: Display Audio
        <br>
        + */
        <br>
        +
        <br>
        +#include &quot;config.h&quot;
        <br>
        +
        <br>
        +#include &lt;math.h&gt;
        <br>
        +#include &lt;string.h&gt;
        <br>
        +
        <br>
        +#include &quot;igt.h&quot;
        <br>
        +#include &quot;igt_edid.h&quot;
        <br>
        +#include &quot;igt_eld.h&quot;
        <br>
        +#include &quot;igt_aux.h&quot;
        <br>
        +#include &quot;xe/xe_query.h&quot;
        <br>
      </blockquote>
      <br>
      What is this used for?
      <br>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
    </div>
    It doesn't seems to be required and has been removed in v2.
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com"><br>
      <blockquote type="cite">+
        <br>
        +/**
        <br>
        + * SUBTEST: audio-bw-supported
        <br>
        + * Description: Baseline test with hblank=160 where audio
        bandwidth is
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sufficient for all BPC and channel
        combinations. Verifies
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; that no sample rates are pruned.
        <br>
        + *
        <br>
        + * SUBTEST: audio-bw-pruned
        <br>
        + * Description: Constrained test with hblank=80 (CVT RB2) where
        audio
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bandwidth is limited. Logs which sample rates
        are pruned
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; per BPC and channel combination.
        <br>
        + *
        <br>
        + * SUBTEST: suspend-%s-audio-recovery
        <br>
        + * Description: Validate audio state restoration after %arg[1]
        with
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; constrained hblank=80 and 12bpc.
        <br>
        + *
        <br>
        + * arg[1]:
        <br>
        + *
        <br>
        + * @s3:&nbsp; S3 (suspend to RAM)
        <br>
        + * @s4:&nbsp; S4 (hibernate)
        <br>
        + *
        <br>
        + * SUBTEST: runtime-suspend-audio-recovery
        <br>
        + * Description: Validate audio state restoration after runtime
        suspend/resume
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with constrained hblank=80 and 12bpc.
        <br>
        + */
        <br>
        +
        <br>
        +IGT_TEST_DESCRIPTION(&quot;Validate HDMI TMDS audio bandwidth
        constraints. &quot;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;EDIDs declare all sample rates (32k-192k); the
        test &quot;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;observes which rates survive in the ELD under &quot;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;constrained hblank timings.&quot;);
        <br>
        +
        <br>
        +typedef struct {
        <br>
        +&nbsp;&nbsp;&nbsp; int drm_fd;
        <br>
        +&nbsp;&nbsp;&nbsp; igt_display_t display;
        <br>
        +&nbsp;&nbsp;&nbsp; igt_output_t *output;
        <br>
        +&nbsp;&nbsp;&nbsp; igt_crtc_t *crtc;
        <br>
        +&nbsp;&nbsp;&nbsp; struct igt_fb fb;
        <br>
        +} data_t;
        <br>
        +
        <br>
        +/* All sample rates declared in the EDID SAD */
        <br>
        +#define ALL_SAMPLE_RATES (CEA_SAD_SAMPLING_RATE_32KHZ | \
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEA_SAD_SAMPLING_RATE_44KHZ | \
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEA_SAD_SAMPLING_RATE_48KHZ | \
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEA_SAD_SAMPLING_RATE_88KHZ | \
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEA_SAD_SAMPLING_RATE_96KHZ | \
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEA_SAD_SAMPLING_RATE_176KHZ | \
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEA_SAD_SAMPLING_RATE_192KHZ)
        <br>
        +
        <br>
        +struct rate_info {
        <br>
        +&nbsp;&nbsp;&nbsp; unsigned int flag;
        <br>
        +&nbsp;&nbsp;&nbsp; const char *name;
        <br>
        +&nbsp;&nbsp;&nbsp; int freq_hz;
        <br>
        +};
        <br>
        +
        <br>
        +static const struct rate_info rate_table[] = {
        <br>
        +&nbsp;&nbsp;&nbsp; { CEA_SAD_SAMPLING_RATE_32KHZ,&nbsp; &quot;32k&quot;,&nbsp;&nbsp; 32000 },
        <br>
        +&nbsp;&nbsp;&nbsp; { CEA_SAD_SAMPLING_RATE_44KHZ,&nbsp; &quot;44.1k&quot;, 44100 },
        <br>
        +&nbsp;&nbsp;&nbsp; { CEA_SAD_SAMPLING_RATE_48KHZ,&nbsp; &quot;48k&quot;,&nbsp;&nbsp; 48000 },
        <br>
        +&nbsp;&nbsp;&nbsp; { CEA_SAD_SAMPLING_RATE_88KHZ,&nbsp; &quot;88k&quot;,&nbsp;&nbsp; 88200 },
        <br>
        +&nbsp;&nbsp;&nbsp; { CEA_SAD_SAMPLING_RATE_96KHZ,&nbsp; &quot;96k&quot;,&nbsp;&nbsp; 96000 },
        <br>
        +&nbsp;&nbsp;&nbsp; { CEA_SAD_SAMPLING_RATE_176KHZ, &quot;176k&quot;,&nbsp; 176400 },
        <br>
        +&nbsp;&nbsp;&nbsp; { CEA_SAD_SAMPLING_RATE_192KHZ, &quot;192k&quot;,&nbsp; 192000 },
        <br>
        +};
        <br>
        +
        <br>
        +#define ACR_RATE_MAX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1500
        <br>
        +#define TOLERANCE_AUDIOCLK_PPM&nbsp;&nbsp;&nbsp; 1000
        <br>
        +#define TOLERANCE_PIXELCLK&nbsp;&nbsp;&nbsp; 0.005
        <br>
        +#define HBLANK_OVERHEAD_STD&nbsp;&nbsp;&nbsp; 30
        <br>
        +#define HBLANK_OVERHEAD_HDCP14&nbsp;&nbsp;&nbsp; 74
        <br>
        +#define DI_PACKET_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32
        <br>
        +
        <br>
        +static void rates_to_str(unsigned int rates, char *buf, size_t
        len)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int pos = 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; buf[0] = '\0';
        <br>
        +&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; ARRAY_SIZE(rate_table); i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(rates &amp; rate_table[i].flag))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pos &gt; 0)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos += snprintf(buf + pos, len - pos, &quot;,&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos += snprintf(buf + pos, len - pos, &quot;%s&quot;,
        rate_table[i].name);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; if (pos == 0)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(buf, len, &quot;none&quot;);
        <br>
        +}
        <br>
        +
        <br>
        +static const int bpc_values[] = { 8, 10, 12 };
        <br>
        +static const int channel_values[] = { 2, 8 };
        <br>
        +
        <br>
        +/*
        <br>
        + * 1920x1080@60Hz CVT RB2 — hblank=80 (constrained)
        <br>
        + * Available Packets/Line = FLOOR(((BPC/8)*80 - 74) / 32)
        <br>
        + *&nbsp;&nbsp; 8bpc=0, 10bpc=0, 12bpc=1
        <br>
        + */
        <br>
        +static const drmModeModeInfo mode_1080p_hblank80 = {
        <br>
        +&nbsp;&nbsp;&nbsp; .clock = 133320,
        <br>
        +&nbsp;&nbsp;&nbsp; .hdisplay = 1920,
        <br>
        +&nbsp;&nbsp;&nbsp; .hsync_start = 1928,
        <br>
        +&nbsp;&nbsp;&nbsp; .hsync_end = 1960,
        <br>
        +&nbsp;&nbsp;&nbsp; .htotal = 2000,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* hblank = 80 */
        <br>
        +&nbsp;&nbsp;&nbsp; .vdisplay = 1080,
        <br>
        +&nbsp;&nbsp;&nbsp; .vsync_start = 1097,
        <br>
        +&nbsp;&nbsp;&nbsp; .vsync_end = 1105,
        <br>
        +&nbsp;&nbsp;&nbsp; .vtotal = 1111,
        <br>
        +&nbsp;&nbsp;&nbsp; .vrefresh = 60,
        <br>
        +&nbsp;&nbsp;&nbsp; .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
        <br>
        +&nbsp;&nbsp;&nbsp; .type = DRM_MODE_TYPE_DRIVER,
        <br>
        +&nbsp;&nbsp;&nbsp; .name = &quot;1920x1080&quot;,
        <br>
        +};
        <br>
        +
        <br>
        +/*
        <br>
        + * 1920x1080@60Hz with hblank=160 (relaxed baseline)
        <br>
        + * Enough hblank for audio at any BPC.
        <br>
        + */
        <br>
        +static const drmModeModeInfo mode_1080p_hblank160 = {
        <br>
        +&nbsp;&nbsp;&nbsp; .clock = 148500,
        <br>
        +&nbsp;&nbsp;&nbsp; .hdisplay = 1920,
        <br>
        +&nbsp;&nbsp;&nbsp; .hsync_start = 1968,
        <br>
        +&nbsp;&nbsp;&nbsp; .hsync_end = 2000,
        <br>
        +&nbsp;&nbsp;&nbsp; .htotal = 2080,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* hblank = 160 */
        <br>
        +&nbsp;&nbsp;&nbsp; .vdisplay = 1080,
        <br>
        +&nbsp;&nbsp;&nbsp; .vsync_start = 1097,
        <br>
        +&nbsp;&nbsp;&nbsp; .vsync_end = 1105,
        <br>
        +&nbsp;&nbsp;&nbsp; .vtotal = 1111,
        <br>
        +&nbsp;&nbsp;&nbsp; .vrefresh = 60,
        <br>
        +&nbsp;&nbsp;&nbsp; .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
        <br>
        +&nbsp;&nbsp;&nbsp; .type = DRM_MODE_TYPE_DRIVER,
        <br>
        +&nbsp;&nbsp;&nbsp; .name = &quot;1920x1080&quot;,
        <br>
        +};
        <br>
        +
        <br>
        +static igt_output_t *find_hdmi_output(igt_display_t *display)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; igt_output_t *output;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for_each_connected_output(display, output) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeConnector *c = output-&gt;config.connector;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (c-&gt;connector_type == DRM_MODE_CONNECTOR_HDMIA ||
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c-&gt;connector_type == DRM_MODE_CONNECTOR_HDMIB)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return output;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return NULL;
        <br>
        +}
        <br>
        +
        <br>
        +static int hblank_of(const drmModeModeInfo *mode)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; return mode-&gt;htotal - mode-&gt;hdisplay;
        <br>
        +}
        <br>
        +
        <br>
        +/*
        <br>
        + * Driver always reserves HDCP 1.4 rekey overhead (74 clocks)
        even when
        <br>
        + * HDCP is not active: 30 (standard) + 44 (HDCP 1.4 rekey quiet
        period).
        <br>
        + * FIXME: once driver exposes HDCP state, use 30 for no HDCP,
        74 for HDCP 1.4.
        <br>
        + */
        <br>
        +static int avail_pkts_per_line(int bpc, int hblank)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int overhead = HBLANK_OVERHEAD_HDCP14;
        <br>
        +&nbsp;&nbsp;&nbsp; int tb_blank = (bpc * hblank + 7) / 8; /* CEIL(hblank *
        bpc/8) */
        <br>
        +&nbsp;&nbsp;&nbsp; int avail = (tb_blank - overhead) / DI_PACKET_SIZE;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return avail &gt; 0 ? avail : 0;
        <br>
        +}
        <br>
        +
        <br>
        +/* Packets required per line for a given audio rate and channel
        layout */
        <br>
        +static int required_pkts_per_line(const drmModeModeInfo *mode,
        int freq_hz,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int channels)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; double ap = (channels &lt;= 2) ? 0.25 : 1.0;
        <br>
        +&nbsp;&nbsp;&nbsp; double f_pixel_max = mode-&gt;clock * 1000.0 * (1 +
        TOLERANCE_PIXELCLK);
        <br>
        +&nbsp;&nbsp;&nbsp; double t_line = mode-&gt;htotal / f_pixel_max;
        <br>
        +&nbsp;&nbsp;&nbsp; double r_ap = ((freq_hz * ap) + (2 * ACR_RATE_MAX)) *
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1 + TOLERANCE_AUDIOCLK_PPM / 1e6);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; double avg_pkts = r_ap * t_line;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return (int)avg_pkts + (avg_pkts &gt; (int)avg_pkts ? 1 :
        0);
        <br>
        +}
        <br>
        +
        <br>
        +/*
        <br>
        + * Build a CEA EDID declaring all 7 sample rates in the SAD.
        <br>
        + * Deep-color flags in HDMI VSDB match the requested bpc.
        <br>
        + */
        <br>
        +static const struct edid *
        <br>
        +build_edid(int bpc, int audio_channels)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; static unsigned char raw_edid[2 * EDID_BLOCK_SIZE];
        <br>
        +&nbsp;&nbsp;&nbsp; struct edid *edid;
        <br>
        +&nbsp;&nbsp;&nbsp; struct edid_ext *ext;
        <br>
        +&nbsp;&nbsp;&nbsp; struct edid_cea *cea;
        <br>
        +&nbsp;&nbsp;&nbsp; struct edid_cea_data_block *block;
        <br>
        +&nbsp;&nbsp;&nbsp; struct cea_sad sad;
        <br>
        +&nbsp;&nbsp;&nbsp; struct hdmi_vsdb hdmi;
        <br>
      </blockquote>
      <br>
      nit: Let's call it vsdb.
      <br>
    </blockquote>
    <p>Done in v2.</p>
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com"><br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; struct cea_speaker_alloc speakers;
        <br>
        +&nbsp;&nbsp;&nbsp; size_t offset = 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; memset(raw_edid, 0, sizeof(raw_edid));
        <br>
        +&nbsp;&nbsp;&nbsp; edid = (struct edid *)raw_edid;
        <br>
        +&nbsp;&nbsp;&nbsp; memcpy(edid, igt_kms_get_base_edid(), sizeof(struct edid));
        <br>
        +&nbsp;&nbsp;&nbsp; edid-&gt;extensions_len = 1;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ext = &amp;edid-&gt;extensions[0];
        <br>
        +&nbsp;&nbsp;&nbsp; cea = &amp;ext-&gt;data.cea;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (audio_channels &gt; 0) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cea_sad_init_pcm(&amp;sad,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; audio_channels,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ALL_SAMPLE_RATES,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEA_SAD_SAMPLE_SIZE_16 |
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEA_SAD_SAMPLE_SIZE_24);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; block = (struct edid_cea_data_block
        *)&amp;cea-&gt;data[offset];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset += edid_cea_data_block_set_sad(block, &amp;sad,
        1);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; memset(&amp;hdmi, 0, sizeof(hdmi));
        <br>
        +&nbsp;&nbsp;&nbsp; hdmi.src_phy_addr[0] = 0x10;
        <br>
        +&nbsp;&nbsp;&nbsp; hdmi.src_phy_addr[1] = 0x00;
        <br>
        +&nbsp;&nbsp;&nbsp; hdmi.flags1 = HDMI_VSDB_SUPPORTS_AI;
        <br>
        +&nbsp;&nbsp;&nbsp; hdmi.max_tdms_clock = 340000000 / (5 * 1000000);
        <br>
      </blockquote>
      <br>
      where do these number come from?
      <br>
    </blockquote>
    <p>Added documentation for these numbers in v2.</p>
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com"><br>
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; switch (bpc) {
        <br>
        +&nbsp;&nbsp;&nbsp; case 12:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hdmi.flags1 |= HDMI_VSDB_DC_36BIT;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* fall through */
        <br>
        +&nbsp;&nbsp;&nbsp; case 10:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hdmi.flags1 |= HDMI_VSDB_DC_30BIT;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* fall through */
        <br>
        +&nbsp;&nbsp;&nbsp; case 8:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; block = (struct edid_cea_data_block
        *)&amp;cea-&gt;data[offset];
        <br>
        +&nbsp;&nbsp;&nbsp; offset += edid_cea_data_block_set_hdmi_vsdb(block,
        &amp;hdmi,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(hdmi));
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; memset(&amp;speakers, 0, sizeof(speakers));
        <br>
        +&nbsp;&nbsp;&nbsp; speakers.speakers = CEA_SPEAKER_FRONT_LEFT_RIGHT;
        <br>
        +&nbsp;&nbsp;&nbsp; if (audio_channels &gt; 2)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; speakers.speakers |= CEA_SPEAKER_FRONT_CENTER |
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEA_SPEAKER_LFE |
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEA_SPEAKER_REAR_LEFT_RIGHT;
        <br>
      </blockquote>
      <br>
      Not really a problem for this test but we are adding 6 speakers
      for anything with greater than 2 channels.
      <br>
    </blockquote>
    <p>Fixed in v2. Speaker allocation done for 2 and 8 channels only.</p>
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com"><br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; block = (struct edid_cea_data_block
        *)&amp;cea-&gt;data[offset];
        <br>
        +&nbsp;&nbsp;&nbsp; offset += edid_cea_data_block_set_speaker_alloc(block,
        &amp;speakers);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; edid_ext_set_cea(ext, offset, 0,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EDID_CEA_BASIC_AUDIO | EDID_CEA_UNDERSCAN |
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EDID_CEA_YCBCR444 | EDID_CEA_YCBCR422);
        <br>
        +&nbsp;&nbsp;&nbsp; edid_update_checksum(edid);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return edid;
        <br>
        +}
        <br>
        +
        <br>
        +static void force_edid_and_connector(data_t *data, const struct
        edid *edid)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; kmstest_force_edid(data-&gt;drm_fd,
        data-&gt;output-&gt;config.connector, edid);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_skip_on_f(!kmstest_force_connector(data-&gt;drm_fd,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        data-&gt;output-&gt;config.connector,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FORCE_CONNECTOR_ON),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Could not force HDMI connector on\n&quot;);
        <br>
        +}
        <br>
        +
        <br>
        +static void cleanup_connector(data_t *data)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; if (data-&gt;output-&gt;pending_crtc) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; primary = igt_output_get_plane_type(data-&gt;output,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_PLANE_TYPE_PRIMARY);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(primary, NULL);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_crtc(data-&gt;output, NULL);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display,
        COMMIT_ATOMIC);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; kmstest_force_connector(data-&gt;drm_fd,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;output-&gt;config.connector,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FORCE_CONNECTOR_UNSPECIFIED);
        <br>
        +&nbsp;&nbsp;&nbsp; kmstest_force_edid(data-&gt;drm_fd,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;output-&gt;config.connector, NULL);
        <br>
        +}
        <br>
        +
        <br>
        +static int try_modeset(data_t *data, const drmModeModeInfo
        *mode)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_t *primary;
        <br>
        +&nbsp;&nbsp;&nbsp; int ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_display_reset(&amp;data-&gt;display);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_output_set_crtc(data-&gt;output, data-&gt;crtc);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_output_override_mode(data-&gt;output, mode);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; primary = igt_output_get_plane_type(data-&gt;output,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_PLANE_TYPE_PRIMARY);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_create_pattern_fb(data-&gt;drm_fd,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode-&gt;hdisplay, mode-&gt;vdisplay,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;data-&gt;fb);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_fb(primary, &amp;data-&gt;fb);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = igt_display_try_commit_atomic(&amp;data-&gt;display,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_ATOMIC_ALLOW_MODESET,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL);
        <br>
        +&nbsp;&nbsp;&nbsp; if (ret) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(primary, NULL);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_crtc(data-&gt;output, NULL);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +}
        <br>
        +
        <br>
        +static bool audio_is_active(void)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; if (!eld_is_supported())
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return eld_has_igt();
        <br>
        +}
        <br>
        +
        <br>
        +static unsigned int get_eld_rates(void)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct eld_entry eld;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!eld_get_igt(&amp;eld))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (eld.sads_len == 0)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return eld.sads[0].rates;
        <br>
      </blockquote>
      <br>
      This is heavily dependent on the semantics that currently we only
      add one SAD in build_eld. Let's document this atleast.
      <br>
    </blockquote>
    <p>Done in v2.</p>
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com"><br>
      <blockquote type="cite">+}
        <br>
        +
        <br>
        +static void log_eld_rates(unsigned int declared, unsigned int
        eld_rates)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; char decl_str[128], eld_str[128], pruned_str[128];
        <br>
        +&nbsp;&nbsp;&nbsp; unsigned int pruned = declared &amp; ~eld_rates;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; rates_to_str(declared, decl_str, sizeof(decl_str));
        <br>
        +&nbsp;&nbsp;&nbsp; rates_to_str(eld_rates, eld_str, sizeof(eld_str));
        <br>
        +&nbsp;&nbsp;&nbsp; rates_to_str(pruned, pruned_str, sizeof(pruned_str));
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;&nbsp;&nbsp;&nbsp; SAD declared: %s\n&quot;, decl_str);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;&nbsp;&nbsp;&nbsp; ELD reports:&nbsp; %s\n&quot;, eld_str);
        <br>
        +&nbsp;&nbsp;&nbsp; if (pruned)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;&nbsp;&nbsp;&nbsp; Pruned:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %s\n&quot;, pruned_str);
        <br>
        +}
        <br>
        +
        <br>
        +static void assert_per_rate(const drmModeModeInfo *mode, int
        channels,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pkts_avail, unsigned int eld_rates)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; ARRAY_SIZE(rate_table); i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int req = required_pkts_per_line(mode,
        rate_table[i].freq_hz,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; channels);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool in_eld = eld_rates &amp; rate_table[i].flag;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* A rate that can't fit must not appear in ELD */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(!(req &gt; pkts_avail &amp;&amp; in_eld),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s: req=%d &gt; avail=%d but rate present in
        ELD\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rate_table[i].name, req, pkts_avail);
        <br>
      </blockquote>
      <br>
      This check does not protect againts cases where the driver over
      prunes. It asserts true all req &lt;= pkts_avail cases,
      irrespective of in_eld.
      <br>
      <br>
    </blockquote>
    Added check for over-prunning i.e. rate that fits but got dropped.
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com">
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        +static void log_per_rate_analysis(const drmModeModeInfo *mode,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int bpc, int channels,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pkts_avail, unsigned int eld_rates)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; const char *layout = (channels &lt;= 2) ? &quot;L0&quot; : &quot;L1&quot;;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;&nbsp;&nbsp;&nbsp; %-6s %-3s&nbsp; pkts: avail=%d\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Rate&quot;, layout, pkts_avail);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; ARRAY_SIZE(rate_table); i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int req = required_pkts_per_line(mode,
        rate_table[i].freq_hz,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; channels);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *expect = (req &lt;= pkts_avail &amp;&amp;
        pkts_avail &gt; 0) ?
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;fit&quot; : &quot;NO&quot;;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *eld_has = (eld_rates &amp;
        rate_table[i].flag) ?
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;yes&quot; : &quot;no&quot;;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; %5s: req=%d fit=%s&nbsp; (ELD: %s)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rate_table[i].name, req, expect, eld_has);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        +/* Run the BPC × channels matrix for a given mode/hblank. */
        <br>
        +static void test_audio_bw_matrix(data_t *data, const
        drmModeModeInfo *mode)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int hblank = hblank_of(mode);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;=== Audio BW matrix: %s hblank=%d ===\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode-&gt;name, hblank);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (int b = 0; b &lt; ARRAY_SIZE(bpc_values); b++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int bpc = bpc_values[b];
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int c = 0; c &lt; ARRAY_SIZE(channel_values); c++)
        {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int channels = channel_values[c];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct edid *edid;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pkts, ret;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool audio;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int eld_rates;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; edid = build_edid(bpc, channels);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; force_edid_and_connector(data, edid);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_prop_value(data-&gt;output,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_CONNECTOR_MAX_BPC, bpc);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkts = avail_pkts_per_line(bpc, hblank);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;\n&nbsp; %dbpc %dch hblank=%d
        avail_pkts=%d\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bpc, channels, hblank, pkts);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = try_modeset(data, mode);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;&nbsp;&nbsp;&nbsp; modeset: REJECTED\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cleanup_connector(data);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Allow ELD to propagate */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(200 * 1000);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; audio = audio_is_active();
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eld_rates = audio ? get_eld_rates() : 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;&nbsp;&nbsp;&nbsp; modeset: OK\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;&nbsp;&nbsp;&nbsp; audio:&nbsp;&nbsp; %s\n&quot;, audio ? &quot;active&quot; :
        &quot;inactive&quot;);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(!(pkts == 0 &amp;&amp; audio),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Audio active with 0 available
        packets\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(!(pkts &gt; 0 &amp;&amp; !audio),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Audio inactive with %d available
        packets\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkts);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (audio) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log_eld_rates(ALL_SAMPLE_RATES, eld_rates);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert_per_rate(mode, channels, pkts,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eld_rates);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log_per_rate_analysis(mode, bpc, channels,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkts, eld_rates);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cleanup_connector(data);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;\n=== End matrix ===\n&quot;);
        <br>
        +}
        <br>
        +
        <br>
        +static void test_audio_bw_supported(data_t *data)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; test_audio_bw_matrix(data, &amp;mode_1080p_hblank160);
        <br>
        +}
        <br>
        +
        <br>
        +static void test_audio_bw_pruned(data_t *data)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; test_audio_bw_matrix(data, &amp;mode_1080p_hblank80);
        <br>
        +}
        <br>
        +
        <br>
        +static void test_suspend_audio_recovery(data_t *data,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum igt_suspend_state state)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; const struct edid *edid;
        <br>
        +&nbsp;&nbsp;&nbsp; bool audio_before, audio_after;
        <br>
        +&nbsp;&nbsp;&nbsp; unsigned int rates_before, rates_after;
        <br>
        +&nbsp;&nbsp;&nbsp; char before_str[128], after_str[128];
        <br>
        +&nbsp;&nbsp;&nbsp; int ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; edid = build_edid(12, 2);
        <br>
        +&nbsp;&nbsp;&nbsp; force_edid_and_connector(data, edid);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_output_set_prop_value(data-&gt;output,
        IGT_CONNECTOR_MAX_BPC, 12);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = try_modeset(data, &amp;mode_1080p_hblank80);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require(ret == 0);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; usleep(200 * 1000);
        <br>
      </blockquote>
      <br>
      Is this empirical? I understand it is being already being used
      kms_hdmi_inject but 200ms looks like a lot.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>hmm. right. Replaced with igt_wait(), keeping upper bound as
      200ms.</p>
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com"><br>
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; audio_before = audio_is_active();
        <br>
        +&nbsp;&nbsp;&nbsp; rates_before = audio_before ? get_eld_rates() : 0;
        <br>
        +&nbsp;&nbsp;&nbsp; rates_to_str(rates_before, before_str, sizeof(before_str));
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;Before suspend: audio=%d rates=%s\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; audio_before, before_str);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; usleep(200 * 1000);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; audio_after = audio_is_active();
        <br>
        +&nbsp;&nbsp;&nbsp; rates_after = audio_after ? get_eld_rates() : 0;
        <br>
        +&nbsp;&nbsp;&nbsp; rates_to_str(rates_after, after_str, sizeof(after_str));
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;After suspend:&nbsp; audio=%d rates=%s\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; audio_after, after_str);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(audio_before, audio_after);
        <br>
        +&nbsp;&nbsp;&nbsp; if (audio_before)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(rates_before, rates_after);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; cleanup_connector(data);
        <br>
        +}
        <br>
        +
        <br>
        +static void test_runtime_suspend_audio(data_t *data)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; const struct edid *edid;
        <br>
        +&nbsp;&nbsp;&nbsp; bool audio_before, audio_after;
        <br>
        +&nbsp;&nbsp;&nbsp; unsigned int rates_before, rates_after;
        <br>
        +&nbsp;&nbsp;&nbsp; char before_str[128], after_str[128];
        <br>
        +&nbsp;&nbsp;&nbsp; int ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; edid = build_edid(12, 2);
        <br>
        +&nbsp;&nbsp;&nbsp; force_edid_and_connector(data, edid);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_output_set_prop_value(data-&gt;output,
        IGT_CONNECTOR_MAX_BPC, 12);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = try_modeset(data, &amp;mode_1080p_hblank80);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_require(ret == 0);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; usleep(200 * 1000);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; audio_before = audio_is_active();
        <br>
        +&nbsp;&nbsp;&nbsp; rates_before = audio_before ? get_eld_rates() : 0;
        <br>
        +&nbsp;&nbsp;&nbsp; rates_to_str(rates_before, before_str, sizeof(before_str));
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;Before runtime suspend: audio=%d rates=%s\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; audio_before, before_str);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(data-&gt;drm_fd,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;output-&gt;config.connector,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_DPMS_OFF);
        <br>
        +&nbsp;&nbsp;&nbsp; usleep(500 * 1000);
        <br>
        +&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(data-&gt;drm_fd,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;output-&gt;config.connector,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_DPMS_ON);
        <br>
        +&nbsp;&nbsp;&nbsp; usleep(500 * 1000);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; audio_after = audio_is_active();
        <br>
        +&nbsp;&nbsp;&nbsp; rates_after = audio_after ? get_eld_rates() : 0;
        <br>
        +&nbsp;&nbsp;&nbsp; rates_to_str(rates_after, after_str, sizeof(after_str));
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;After runtime suspend:&nbsp; audio=%d rates=%s\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; audio_after, after_str);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(audio_before, audio_after);
        <br>
        +&nbsp;&nbsp;&nbsp; if (audio_before)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(rates_before, rates_after);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; cleanup_connector(data);
        <br>
        +}
        <br>
      </blockquote>
      <br>
      test_suspend_audio_recovery and test_runtime_suspend_audio are
      almost identical. Can we converge them?
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Done in v2</p>
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com"><br>
      <blockquote type="cite">+
        <br>
        +int igt_main()
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; data_t data = {};
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_fixture() {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
        DRIVER_XE);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(is_intel_device(data.drm_fd));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_vt_graphics_mode();
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_require(&amp;data.display, data.drm_fd);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.output = find_hdmi_output(&amp;data.display);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(data.output, &quot;No HDMI connector
        found\n&quot;);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.crtc = igt_first_crtc(&amp;data.display);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(data.crtc, &quot;No usable CRTC found\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_describe(&quot;Baseline: hblank=160, audio should be fully
        supported &quot;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;for all BPC and channel configurations.&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_subtest(&quot;audio-bw-supported&quot;)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_audio_bw_supported(&amp;data);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_describe(&quot;Constrained: hblank=80 (CVT RB2), audio may
        be pruned &quot;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;or disabled depending on BPC.&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_subtest(&quot;audio-bw-pruned&quot;)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_audio_bw_pruned(&amp;data);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_describe(&quot;Validate audio recovery after S3 suspend with
        &quot;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;constrained hblank.&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_subtest(&quot;suspend-s3-audio-recovery&quot;)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_suspend_audio_recovery(&amp;data,
        SUSPEND_STATE_MEM);
        <br>
      </blockquote>
      <br>
      The documentation for igt_suspend_state says &quot;A memory sleep
      (non-hibernation) target state, respecting the system's mem_sleep
      default&quot; if your intention is to deterministically go to S3 use
      SUSPEND_STATE_S3 instead.
      <br>
    </blockquote>
    <p>Renamed subtests and updated documentation :&nbsp;SUSPEND_STATE_MEM
      and&nbsp;SUSPEND_STATE_DISK</p>
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com"><br>
      May I know why only these two power states were selected in
      particular?
      <br>
    </blockquote>
    <p>To cover 2 different recovery paths :&nbsp;SUSPEND_STATE_MEM and&nbsp;SUSPEND_STATE_DISK.
      Similar tests in other binaries aswell.</p>
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com">
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; igt_describe(&quot;Validate audio recovery after S4 hibernate
        with &quot;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;constrained hblank.&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_subtest(&quot;suspend-s4-audio-recovery&quot;)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_suspend_audio_recovery(&amp;data,
        SUSPEND_STATE_DISK);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_describe(&quot;Validate audio recovery after runtime suspend
        with &quot;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;constrained hblank.&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_subtest(&quot;runtime-suspend-audio-recovery&quot;)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_runtime_suspend_audio(&amp;data);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_fixture() {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_fini(&amp;data.display);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_close_driver(data.drm_fd);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        diff --git a/tests/meson.build b/tests/meson.build
        <br>
        index a62f447df..facb7ab5d 100644
        <br>
        --- a/tests/meson.build
        <br>
        +++ b/tests/meson.build
        <br>
        @@ -259,6 +259,7 @@ intel_kms_progs = [
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_fbc_dirty_rect',
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_fbcon_fbt',
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_fence_pin_leak',
        <br>
        +&nbsp;&nbsp;&nbsp; 'kms_hdmi_audio_bw',
        <br>
      </blockquote>
      <br>
      needs to be alphabetical order?
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, done.</p>
    <blockquote type="cite" cite="mid:6b27f04d-8f8a-4344-82e3-10917f78f0a2@intel.com"><br>
      <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_flip_scaled_crc',
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_flip_tiling',
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_frontbuffer_tracking',
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------b8aGyvE6mu6qWbPiZ7PUtBJn--

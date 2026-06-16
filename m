Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ACDCD98E4
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 17:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E9010E81C;
	Tue, 16 Jun 2026 17:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ex3TrxiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D4B10E81C
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781630120; x=1813166120;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=o9qN3CJeGmcZnvSLuR0Heko66Y0w/3vyqte3bWvpnj4=;
 b=Ex3TrxiV2la/4mlhJZXJUEPBOmPdSNbht1ZDXkymFEbfY2UMsOFMwptL
 fbt9I4psycboBSFhSEiqYIGm1vQGcTmEMcW5xctr5mIFA6ywl1YGQetNS
 rFpOAhuAWPYoli6H3Ug2Y/P84+rk6HFTv8MS4nFegbeUT/QECZfbvagVn
 kQqSqRBJgs55oJq7TjOiY5ogI78rX1pibj6HlMRnpZ80fDbSAfFecbvd3
 IrmGz05BRBWG4KFhdVvzWRI0GhXluoMwVTQ5OLkyqvU2/AC+V6c/q/Wvp
 adeQOo5UG4zE8f3p1ug9EcCLlR3atPhcTedn9103JKeV7NYS14IccRzhV A==;
X-CSE-ConnectionGUID: deR7DYxgQjSa2dmIjWvKvw==
X-CSE-MsgGUID: 9iG/cZiyTdacF5dBZ0kdcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82417872"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208,217";a="82417872"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 10:15:20 -0700
X-CSE-ConnectionGUID: cforK2/9T9Oki35xQFvHYg==
X-CSE-MsgGUID: tqIA9iRHSP2F7Cc2SOfgwg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 10:15:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 10:15:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 10:15:19 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 10:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMJyuUpeSmPhB/ktUO6eoJwYyoxl/SkSERAk2wCdvIZDTogmTHmP3gs0IAoKqOwh2JEc+pIRMPtYR60jowh5pIxI8/kb8V2mDG3aIpaCNLIsui+VC3NSbk8Yz3OwimEZoxfOF7/wUakzHHSttpkwfATTequTp0nv3ITS0B1Lt8d0rI33rSwU4ov2xOwrnTdUSG9hiQtTQLPEXCXGmHovz4Xai/7+uPep9FlkEhZ1HKFJg6JLI4YGajzSBG8OmHq4D8/aY3KyIbhqxxyvxXLcgwWS/ocaayUkJVBoTKvT+RTjSuMXfDmzy+4LoyOh2vqqGzy8cPJiB2cZ1o0KZypWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/z9ZNPEQGX3p/QhMReqt2hpcMhjU3BnaJNWR2JTuURA=;
 b=aL+KW1F5CKYiDP43It+AQxOjE1AmNt3eHwkGMjC0S39LdlMUuCRXXQibpTDjgczZ3p6FwuKKuLo0n+bv2H49DGEsZ7hyCEsgKDHSASWVvNcofedeyscCUlzOX7WLqJ8DfURI8AnW3pDznglOAZ7VsgW2O5WK1zdyMMl7PRMgVz5kMYa04IMTgtgNue0j5VTeBDMHPdQCabooF39KzS3JgCWYMGYticM4RpETI4o3AgBN/CXMUBfDab/BkLKd+50rZzwRRNZxsnHiabAl6L/4KL1XoX4q9rPfSS+b5FsKhrkOPv+9sBzbTpkUkm12aaauacgbvuYLzzh5VBVb06fqNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DS0PR11MB7411.namprd11.prod.outlook.com (2603:10b6:8:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Tue, 16 Jun
 2026 17:15:14 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:15:14 +0000
Content-Type: multipart/alternative;
 boundary="------------je8Xf4jxe0Uio8AjXn1ixDOY"
Message-ID: <66b9b1a2-5200-42c6-aed2-329db8517bde@intel.com>
Date: Tue, 16 Jun 2026 22:45:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Clear stale
 forced LT failure counter on timeout
To: <igt-dev@lists.freedesktop.org>
References: <20260519082054.1971395-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260519082054.1971395-1-kunal1.joshi@intel.com>
X-ClientProxiedBy: MA5PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::13) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DS0PR11MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b399559-8716-414b-e07a-08decbcad445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|8096899003|11063799006|56012099006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /9rEHdToRVj8miZ5hFeESzzISyRDTi2gXXXCspAeHGjFh58PCNaUHVBOcxdZWu+Ef1KxVpQzXZOZck+hnsi/FBE/hse4BFZANbwhwLRZXoiPi5cn/+P+9yPxSQJ5/s4r+/8+jVwI1vtALf/HgQobXMElz7KMplcQC6tvTfmanTyXqCNg47pjQkb9KgT+OQX8ZOJ4dLf8JpNS38ETjrpF+Xq0SVy4Lb8J7FdVZC80dDXFSy0xgBqAK2c29JsvV6S6KpoB8a4WuWm8p26w6l0v9ZNS1ABJQXIV2C+sp12mSThVzBuFdR1W2AnZTsuX34iZAsfJFEugvsm2SWjapshnlqR/V5gnx4hCXNVTX5OLeZREn0ZnHV6RINPRP3zyLKYgMwiuqDpOqH0Ra1hnwbjBJstySRx5Oou47sBdDs5O6GR96TxX0VmVDyIhmY8UGWjcJ7lbIOpv9OQ6Q4kIlpG5DBzzTWJQQpdTesAaqhpfDLa0k4iFPPjI54SlNZBL2sQJNdIjbI5E2Y4Zul7YVS0076XHTfl4cfosoBg8CJwYZNsPU50e05vfsBGiQHqDknzrAbLHa8uxPMNUd00hfWi4ekbUYzc3sDNJl0HtvQ+hOCK8uSDS2uCbeHC4HFE15HWAGPe3Ui2aPqWkYtJe44pdx9H/T229X1Jmnhn7yaop39T/nXEfJP3rwdRrgZbDxiA8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(8096899003)(11063799006)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3oxTGxKbDJseHN3N3AxYXRXZW5JSTVtODk1VCtmUWtDem1kMWVqQ25BN3Y1?=
 =?utf-8?B?OUlXUG5VL2JSdFNiRmtxUDltbU10TEs3L0RPd1gvTFNhQ3N6VVhKeUxCVSsv?=
 =?utf-8?B?VDRvSmFrc3gvR1NjZGIxL0x3SkdremNPbWpSdHlXV0ZySkZSZWg5NXcraXV1?=
 =?utf-8?B?QUZ2NWNpa3FSbG84cDNrZ0xDZ0h1THA0NDZCSzFOYkZwbU9EMVp2aWV3R2pW?=
 =?utf-8?B?ZWNpSmhaMnlVWFNYMm5GVnBTL3NzTHo4Q1pCUkR4Q2VtZmgyOHYva3p6bzc4?=
 =?utf-8?B?QnN6TnliWlBQdGE4cVJVSExodnptMU8yemlvV0VreDUvenRHOGxGeXR2cTNZ?=
 =?utf-8?B?SjZmK1BKZEkrTDZ6Y3pCdWxYSmhYOG01dmlzNjZhUmpVK3BpV2Fsdld4RC9X?=
 =?utf-8?B?U1k0WjBZZzdodXlVT3VIS3FTaHhtdURxd1VVbkJmVHZxUGFKUFNOekxaSEIw?=
 =?utf-8?B?R3ZXRjZpU2VTaENwY2FYU1hnanVpNjRJOTZPcU90UFFxaFZvK1ZCd3BaTFRE?=
 =?utf-8?B?T2xpdUpUQjg0TndRS0xDVllDNnF6M2Q3WUhoUHMrZjFnT2xtOFpPWXd6ZmZN?=
 =?utf-8?B?RWFxY1I0WXdGeDc0MDR0WlpIV0F0djNlb2dzYS9Sa1M1QVhsaHZUS0FOYTlB?=
 =?utf-8?B?L1YvSWh0YlJ0TkQ4S3lZNE9mSWlaMW9sUTRESFV4YXJyRlZiVVZ3ZURtZHFo?=
 =?utf-8?B?c2dnK002YTFyR3Naeis3VWRBVVhSbDh2Uy93MzY1YnI1cjNMcmdJclRQOXFX?=
 =?utf-8?B?bTluZ29mbXJTODNmS0RacVlaUWVTbzlraGs5ZXVTQ1Z4NFJWM0trVUFSaFJw?=
 =?utf-8?B?K0hmWmJNV2phcWJqT2h4L21BVFN6QWRDSEM4ZHpUZ1ZCS0xJVEluTG13WXI5?=
 =?utf-8?B?Q2tYK2pFc3VBRFU4U3JpVklWTVhlR2V4ZEtoVmlNVDJIc1NwdGxnV3FvSkFK?=
 =?utf-8?B?N2N4bU9UU3VvTXl2amdxSy9sZnc3Z0NPbis2eDFXbERUSHNCd3Nsa05BZEVZ?=
 =?utf-8?B?ckQxSG9OTjd4VlRBVlo0MWJXdHNnSU8yNVRvWVQ3a0pwWjNNWHRKMmZqS3g3?=
 =?utf-8?B?aGJWck5GR3dDTTFORC9BMjI1cm1rSDJKUndPR1cxUGZjcUc1cGhncytQR0p3?=
 =?utf-8?B?RUFMTEg0OFVGNnNMM3NWMndzUmxsQ0lPVC9KaHN6NGk0QlB3elhaWUJQR1BY?=
 =?utf-8?B?UFE4OGFoRmdjOE1SUlBCbHVoeHdnWThEYVVaRElnSlFXSlVpUXpNSWN4V0hw?=
 =?utf-8?B?Y2JRU2JGOUs4NjZFaFhSd3ZpWi96MklTekJaOFA3cllqWmZ1emp4NDNwSng3?=
 =?utf-8?B?bFhQQ1RpZ0FHeHdka1ZwT0wzeEpGTUp0WjQ4VERCWm1kSFB2L1RPSFBpREFM?=
 =?utf-8?B?R3p4VUp4RzgxTW9hTi9hT2hmQ3YwMUtYY1VYZGJCS3A5cFFDbklNUWdpb1Jk?=
 =?utf-8?B?Y0RPQVNneERQUC9HeVdXdTBVbjdEbno0aUJOYUhMVmRLTkdZMU9iTmZ2Z0xP?=
 =?utf-8?B?WXFvRi80QkloS1R3TTZaOSt3WUlRWEtCTkZnSzltL3E2U1ovREV3Nnd4ZWw5?=
 =?utf-8?B?WWxMbmhHNzVMUVl1L1ZPb1h5bUdzNkQveTJpUE93eHN2WnluaG9hQ1lBQlpN?=
 =?utf-8?B?WEJaaVBFKzd6U0NOSUd1SnA2QjNVeksvMEh5YzFOdHlKaCs3cUlrTEZTU1ZE?=
 =?utf-8?B?QXc0YUpWTWl3ekhRUUJpSnlPQXNNSklMRlZpYnlGYU5oRm5OOTQ3MW16NUJk?=
 =?utf-8?B?WC9rQlBrd3JnTjJLN1JwOFlkbnRqNUxNRTdNS2NINWc3cFFHajBBU3h2M1Zh?=
 =?utf-8?B?dnZROXZ5YVBPaWZxc3VJWDQ4Y0wzcVpEQ2twaHRVVEFadllkRThFYUlBeE4r?=
 =?utf-8?B?ajBYOUdZNjhRSm11VVlNSUdyYm85SHJnK1U2eVpsc1VqSjV5U3BUVEpsS2dI?=
 =?utf-8?B?N3dzMzd1U0RFdGFJL0hBQlJSMWVrQk9wcUJWRFVWR3pmRXZyVS9CQ0dnZktT?=
 =?utf-8?B?bXM4ZzBnOWNnMTZoTzlheXBSRDIwRUp0Mk5PSU5LOXpLNE1sNXkwWGxLOWtS?=
 =?utf-8?B?QUdnZVZMb1dNNHZ3Q1Y1WEVlaXRvTFVpcGxUbUc0azVDTFh6ZjdBZGVnWUxD?=
 =?utf-8?B?aVJlaUt6am9DbGRCVHk0V2cwTU9xUkVsTFJKRXExVXRCT2IvVlp0SHFPSG5q?=
 =?utf-8?B?aG9sUEV2V3dxMjI4NGJiZW1BYUVCTGM0SDJ6TlFHazdKQjBuaTQ3OVA3UDhJ?=
 =?utf-8?B?ZzlzUW02aGFHWWZCbjZFT0tmOVozTEkvR2FJakNBQW9OTWdUVjNYQ3hlTXZD?=
 =?utf-8?B?R1VEcUtnaFluUVRqOTBlMS81Wk9ZdS9hdzM1R0ZnbWVSVng3TjJsS1N2YWor?=
 =?utf-8?Q?OCs0K9QZ7Dv+0Kfw=3D?=
X-Exchange-RoutingPolicyChecked: QxrszAHTvlzrV7fqeIZT++bvn3l+6g6hMbvIGtZRrpNUu2+OQQx3rMVnLTMbZm2bPrHg+SDLanbtLBCeiLogzxZM9nErhw2F76cLZi9cPV07Wlucg1R5GWAYL5fzm3nNTk4h688ExWma3bA1uvBGUHDze7SBEXAaGQLkC5q2YkrvIn/MKzm1aPWSqGd9ZJC//XYFsJoCRU1Vi2NzEpvRxGF74p9aHM6f2GmDuJHUEjG4u8TGKFwZvwnD0q+bHyQfXsWW9cJ4C8IBba8eyCfD44bPzxeK9d5hvT9JUIwhzLJJJoNVCKmbI+7Ja/K3LrjDs2Re5lZJCGnH+d3FuueCxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b399559-8716-414b-e07a-08decbcad445
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:15:14.1829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iod3O4r1B38G8Uof5VhFhS31Kij/JGTFxUJzgX7k0BFglW+WHH41aIyVIe2cj+zHvnUyFA+NlioYsvIignUcFvBfN1dO7W79LJh5MOfP6XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7411
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

--------------je8Xf4jxe0Uio8AjXn1ixDOY
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kunal,

On 5/19/2026 1:50 PM, Kunal Joshi wrote:
> When force_failure_and_wait() sets force_train_failure=2 (LT_FAILURE_REDUCED_CAPS)
> and triggers a retrain, the kernel consumes the counter once per
> intel_dp_link_train() call. With MAX_SEQ_TRAIN_FAILURES=2, the first call
> happens inside the modeset triggered by force_retrain. The second consumption
> depends on a queued link_check_work (delay=0) firing and completing a second
> modeset promptly.
>
> However, on external DP connectors (where this test runs), the second
> intel_dp_link_train() call can fail to execute if:
>
>   - A long HPD fires between the two retrains (common on marginal links,
>     USB-C docks, TBT connections). The long HPD handler sets
>     reset_link_params=true, which triggers intel_dp_reset_link_params()
>     during detect -- resetting seq_train_failures to 0. When the queued
>     link_check_work then calls intel_dp_needs_link_retrain(), it sees
>     seq_train_failures==0, link status OK, and returns false. No second
>     retrain occurs.
>
>   - The second retrain's intel_modeset_commit_pipes() fails due to lock
>     contention with a concurrent modeset triggered by the same HPD event.
>
> In both cases, intel_dp_reset_link_params() does NOT clear
> force_train_failure, leaving the debugfs counter stale at a non-zero value.
> The test then times out polling for it to reach zero.
>
> Previously this caused an assertion failure, aborting the entire test.
> Instead, clear the stale counter by writing 0 to the debugfs and continue.
> The test's subsequent assertions (wait_for_hotplug_and_check_bad, link param
> verification) will still catch if the fallback genuinely did not occur.
>
> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 661af7d16..dc9faa216 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -255,8 +255,27 @@ static bool force_failure_and_wait(data_t *data,
>   	if (check_condition_with_timeout(data->drm_fd, output,
>   					 igt_get_dp_pending_lt_failures,
>   					 interval, timeout)) {
> -		igt_info("Timed out waiting for pending LT failures\n");
> -		return false;
> +		/*
> +		 * The initial retrain was processed but not all forced LT
> +		 * failures were consumed within the timeout. This happens
> +		 * when a long HPD fires between the two kernel retrains:
> +		 * the long HPD handler sets reset_link_params which resets
> +		 * seq_train_failures to 0 during detect, causing the queued
> +		 * link_check_work to see needs_link_retrain() == false and
> +		 * skip the second retrain. The force_train_failure counter
> +		 * is not cleared by intel_dp_reset_link_params(), leaving
> +		 * it stale.
> +		 *
> +		 * This can also occur if the second retrain's modeset fails
> +		 * due to lock contention with a concurrent modeset (e.g.
> +		 * one triggered by the same HPD event).
> +		 *
> +		 * Clear the stale counter so it doesn't corrupt subsequent
> +		 * iterations of the test loop.
> +		 */
> +		igt_info("Forced LT failures not fully consumed within timeout "
> +			 "— clearing stale counter\n");
> +		igt_force_lt_failure(data->drm_fd, output, 0);

Nit: `igt_force_lt_failure()` was renamed as part of the recent DP helper

prefix changes. Please switch to the updated function name when rebasing

onto the latest code.

With the above change, Looks good to me.

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   	}
>   
>   	return true;
--------------je8Xf4jxe0Uio8AjXn1ixDOY
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Kunal,</p>
    <div class="moz-cite-prefix">On 5/19/2026 1:50 PM, Kunal Joshi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260519082054.1971395-1-kunal1.joshi@intel.com">
      <pre wrap="" class="moz-quote-pre">When force_failure_and_wait() sets force_train_failure=2 (LT_FAILURE_REDUCED_CAPS)
and triggers a retrain, the kernel consumes the counter once per
intel_dp_link_train() call. With MAX_SEQ_TRAIN_FAILURES=2, the first call
happens inside the modeset triggered by force_retrain. The second consumption
depends on a queued link_check_work (delay=0) firing and completing a second
modeset promptly.

However, on external DP connectors (where this test runs), the second
intel_dp_link_train() call can fail to execute if:

 - A long HPD fires between the two retrains (common on marginal links,
   USB-C docks, TBT connections). The long HPD handler sets
   reset_link_params=true, which triggers intel_dp_reset_link_params()
   during detect -- resetting seq_train_failures to 0. When the queued
   link_check_work then calls intel_dp_needs_link_retrain(), it sees
   seq_train_failures==0, link status OK, and returns false. No second
   retrain occurs.

 - The second retrain's intel_modeset_commit_pipes() fails due to lock
   contention with a concurrent modeset triggered by the same HPD event.

In both cases, intel_dp_reset_link_params() does NOT clear
force_train_failure, leaving the debugfs counter stale at a non-zero value.
The test then times out polling for it to reach zero.

Previously this caused an assertion failure, aborting the entire test.
Instead, clear the stale counter by writing 0 to the debugfs and continue.
The test's subsequent assertions (wait_for_hotplug_and_check_bad, link param
verification) will still catch if the fallback genuinely did not occur.

Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
---
 tests/intel/kms_dp_linktrain_fallback.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 661af7d16..dc9faa216 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -255,8 +255,27 @@ static bool force_failure_and_wait(data_t *data,
 	if (check_condition_with_timeout(data-&gt;drm_fd, output,
 					 igt_get_dp_pending_lt_failures,
 					 interval, timeout)) {
-		igt_info(&quot;Timed out waiting for pending LT failures\n&quot;);
-		return false;
+		/*
+		 * The initial retrain was processed but not all forced LT
+		 * failures were consumed within the timeout. This happens
+		 * when a long HPD fires between the two kernel retrains:
+		 * the long HPD handler sets reset_link_params which resets
+		 * seq_train_failures to 0 during detect, causing the queued
+		 * link_check_work to see needs_link_retrain() == false and
+		 * skip the second retrain. The force_train_failure counter
+		 * is not cleared by intel_dp_reset_link_params(), leaving
+		 * it stale.
+		 *
+		 * This can also occur if the second retrain's modeset fails
+		 * due to lock contention with a concurrent modeset (e.g.
+		 * one triggered by the same HPD event).
+		 *
+		 * Clear the stale counter so it doesn't corrupt subsequent
+		 * iterations of the test loop.
+		 */
+		igt_info(&quot;Forced LT failures not fully consumed within timeout &quot;
+			 &quot;— clearing stale counter\n&quot;);
+		igt_force_lt_failure(data-&gt;drm_fd, output, 0);</pre>
    </blockquote>
    <p>Nit: `igt_force_lt_failure()` was renamed as part of the recent
      DP helper</p>
    <p>prefix changes. Please switch to the updated function name when
      rebasing</p>
    <p>onto the latest code.</p>
    <p>With the above change, Looks good to me.</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260519082054.1971395-1-kunal1.joshi@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	}
 
 	return true;
</pre>
    </blockquote>
  </body>
</html>

--------------je8Xf4jxe0Uio8AjXn1ixDOY--

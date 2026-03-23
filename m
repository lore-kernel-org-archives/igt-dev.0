Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5441FC72C5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 07:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863E10E0AD;
	Mon, 23 Mar 2026 07:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbEBaHjj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE81210E0AD
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774250922; x=1805786922;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hrH6/vBaDFW3qDviVO4OcdelxBvS1s3Ax0fNbCcDsQU=;
 b=VbEBaHjj08sYdqd0/3m25j9nsyi5xOwI8sKbEAvRIOK35c2nlQFNN0L1
 0J7lsecbQhTTwqfn/gLbZlK2aR99tyIRNlIhkhAf4uLQyINMDPJ0K6Go6
 6YQllxbjsDmKuMOJqY7NCgcWexMvzaRiqsXPJZY3nMh3MNFWVjbPYyRoP
 x6aMZ3dBMtnV3AHrOnxhn78UavWLHg/TIWE85l4jiwMseB7nQg+yM5eiN
 t5uUdzB+9bSPCKyRmpKAo2mjL4J0r9vToRjF4py2pNRlEhtq2hMgUqYRV
 MBeh0xtt2/tb/PQQCLEfhr8SuEW76cCfEKuW64GiwbXndkid1s7xZxut3 A==;
X-CSE-ConnectionGUID: qppzGGk4SiibDvuSH1rvLw==
X-CSE-MsgGUID: 8FX5/fi9RWa+Eu7xqqgLYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75212305"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75212305"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:28:42 -0700
X-CSE-ConnectionGUID: k1vB9oJZSSaEznTvsfu86A==
X-CSE-MsgGUID: T4MR+b20QJqvcUfwzZuWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="254419437"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:28:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:28:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 00:28:41 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Prlmhy0ghS27HRY+Nh7nkUEzZWEHh6L88snCKW1RGQ3ouxSpxHLadOfdcqoS55xglddu9UWoel8LpPOTz9WRNvqaYcBc6o2wfnsEiBdoh0nqYibq122RoWj8UeE3d5ePGhDdsRdSpzfnGYEeGPPGUIuVul3/mpZzGkDUVRzqUrfm/F8QXKkQwSv7u9mhYgTeQgElbQ9iKcrRaExWxoGk86Jxb/j0Mry7SoTKuyumQwnCp2P4/6k/iGjBGleq+OL6XdgTnDqIU1FONptF+PV9w9GcZgs4V4CwPPCZ1lOMnd1L6TUW3HypWosVNmnBR5gEptlYpntDO98upRrffh3uvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWSBawAwvsi6utsapyUB0uDeUVjoEz5q98TRo5TptMc=;
 b=Ne+Krsocctho4bbE19wKEhT4Je5+JrcOFcebq94girsryFqT1CHzsuHXuTFeNIR6/66EkQpsaqONk3Sde8NBQnA7jFfokHLVMzXrEqwjcGkszqLHBQKn5Cjy6uyBRaRlBPUpAjfJMoCahjOpuO/cuIqcAti7wKS4xBsUgmRE8djim28VgJ5BHjh+h3y9ZwGiI6ZnhV5LrJwrXMPTW9w4uu4A8WJuKIDwwlRkEcUey4Q3qJY+5XI6285DBNwYxkIcXzF+PrT1wbNEcIsZ+ldaELFzSRJOY4sb9zCkgLMz1wh7G2PfDwGQZ6jMeL/jgmQusNksHQzLkjAa5JoyNNnDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 07:28:38 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 07:28:38 +0000
Date: Mon, 23 Mar 2026 07:28:25 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 3/4] runner: Add attachments directory content in
 subtests results
Message-ID: <2s6eo65qwzowdek3jy4d5ejjejncdhcmnpyzcydxk66xty5tz4@62256siptdtd>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
 <20260319215124.2066611-9-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319215124.2066611-9-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: TL0P290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::19) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ0PR11MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: acee9a66-44e3-4d35-afe5-08de88adccb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: cdue55oyNaM4rhMvq1i63cVV2i65QlEHm9vKdHB7YpQCCtoyOGev7Ht9hRLzYeUIKSC9xsyNA4vYrU0ZNFwI/PmAZLyDCBXb5laCiSdQ0YRjiwJLqvABRxnpQ8ZkqOZCSJgAVqqYNYfuxhvIpcxEaBNGw8mxzMC6pnQpXG9DdhKOAn867HK4xVG23R9xcVWaGpKyvpoPirZA6z6OaMPcjzIshXGtm+ff1ub7VDmdWZktjmESrPoKxMrnaSIejkyf9qtjRC1I8BlMe0z7+e4lxdooF0LMCe/NEV+GXCWvaRcDjFQPy7GN75k+N/FGsbdqT9GuhUjHXppesmtn/nOGS2Mpah+VHulJF5KBbzkx58qH5yc98Di+dbCQbQUWzfAzMa4AfYft6KVX/lTBR2aAuPA5m/O6HAO4mPEqdg4msY+QTfhTzcNsl+cOrK4H+jknJLjmx4+qk6wuziB5MM1kKhXujrY/hEVogFWM7I2GLzPCen72DUGkc05jY26gxeDp8dRIDjvKVcWV054V88ctWLaDaLN/KMkbhQUkHozvlpZIGa27Axzb6REooh66hEigMT0HUrIFDgkxO2bMsweMaMfHgw1w9H/wQS3u+A4GBUeNJiaH38oU81kR+Pyk33ZdLb5n+UaC3oWE9criPLlnyJITHMCz2YSvqMkafpRDP0x0isLQqk+RjUjc/r8/LR+Vij1FsGxWgGqgxKw/H5grCK/HpcVaQPXK6Dcs4m6K6FE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW02SDNHY0xJYWNiL3pXNDdjajBwdzFGZHlyTkZCS1Fhd242cTZOU3F3ZGRs?=
 =?utf-8?B?c2t0MWROamNvN3NKY2FtQk9LZjk4TklQa2ttQmtBTTN4VUlMTFI1alhKeDR2?=
 =?utf-8?B?QWVIcjd1REtqemtmKzR2RmYvTlRGdk1JcE16cXFjWHVYdkkwUklCdG8xSi9O?=
 =?utf-8?B?QTVBUUpqeE4vUXJ3VFRlTERtZnRBYkFMZFJ3UklUckVvZG5Zb0tYalZ3enhL?=
 =?utf-8?B?Qk44eGRJdk1taUhxeVdLeXYrc3BVam5jbzlIUVNqOE1QV2VBRlNIWlcvOUFP?=
 =?utf-8?B?RVRPZEdEY0NmWUY1SHdWVHJrSTNzREJBWnJUK2U5Y2VEMjFLWGg4OWsycGtF?=
 =?utf-8?B?TS85VWVKRmNzY25DaE1lQUNrZzZhMWQvNmRIeWljTXVMQkNSWUpaR0cvOFhH?=
 =?utf-8?B?MXVPblh6TU9tOXB5eFpER0ZNMU9YUldvYWpJQ3lvZ21RRE9HU3ZRQ0Z4ckNj?=
 =?utf-8?B?NG9NMS80M2dteWl1SkVBU09HcnlyK0ZKYnczcHd1WFRpTmprcmJJd0t2eWt6?=
 =?utf-8?B?b1RIQk1kRlJPTER0ZXE4b2lsYW5oWjlxeFJjem9sd3JLTWdaMks5T3B2WnVy?=
 =?utf-8?B?NEpZc1R5WWlpNTdqMDlGR3RRc1ZvSmdrVFZPSHpwZmtBdzd3UlNWK0laSWUr?=
 =?utf-8?B?N1J5MU42bmpsVTQ4SDFFV0RJYnpza00zY2wxbU9VYmNGZzl5UFR5Z3F6d292?=
 =?utf-8?B?cVNqaGlxbFA3VWY1eUxtQWxOcWZLR2hndEozTkM1cW1xRjJBcUxRZDhOZitj?=
 =?utf-8?B?OWF0Kzc1c3NaTTY0emlJRnFTY1IvZWNYYjRFcGNzT3YxYjBWVFcyMWwvbkly?=
 =?utf-8?B?THBoWGdybTcvSnRtdlJ0MzhTSXEyV1BSZW05cyszOXJKeGdCNW9HN1RUaXhi?=
 =?utf-8?B?ZWRyR0lTaEZPM0xPNllUZm1pR3B2Tm5wSVg4b0dDOUk2dzZYa2dLbG80V2Y5?=
 =?utf-8?B?Y2kxcjJ6M29Rd0xBb0ljQTdTV21nN2RBTHVqcUNkMkExcU1PZGgyUUVMT1Bo?=
 =?utf-8?B?MnN2TXhTVmRNR0hGOWZpRnZBZkZ4bENPSVZPd3ZZYjY2Q3QvRCtVVGd1dkFx?=
 =?utf-8?B?T2NWRVdtQTRJVURPeXdVWkVmR0dKUkRjOC9RT0N2YjA0U1JReC9Vd21QSk9G?=
 =?utf-8?B?TC9HeTBoMjFOMCs2RmJ4eG42Tkt1VFhjNmNab000ME5SOCsyRlVMMnA4RFU4?=
 =?utf-8?B?V3pqOUtFaldaRWJ5Z1FIR09LR3laeEhDenB0aVdLODhrOE5XYjFWVDllQlJl?=
 =?utf-8?B?cURQczV0ZlFyaGNmTEUxT1BoeFl4UG9DUGY4VjhUemRiSWZmTy9hOG5meUdM?=
 =?utf-8?B?ditHM0t3azA1RUFNbXJ4TURJNXdKM3dZa3RUcWQxY05jSGVqLzhnd0EySUkx?=
 =?utf-8?B?dEtLSyt6SFdiNmRWaVI5b2w3MkJYNHZXYnhNdk42c3dhYXc4aUZCcU4vVzhK?=
 =?utf-8?B?bmZrd28vaUVucUdQZnJwOS9ualM4czRSQlpPOVNIU3FySVBYZlA1OWNSMkow?=
 =?utf-8?B?czhFb2R4WUNFdmRVVWRmcytwd1l6K0J1MTJncTZoSHhHQmY2YjA5S1VVME52?=
 =?utf-8?B?TUo4S3lqcms1ZDBlS2djTDg1N1ZrY3lSdUVSZ0Z1Z0lheUdnOUlQRis3YTZZ?=
 =?utf-8?B?TVExcTNxc0ZMakVsNmlEZ2RtRXBtUGNXTThTUkhja3RwajM2VkY3S3F3VStM?=
 =?utf-8?B?eml3N3pzeTFTRFJIV1o0WEpmZlZvRi83OXVnQjNNZ29KZko4OGFqSTR0MW1V?=
 =?utf-8?B?NWZ0eCtiR3l5eitVc0IzR0Rpdy93VWhHakxqWEdtc2ZFNUV6NTBHak9KVDFo?=
 =?utf-8?B?d3NiMmRxYzMvUWlubHZzVWo0amZBajA5WkNlbHUwUWhUelZXTnJzRndjWFFr?=
 =?utf-8?B?UDNLK0ZaQjgzV3A1emxhZ2NlVER2VDJmUmd0YkR1T0ZRZ1d3alA2VmFpSDMv?=
 =?utf-8?B?YWxUR1d5bnBkNExHdEVVYThLdWV2d2s0alowNGE4S0NjOWpQUEZkZjFrNlRn?=
 =?utf-8?B?QkpTYzhwS1FZeEdGYktrZWhURTMxcnN3dFp4R0t3dEMrL01FMnY4b1UwekZj?=
 =?utf-8?B?WjQ2QzY5a3hxN0sycXR2TUtLTHUybWhFUlNaaE5DdGpRTGVldjNWanpEdVlP?=
 =?utf-8?B?SndmZW1USjdrTHdkTUtEYytKWDJ4NSt3S3ZNanhaUW8rSUlKcXpHWEE3LzlR?=
 =?utf-8?B?cm41QWgxV0c2dzlDTmwwcHo3enArMG4wblVwR0xWSXFCdnY0azcyVUpQcUl4?=
 =?utf-8?B?ZU1uaWtsbVZ1Smpna1ZLM1J5Um5WQjZaSXYxb2ZIQzFRRDlQTEE3aTR0bEts?=
 =?utf-8?B?WWYxWG9sK1VBRDBFSU9iVDRKTEt2VHgzRENOc3BnNi93ZWVRMHN3a1pkMy9x?=
 =?utf-8?Q?6OeTdEjrmK/D1bvU=3D?=
X-Exchange-RoutingPolicyChecked: MLgbLZ7U5r1SNCY1lmyB8p0vHtfes2lqNTt859q4exHDq4VBqkqckBvIb/9X/IuwS47xlau8pwmKxpeNEP/toejfkc/BITMo1yq0dpAi2bS7jeH5N+Hg8raiwS+A92xOuowGz/S+aMZQjzzL2b5IShOkNZKwBvXzouaWwAKfLh7KQ2h7QWAIgqpu4YjjcWoKxin6ZpEjF3WottPz4Q0LwY2jBHzgZVfFthUmHnfACm2MQcwAIaEQEutLFeoTX/7+OVHQ8bqsAnlgELc9swoN2F2FM5nMZpraXFipMN1xnFzh85jIlwqwEayZanDIWctMqlxYrArB5tLw6/C6pccdsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: acee9a66-44e3-4d35-afe5-08de88adccb8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 07:28:37.9855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MenuiN7qkrfmTqXuArUO44plKPsIu99kLZTrDAoMGiN3OmbZzbKPqbaF0ExN6HwoG6BIqLVio8YfAUZMfTJxghAqfTjFNU2tlI8/rixv1RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
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

Hi Zbigniew,

> Files produced by hooks which lands in attachments directory should
> be called in piglit style, what means they should be in form:
> 
> igt@test@subtest@@unique-filename-from-hook
> igt@test@subtest@dynsubtest@@unique-filename-from-hook
> 
> depending is it normal subtest or dynamic subtest.
> 
> Hooks introduced IGT_HOOK_TEST_FULLNAME env variable, which contains
> 
> igt@test@subtest
> igt@test@subtest@dynsubtest
> 
> and it should be used as prefix part (before '@@') of attachment
> filename when hook script writes some content to it.
> 
> Such defined contract between hook script and resultgen allows to
> distinguish subtest/dynsubtest attachments structure in results.json.
> So string before '@@' is a subtest/dynsubtest name in results file,
> and string after it is a unique key of a base64 file content added
> to results.
Is the base64 key in here to provide uniqueness to the
particular test run results? As in, since the output file
content will usually be different for different tests, the
base64 would also differ, thus being sort of an ID.
Why not a timestamp or something more readable to the human eye?

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> ---

[...]

> +
> +static bool fill_from_attachments(int dirfd, struct json_t *tests)
> +{
This could return an int with last error/errno (EEXISTS,
EFAULT, EINVAL, ...).

> +	struct json_t *obj = NULL, *attobj = NULL;
> +	char attname[32];
> +	int atdir;
> +	struct dirent *entry;
> +	DIR *dir;

[...]

-- 
Best Regards,
Krzysztof

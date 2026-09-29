Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FECCA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 05:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9B710ECEC;
	Tue, 29 Sep 2026 05:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtnCruqi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C3910E582
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 05:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790661504; x=1822197504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UDMVqjBl5spozd06I5Cad4CEJ+Y6LuXR+b9x471jQY0=;
 b=DtnCruqiMNccgEXVXFucTDYGrWnkvjm64fliFEbUrM50cEjlO6C3TejU
 I16OcHCHI1/g0ys10AOUZmvGD4Wz3lOB0NhmNWdYl+qaz8qbqqNgYYq4G
 61KGIGJVuKufwRjJZTQQi1UVySg36n2LGwG3Bz9pFMy/CM8Jv6YLU9Ia8
 xfgycmlmjasfaiKrB5JPgHuKRYFGPNFSm4NhayGgOupe5KaevjrWCZZa3
 PWMVpMWh2jYN2F5YgSD+t3BPEsYVQ6xgfSVi8yL6snH6T7l5es01s9EMk
 y/AfknB1CDWxVny58rPKydKmGdt7aDp+TRsFKZpGqdueWPky3G1RXxlN5 A==;
X-CSE-ConnectionGUID: aIj5ziomQcKRsMnGzOiAxQ==
X-CSE-MsgGUID: T6HR5CAHRuq8/pS0aEjhBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101941684"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="101941684"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:58:24 -0700
X-CSE-ConnectionGUID: LjvR1q2fRPqkMX2mRv6TaA==
X-CSE-MsgGUID: Wb92lsCrS1y3pMDCBmd9WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="313210309"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:58:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:58:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 22:58:23 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.34)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:58:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aT61CK8eJ6hFs8QB5QtXuIDJqw47JyaAGxBfOrv7BQeGKsNbShs3IrqKlgG6Ld36mrCpbYq1Tt+EEG0r+hDOLVHWkvFnSasXlJBJIsFyWY7rYEitb0DABlXYrNgXaISoD836D69u2eLfElhmUOjXNH3ue0iATh0e7Oa0SP/243EyEjKB50VeGetU56fdvWcB+6YvvI/l3qCLoM7xJRN94dOKKvywSXzAxAZEYU7Jy8y4nH8o61INgwYOpBboYM13eU+GtwP6g4N3LiHFL6RFqmCCzky0MHpaxoKI24x8rucJrn9uMSE9OC6TskvvyxDyhwUt72gIVwv8M5D5uIgKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEpAxRTzekZkOxPQGyGw+jFhAEovaGbF/dgydHrGQ6k=;
 b=ugq/ubKIxpx3+LiIHxU5d3BEcns3f/OLk4EiloItFdPoQ3RBf/x2TxknMZ7BqnxZu21Re/8yGutd5MO3jIrEDo2tZ3gWPwqgZHx645aTsB5UMikKziZcnUe8lrkBW0ddY847o0Qnd8KrNo6sbbimkdZTtyE3bei1Mg4/npT4GGWEqT2p32nvvtLxPwCgo96TPOZ5d0fMENMYb/nSrFU2/RgCYdfkHpP60bI0nHin6qsTCMwD+vcg6QSgRgeJ6Tjts40CEzWCCMnCbNWYAVzrl1DyIwTmwyxmBFbVDH4G1404V8c7NNUs/rVrK8ET/+odj5dBg61yuXfoCtRCX9t/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SA1PR11MB8473.namprd11.prod.outlook.com (2603:10b6:806:3a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:58:14 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:58:14 +0000
Date: Tue, 29 Sep 2026 05:58:05 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 5/8] tools/meson: build gputop PMU backends as part
 of gputop
Message-ID: <jihsjkad2pvd7f27st7hmhqsnvrrz3dgqmzglhoa75lctwoha5@h4z7oqbodjn7>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <482cdc12e728fc17c250407cec34251ae3295f33.1790331690.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <482cdc12e728fc17c250407cec34251ae3295f33.1790331690.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA3PEPF00000513.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::667) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SA1PR11MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 72879edd-608f-48f1-04ae-08df1deea695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 8+EJJjYN7ckjK6macnmDl/6WDkfW99vY2RcX/g6vlPG+e2nAygFcKqvLrs6EQxvsLQKcYHn8iMojn8vi5lMFNoJXnrelmesIPvlNAPZgPK7oh4Bc+GS5tFuFtDXRJe2I0CLe4yrlTO8pcpv+YaqxFJLH6+xTzIZO97gQ5GVJKzsTMv4s5t0D08MaQy+MriEeGwvg0vt3+sK8GrvKCzpdErj2JOGX+HpHFscsvPCy29JlDkXo8sIDvbK4bL6Rb2JXqeRaB5PvUifN/siqY24UfUcOZfk+h9XPAPOziLBxB1Ypbv4Z89D06C9IfgtShaf2w4v0bTBC8X9kQ4cc1v3NfLcI36pIcWqSnlG2uXg2YQGNh0P102Aczcrmx9+oG8Lstnc/hv92IrDqhxc+qzPYVBkw/cg30YnF+lmAPcra9d7fDivoYp+fPDoJMXExlp7n5cW46qcOLRDdbqt/p/OS/lyxVxAPAGuufzHofAHRCOxAaXEZkOzFcCogeoSNXMlAlx9wqDgNSZ7uuVmMEc4k0LxGGl4EonYELSHo3MUZtiRBjHggwAEkzyjxzxZkFnW7ymkxl8J8me1hj1e571uS17pV8vMuPGezGTwJv+bQZ9TcSONKy5dnItCEQ8khAPeogGswnVRS6K7lXiQ41H9rRvfCLtorhbXCfS/vLlBLEhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmtVcjVVbGpzSVA3cmpLbDdHWitVM1ZoZkgzV0RRRzVYenFSK0EvU3loWHNJ?=
 =?utf-8?B?aWpsamt1UzdjekJJVnJjL0doYldtWGhpMm1CTURVSC9pMXdJcGNUclhBN3Y2?=
 =?utf-8?B?QlI1dnpQNmdJR0M0d0VqT1d1YlNBeHYvelU1eksvY3M3KzZNazJXbnBLNVhR?=
 =?utf-8?B?YlA2RkEzR0tCSzFYc2MyaE5WTkh1MjA2ckZZR2NDS3owTlh3amc4c2NRUUxN?=
 =?utf-8?B?dkFrd1h2VFgvaGxJYWpMVVBCNUM4bWl2M0ZlRHNIYm55YTNaN2dFQ3dpSUpK?=
 =?utf-8?B?aVNMNG4veUVka0JIekZtYTNXK3FBNXFnbUFhSmJ3aGtWTkFxMHAyRU5iQnZC?=
 =?utf-8?B?UXRtc3l4a05nSVpTUEVFMHc4YVQ1cGE5Zlg5NGJrdU1iZTcwbmZkU3N6K0Y1?=
 =?utf-8?B?LzdRSFJ2b2x5T0Q3Tmc1TEVRSHQ1YjNSSVhrQnRNVVdOdWZPemZUVXNXUnpk?=
 =?utf-8?B?akhhYWRQckpiRGxQOTF6M0RnUjI5czZvZFBIT0NEZXBieFFWNWZ2S0JhbnFs?=
 =?utf-8?B?ZTJHVzFma3pnQ1BoRHQ4NzRZbFpsYzU3K2NDbzlxVUU4R0J6ekEvczZqTFZH?=
 =?utf-8?B?amNpZE1kWXRNa2dFRkl5K2w1eUZ1SEU4TzNrRlBGejhhdTE0Syt6R2hCeUZm?=
 =?utf-8?B?TUtHdWlwY05hN3BKazNmSDI0b2wzNFNHRDBCMENjMFRRMkk2VW91OFNFaVVN?=
 =?utf-8?B?MlpYcUFaMktiQ1M4USs0b1k0YlhUNTNYaVVvU0VXRTkrNVloVjVGTU5BK2E0?=
 =?utf-8?B?ZFRBM01PSFIyOVEveWNWQUc3UzZwb09ON2FTbHZGbTB1bW1vVE9LdWl4Qml6?=
 =?utf-8?B?Z1dFWTRPeHFKZHArNnpsWHRRekpWRm5LSUJ1M01zK280K0htaXMxMFdWUUs1?=
 =?utf-8?B?ZGV1TDEyYnpobm1qQ3NKRmRnaFBpNENWdUR4c2hRNEZvQUlJT3lrK01qM0t6?=
 =?utf-8?B?VXJMMklUSzdoVjluYVU1YS9qZW9Cd0IveWxOZkVsVkRKL1UyVVl0c2lVa2Fj?=
 =?utf-8?B?aTdTUTlvWjdndGZZL0pJUkZVYlhVYzJEaFFUbnRPOHNKbkdNaWxMMDYwYi9G?=
 =?utf-8?B?bXI3Q0V0YzBSb3E4RFNtTjZxblk4c3lENTU2YXhYZ1FwbGN4a1VCWDgvSW5o?=
 =?utf-8?B?SmlCa0VxQll5dE5OdzFIbGlRVFRrZW1xV053VjFKak1uVFhvdGhwd1pYOEUx?=
 =?utf-8?B?VExyL1JES3RWbzhxSlZ1THkxbWNlNGFWQjJoN0t6SDl3eStreVlMcFJ1SnBC?=
 =?utf-8?B?K1gzbXhDMkZUSCs5eW9aWThDRmp0QTc5UjhuSG5YNm03STBxbGt6Z213bFhB?=
 =?utf-8?B?RGQyUEozNDdmLzhUY3VaVm5iTCtQclFSdE9xcng4Q1JiazMvNmptTGpsMEV0?=
 =?utf-8?B?Smo3TEJTdnRuS3pucWloMUJKcVJ6cWhWc1M2YWpvK0U3M0s2TFlnZ1J6Q2NP?=
 =?utf-8?B?YXoxRkdiN25qK2VONWVHdDJQUjFYdHpyaGJHRTBWRlRzanpYN014bHlob1li?=
 =?utf-8?B?dVFnMDkwa0szcHl3YWh1QTByeGo3dk5pSU5xMGVBQWRkeTcySldpdGpBemxN?=
 =?utf-8?B?QjlDWkg3TGVlRzExdmtNd25RRHJ6Q3VzcG0rV2xEN1JCM2pPRzR5Q2J0SGRJ?=
 =?utf-8?B?UzdQL1RmbzdWZ1ZQb3JBOGxpbktCQTM3c3U4SStIRjVYcWZQNzBCWFhaNldZ?=
 =?utf-8?B?QmFaZytXSkMyaS9KVE5WS2FncWdodTdvd2ZBVDR6L2Z1LzhKZVFuRUxWcjFN?=
 =?utf-8?B?T1cwZWthWmc4Nm5Nd3NjSk1kNUVoUFhzbWwwdlJnRjFwVlkweExjZ0tNQjho?=
 =?utf-8?B?Q3pPdzlYWmRzbDFTc1dlQmI4NlNCME5McGFUakFjMWY4TlpKOWRIWmNsbkg3?=
 =?utf-8?B?dkh6WDBPbWVMbWZ5S2hLcHZGbFF0V1dSKzUvaE5ZNHU0Y2ZBZnkrQmMzYkN3?=
 =?utf-8?B?Ykp6OW1yOEJFTXJHSURKekFQQXNOT3EvaGkrK1VZVGMxY0dWaHMxUjYwV0R6?=
 =?utf-8?B?Zmh6aFpRczhTdVBaalkzekZ3L01nWmJRS0Y3K2IzNGtpS3N5bGhYRmQvOUtT?=
 =?utf-8?B?dFJmYWpwaEsrQnBxUVB0aVlmc2pUNXBPUDhjZDVtTWRJRkZDVE1BYndWSWNu?=
 =?utf-8?B?ZnFjeSs5Z1JXMGU2TWdkNWQ3a0Mwb3FsNnlNWU0yaDk3WEgwVmxzUkxsYVlk?=
 =?utf-8?B?dlI3cFh3SExNc2VxYXhmblQ0eTB6QWlrUUI4dkh3cUtpbU9pNkVJQ3JmNGdN?=
 =?utf-8?B?bDdvUG1ncC9lS1JtSngrUXRnWlBNcmRyeWQwb3NlVkl6OWZZS0R1elZrNGF3?=
 =?utf-8?B?anZ4RlJYeFFZd1FSVCtReEk0ODU0NzNkUGNWVVp0dWFOZm9EQ0kyd1ZOU0xS?=
 =?utf-8?Q?iDX9YbftptqV+E2k=3D?=
X-Exchange-RoutingPolicyChecked: 3eWwH7ZQZcVrSz8zh/9FWAJFmJ6mBU6chsyhjPaQNW+YiaU0kRIp4KAeHwufTDZAPZc2TbOySENiyPT3mOu56OL8qpFc3nH5ic4YsZhBUKU9q/2UTC5LkWrRKRkJcMimcL/Crq5ACfamK7/VxOM49uu7GYLgrREPAj7EMJftO+cAlZkkRFW1Ne7AdK11JyohX/WowT3ysv4XSeLszM0ZazkIZIC2HQl4Ow9CTZwqVjKySA2u08kC+459kiFII+B9CGlhHpMqUnZPjcTGnUqHo1lfghtplwlNRAz57ze+JwCDvlBlc2OQaI8kRXGqPrcxZJB8KAQrC1fFJ6E+idvzNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72879edd-608f-48f1-04ae-08df1deea695
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:58:14.5362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRL2mChbnfeOcgQYZ1/+PrJJ2wzBAYae9Hh8O/PZ6VgMCoIKmgwG8ZhoRIRsLNC2nDpVh2UUaWAGPtP9Yib/22L9aTlwwHVQi/5M3eNQL2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8473
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

Hi Sebastian,

On 2026-09-25 at 12:57:45 +0200, Sebastian Brzezinka wrote:
> Add gputop/utils.c, gputop/xe_gputop.c, and gputop/i915_gputop.c to
> the gputop executable sources. Pull in the required dependencies:
> lib_igt (for xe_query), lib_igt_perf, lib_igt_device_scan, and glib.
> Also add include_directories('gputop') so gputop.c can include the
> backend headers directly.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/meson.build | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 68c31da92..029668b90 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -147,10 +147,17 @@ if libudev.found()
>  		   install : true)
>  endif
>  
> -executable('gputop', 'gputop.c',
> +executable('gputop',
> +           ['gputop.c',
> +            'gputop/utils.c',
> +            'gputop/xe_gputop.c',
> +            'gputop/i915_gputop.c'],
>             install : true,
>             install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> +           include_directories : [include_directories('gputop')],
> +           dependencies : [lib_igt,lib_igt_perf,lib_igt_device_scan,
> +                           lib_igt_drm_clients,lib_igt_drm_fdinfo,
> +                           lib_igt_profiling,glib,math])
>  
>  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>  executable('intel_l3_parity', sources : intel_l3_parity_src,
> -- 
> 2.55.0
> 

LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof

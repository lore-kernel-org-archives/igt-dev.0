Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F0FCF3963
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 19:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C49610E15C;
	Thu, 19 Sep 2024 19:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZcGQVGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F333B10E15C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 19:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726775306; x=1758311306;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c9bmt6SMsPDHBjPwfj/RaJVJpbxHmcijxd9lxoaZ7tc=;
 b=VZcGQVGt5oKWUMrc5KJwupiWRERabCW0ttzkQiRsn4Pb9UWJDR7a/b60
 c+R66q7KFrv9Tv+mlUmjLbKjFY4C3ffCO6nw1Oy5XGyZT2ePUB98CEzyr
 UbRcmBqlyTg7ReZXBgLL6GAYwf9mqAocjWULaZxM+MixOcsYjTHoXmavX
 vETM5ruyXw/SOt0R4lTmBrgzOJawt9lMKK5ijL8AwXwv2LKtKvLnuWetT
 EvjPrNhUKJ5ZvuFVouPs++w8YlPDLi5qr30s33JrhDYPHNoXu/n7R8Qo/
 C0PTdIpzLSH9JZUHt9NrDeUH8nrS5x+yEQ2GJ8uwXIQt4ktA2WClB+qvr A==;
X-CSE-ConnectionGUID: 5FP6QGVGQBih82OXeFwNxw==
X-CSE-MsgGUID: TWDDaf+MTJ6ceQMU6j+n/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25636419"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="25636419"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:48:25 -0700
X-CSE-ConnectionGUID: r2kn0h3HTMeSSVPyvgnQLQ==
X-CSE-MsgGUID: 8CRTz3hpQ4ulqzT+WwwqOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="70494574"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 12:48:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:48:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:48:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 12:48:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 12:48:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmob1KGBhG6qlHlIiOibU35AcyKQtH2lhVzicDzepY73hg62g470Jgqxr7Kh6qfPP8qy/7XVbNpc6X3crr0UZQWSCNRa6EjWwoU6FPphS2/PXMNLNbHUJiaQP1gy5gxSfZ8ntZdfbvz5JxY1psevyk+lniuhZGAze+KMLBhkgDJVn0Gg4ZjMrJTobhg0SazdANDLUeoXNZ9NuWN5k/LDWHVFYl3wW9Iq3sVifaC1V7S3BPV+Uhldv3e7BOsCrs9JTcjwaBr+JreHImbc6OMFNlOAti/cbGZVVrrCPvd/jwBtmKZ9H3u96q7hxWZ+/2OcegYDrCAS0Tcdm+b75dmBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRcMV//LGS8C9vD+0fm3sF+GGd+2nCub4+nBFzLwIoQ=;
 b=vwXMgItxNTjlGKCc5Ga/4P77KM/mQugJH5tv8A/L8e3Uud7Vy0ks7/77E64fyhPNAr3bU/s3IFdYeTNeq2pPbyA/B8PKl30BdgzIXKlEtQUimrQ1HFs+NlyL3Mp5l/gwjlh+zEs4zloqOiwcM8qZdcgPPMzfI3RAnDm2x4QlgaIWW3+3ctjhOqkLlDBV41bUQQohXanHIN7BkCAmMbtPBmjdgxc/gyxH7ILAs+6utrTqhR/WCUlKOcpAa21mdnHCwmuR6OsGe6AdDMfYEJ58x9CDLl43Wq63CSgIKYwWaFaBJxMgsUsAD9f+L2Sms77DmoE8KmOJl3MFbLKHBSDSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25; Thu, 19 Sep
 2024 19:48:21 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 19:48:20 +0000
Message-ID: <ead32894-2797-4b9c-bfca-9469248d6e8c@intel.com>
Date: Fri, 20 Sep 2024 01:18:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_vrr: Update LOBF test to resuse the existing
 logic
To: <igt-dev@lists.freedesktop.org>
References: <20240913065616.326959-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240913065616.326959-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::11) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|CH3PR11MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2a0ae9-ecaa-46ec-4b3c-08dcd8e40361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTZnSlQ3RXlwYU5wNzY4S0JTOGlGMDdQa0xUUHpPUS96MGVNSnFWQm1oM1ln?=
 =?utf-8?B?akxNUU5vNldVNzZrRjVxK0MvanRDR1Izc1YvNWhxaHJCVUgrTkZXV3RUNFc4?=
 =?utf-8?B?a01hazJHZSthdUpVQU5uVUd1RkR1c25aYWpnSkN2L2JxVlV4Uk5VdVZJRk5R?=
 =?utf-8?B?eHJmMnNMUkNaOGZpNzZtaG5IQlRZU0pucFM0ZU0yMG5lWklkOS8zTzBybDQ1?=
 =?utf-8?B?anRaeFd2aGE2YytZL1c5TlhuREdMNnRvbkE5bUFkQjdOSWEybzV3eTJTUU5E?=
 =?utf-8?B?ZWVKUUkxOFFJQ3YwOXN0WFlMaHRBc1NzMUtZc0MwQ1RHK2h1dklOYnNlYzJj?=
 =?utf-8?B?TEc0MTdtM25UakpmRG8xVDlEck1sNitpb1QvS0I5OGtRNkFxZjE2VTZzWkVS?=
 =?utf-8?B?ZU8rWDRPTnU4V0FKVExVUEFFOTViSkRnRzRqelpHajFkbWNTSklhNlY0ejJC?=
 =?utf-8?B?SUFNcmd0Z3V3aXZkMmFnL3p5c1VjdGNuQmI3bXJwaHc0azhuTjJUQzhMUk5C?=
 =?utf-8?B?R1FrTGs1T0JFUTBZVnhzNkpEVWVkaU5vRTU1Qk5Ock00WTFCUlU3NUVvN0JI?=
 =?utf-8?B?aG9NTkdQMGRENTVhMVBNNUpLNmRSYTUzcWEzYkc3NFJCbXFXSUk0MzFCYVhi?=
 =?utf-8?B?cVE4dGY1Q0o4cit6VDI2ZWhweHRZRERSNVVON1locE1kZ2E0MXVQVTM5aGUv?=
 =?utf-8?B?MDRRMmt5Vzk0R01HaXhFWUZpZzkvWSs4NHBWanlVaDB2TDVWU3c2alJ0YlRY?=
 =?utf-8?B?bmZ1cmFqZEM4UW9DR2VhdHNUMWI1ZmY1SDFWenord0ZLQ2xXUlMzZ005WG01?=
 =?utf-8?B?Mi8yamRrRjJ2ZnJKL3d0aEMyS1hJc213OTYydS9UTGZkeEpjcXhIVUJUS1V2?=
 =?utf-8?B?K2lDYUVoVlpzeVVZcjVvVDRWWXhnMHZNUkFuYmNVWDhUVmszOVJYeUhtM2JN?=
 =?utf-8?B?ZyttcGRUN1JNSlpnVjBORkI0Nng2cUtJOVd6QnlPaFIzMUcraVdiRm5sUnVv?=
 =?utf-8?B?YWVFNjhVZDJ2ZXZOaDZoei9RYlNKYWFSNjZ1QzY2a2RyaW1NaTVVd3lqZXVB?=
 =?utf-8?B?NGVUS3lKcytkYkROTEtwVUZlVHBWWWEvMWpmazRJaVplV2VFeEttYkc3Rjh5?=
 =?utf-8?B?ZFFqTXpvZXVHWVNGVS8rbHZWSjNuaHF4VU0vUG5NSGh6RW8zbW4yaTFRRisw?=
 =?utf-8?B?WmJLMGdFaEZsbWF4SVBaamVLenhzUXlyVER5Q1YyN0lJZk5HMzNxeEwvZmh4?=
 =?utf-8?B?STNoenhJb3ZhUjVwVmltWnQ1cFgweklCV2hNamdFSEdHRE1MWkp0eWhJbmh4?=
 =?utf-8?B?cFVBMCtMcjBZRTMrb0FJdzc5QlJmVEtqcVpNUVRhWFNUanBEdUNpTVZBcHlU?=
 =?utf-8?B?eUFNeGRpcnN5Y05VUUhJU0RUWnhFei9MMzBITHZuTFFlZjl4SGxrM1h6R1hH?=
 =?utf-8?B?a2FWcWh4dDBEbFdpeXdMb1NYQWJuTm5hWVhaNnBZWXZmR0J5SlZEMEY4TmVy?=
 =?utf-8?B?RlM0OExXdTFOdDVaMEpGUm1GU1htYW5tbXhaN29hbXBYM1hWbTh6VTQyVG9K?=
 =?utf-8?B?QWwzZ1FTZ3lwbzJhd1EzRVNETFFUS1JkdkJWcFBibWxOZGlsVXJKQ29nRXVG?=
 =?utf-8?B?U2tyWVhMcXFOK1U0L2U5UGtsN1hzR2lkRE1tcm9yM1RaeXpLbWw0WHBGU0lm?=
 =?utf-8?B?YTlFTmhPZFFRN0JzUjJ2Z09LSkZ2b0RkZ2hleGpHZUVpVFAramdvdFhVNFgx?=
 =?utf-8?B?OENqZzAyekdaMkJZYTk5UERBUHN5RTVSd1dPdU55RVYvUC9lZWU0d1pSMDFv?=
 =?utf-8?Q?3rkkHPmebjFw9q6taCcmclbR6O/VY2rrwRtio=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ZOMm5aaEVESWhIOXZUSUxMdzR6OEJmTGliWUY5Y0dPc2dNZFBpaHpoZmV6?=
 =?utf-8?B?NnNZZjV3NFg1Qk1obDlabEd5d2U2Z0R0YjQ5S25ycnFIbzdTcnN4NDRwbmF5?=
 =?utf-8?B?Y0l2Y1g5aDhwVERiQ091RFA2MDVWTEF5WWRwblRMVFZaQlIrN1hVUHYzNFYv?=
 =?utf-8?B?d0w2Yy9VQjRyRmhVZGNuRXpRRTJscEN4SXVxYTJLU0RKYnpJRnRLcmZzdUVh?=
 =?utf-8?B?b3ZXSEpGakpCUzBjd1ZXSzB4L1hlWGo1UjRnd2p1dXRoSHJvMUpIQ0x1b0Na?=
 =?utf-8?B?UGNmZ2E5cis3ZlR3TFpYeFp6TGlUd0RENWlOdkRlZTRwbEk2Y2pYSGx3N0pr?=
 =?utf-8?B?MzNqbjdjNThXSEgzZjBVOFVjcUVwMDY5ODhyQWwwaXh4MThYY1BnYmJYaEpF?=
 =?utf-8?B?SFFhcWQ2ZTZtV09sN2NpbHBxWXlBY1FuTzVZSDVRblBTbllVNThqZDBMMFh3?=
 =?utf-8?B?K1B2amJWcGdXN2RyZEd1VlRaMmIyNzBJUzFFd2FkTFc5c3BoVFFaWjRYUm91?=
 =?utf-8?B?WUxSSzUxb0FVMTlFWEdQQkUzcERnQlcweWd5eUNSYWU4V1FOcWlZdUVraGhJ?=
 =?utf-8?B?MGlZcnd6OFlUcWFHRVh3YjJUTXJQZEtvb1REQmYwT0dnazdYb09IWE5VRlVq?=
 =?utf-8?B?MGJ4dEdkU0x1enE2U3A5aWhaYnk2cUFNZjVyV0RWcmR0cndFdS91RzdZWHd6?=
 =?utf-8?B?eFBaWnFaNnpKYU56VTNIZVY2RkQ4RzJ5bng4UzY4MnE4YTFSWUJNZnY0MG1s?=
 =?utf-8?B?OXNlTi8zMXdMQkQ4eHBLVGlCL1VoYkU4Vm1CLzFBRGRrYnhMRmtMNUc1ejBU?=
 =?utf-8?B?TSt0WTZ6dVJDc0JXZGtlaTdLMDVPTEhwNVBDTDJQOC9LSTU0RE0vakhTc0E3?=
 =?utf-8?B?ejNIT04vWEpaU0NjenBwYnMzRWZsS0RmR0Z3aHFaSEZUcWdBb1R2UlViSVI5?=
 =?utf-8?B?emRNTXAxUjU4NFhiVnFVWlA3VjVGckNBWWtZWk95cXYvelNaRjlyN2RSaXBq?=
 =?utf-8?B?TjNHN3RHUHUwcXFKREZwQmtIMGZ2a0RHVHV0dVlWK24zZmtOUWl3VmRIWExm?=
 =?utf-8?B?RjNncDNRNkloR3pnZUsyQkVnL21qQ095YkN4MHR4cTlzaHRySzlsZ0gxVmlJ?=
 =?utf-8?B?R1U5c0hOdzdVWGZRdCt0NVBvTzZWNWNFcDc3R2tzSjlSRDFURzVMZU5xeFFJ?=
 =?utf-8?B?WTdjUnEvSC9zaG5RS3dhcGNSV1BGK1lFN3k2WWNBK2lmT21NTHBvb25uM1pR?=
 =?utf-8?B?WWwrOTdLTkhBZ1UwRFpteFZ0enNndHI1RDg0VGFnU1VyUnJ5U2hZYkJoRnI1?=
 =?utf-8?B?UkJ3cktZN3JGUGRiNDdrUysrdmtQQm1ZWVJPTnF0U3ozQmNIM2RGcDZOcVQ0?=
 =?utf-8?B?bm1BdmxVc3dlMUtYWEJTNStnN0tEK2oyVjM2S1J5QWhvTkdmR1FsN0xUZitk?=
 =?utf-8?B?RWkrRmxKWXMvQk9vM0l3ZE5HalQ1dmd6Q2k0WVRXQ3pNSE94QVBhamx3LzdE?=
 =?utf-8?B?MVJvckU4djI1WkpkLzkxRVNDeUJoRkNoeXlGNnc5ZGpoZmliYkxqejc2MXlU?=
 =?utf-8?B?djJBa2o2TGU3Mm9HZThCM2IrU0tpRlFGK3h6d1dpeCtab0lZU0Jrb2FCZmg2?=
 =?utf-8?B?aUZQbUpSeWtJS1dSSGZsMWdaaUhlQTZiNXQ3bi9xSTN3bXd4dFVwRVVLbzlN?=
 =?utf-8?B?M2dLaGVnYS9KcnVwcXU3N0lvbmYxQlpwT1BDaHZHZ2U2ckdoTlUwRTJpbW1w?=
 =?utf-8?B?YU9MQm16c2l0eUo3QlEvUCtMRjBpL3pxUUVqWEYzNkYxUi96OWMvbUpVVGRx?=
 =?utf-8?B?RWk0NjV4MjFXVnZldXNCVWV6SlpTL28vVzI1UWtUMm9Xa2NSZnR2TmJHUlNp?=
 =?utf-8?B?R1NYVjBYaVhPZDg2M1RqbVhDaVRSdStLUHZQc2tMUXFFTi9kVHR3K3o0Mmk1?=
 =?utf-8?B?WTQwcldGTGl3UlJRdDhhNVg0cnBLOVAvM2tHNHpiL20wakFFSk1XWmt4QXpv?=
 =?utf-8?B?MkJHcmhhcDViZ3dVS1F2aHFUUExldUVIUkllNWZ6RGlYaVhyMDgzTUY2SXlH?=
 =?utf-8?B?ZkhIN04zMGlZa2E4bDFEZ3NjQThNZGJ1endMR0xOR0loYWVJL2JlQzVUUjNs?=
 =?utf-8?B?aUpSekVzZGU5aTBDWjQvYzBLM3FsMFdRYS9VS1dzN0dhMDBENWo5K2g1ODE5?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2a0ae9-ecaa-46ec-4b3c-08dcd8e40361
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 19:48:20.5269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFO8TH1LhfJ5XahIoge9mVpclC/DjnhSpGW54DafuxJtCI4sh9j+uykxGhXSpvwVrklQecjEo6XblniP6+0MRt0RTZjX35IHXD5dzilU2Hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8775
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

Hi Jeevan,

On 9/13/2024 12:26 PM, Jeevan B wrote:
> Removed the test_lobf function and used test_basic instead to simplify
> the code. Improved validation and error messages to make LOBF testing
> more reliable.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_vrr.c | 45 ++++++++++++++++++---------------------------
>   1 file changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 36a22eebe..5d9b321d3 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -640,7 +640,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   			     (range.max + 5), rate[0], result);
>   	}
>   
> -	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN)) {
> +	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN | TEST_LINK_OFF)) {
>   		rate[0] = vtest_ns.rate_ns;
>   		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
>   		igt_assert_f(result > 75,
> @@ -656,16 +656,24 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   			     (range.min - 10), rate[0], result);
>   	}
>   
> -	if (flags & TEST_MAXMIN) {
> +	if (flags & (TEST_MAXMIN | TEST_LINK_OFF)) {
>   		unsigned int range_min =
>   			/* For Intel h/w tweak the min rate, as h/w will terminate the vblank at Vmax. */
>   			is_intel_device(data->drm_fd) ? (range.min + 2) : range.min;
>   		uint64_t maxmin_rates[] = {vtest_ns.max, rate_from_refresh(range_min)};
>   
>   		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> -			     range.max, range_min, maxmin_rates[0], maxmin_rates[1], result);
> +
> +		if (flags & TEST_LINK_OFF)
> +			igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
> +				     "LOBF not enabled\n");
> +		else
> +			igt_assert_f(result > 75,
> +				     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target "
> +				     "VRR on threshold not reached, result was %u%%\n",
> +				     range.max, range_min, maxmin_rates[0], maxmin_rates[1],
> +				     result);
> +
>   		return;
>   	}
>   
> @@ -796,27 +804,6 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>    * (Set Context Latency + Guardband) > (First SDP Position + Wake Time)
>    * one the depends patches are merged please fix this function.
>    */
> -
> -static void
> -test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> -{
> -	uint64_t rate[] = {0};
> -
> -	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> -	prepare_test(data, output, pipe);
> -
> -	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
> -		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
> -
> -	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> -	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> -	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
> -	rate[0] = rate_from_refresh(data->switch_modes[LOW_RR_MODE].vrefresh);
> -	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
> -	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
> -		     "LOBF not enabled\n");
> -}
> -
>   static void
>   test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   {
> @@ -1098,12 +1085,16 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   			run_vrr_test(&data, test_cmrr, TEST_CMRR);
>   		}
>   
> +		/* FIXME: test_lobf : Lobf can be enabled when
> +		 * (Set Context Latency + Guardband) > (First SDP Position + Wake Time)
> +		 * one the depends patches are merged please fix this function.
> +		 */
>   		igt_describe("Test to validate the link-off between active frames in "
>   			     "non-PSR operation.");
>   		igt_subtest_with_dynamic("lobf") {
>   			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);

Add a check for Aux-less ALPM status. If it is disabled, LOBF will not 
be enabled.

As per bspec https://gfxspecs.intel.com/Predator/Home/Index/71041. LOBF 
can only be enabled with a fixed refresh rate (Vmin = Vmax = Flipline) 
Add a check for this Restriction.

>   
> -			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
> +			run_vrr_test(&data, test_basic, TEST_LINK_OFF);
>   		}
>   	}
>   


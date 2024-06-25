Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF23FC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 08:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F52410E5F2;
	Tue, 25 Jun 2024 08:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSku4usZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEB910E5F2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719305053; x=1750841053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=l/BPfoOwjIQ5NCEwW9Y/CSuQ5KN8yMPHpmIpoy0bNb4=;
 b=TSku4usZNoOt+gX5DXD6dZsUAiOTQGy1TlXg5IqM/Y6vnYhPptRwEMFv
 zTs8tmvVE1w+c37HlsogLezx9itnYcGhUNy+w5r9ftjL54dRPk9Ds1CAY
 XlaDtS5SXFcHq4knv2mpog8pmNiqeQfL+oYxj4yTxOjYnKU2/XX+vPMhw
 0MLZ5LpvtrM0JxcqMIW0F3yglYdKIvuFEwCHr7z9NdflUa55TCf2ZZA08
 6tHi5pbe8SALy5MFTplgUdM1IzeVF7x6IymeACTRD4Kv0YsEuDM97S5np
 WJJ8cEvxJ6Yozj34YLykrXEyUTDA0UZvD2z5NbrARfWxO0ewQ3QfrmeNi A==;
X-CSE-ConnectionGUID: n9MMjgZrRVilbNb9f54hgA==
X-CSE-MsgGUID: UOOhUbs9RFuzIGUfV4lFZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="33844749"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="33844749"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 01:44:13 -0700
X-CSE-ConnectionGUID: WwuQh+zsRnaVGJ68iWzDUw==
X-CSE-MsgGUID: 8zjTYxycSq6mE1T4HbNBNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="44224254"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 01:44:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 01:44:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 01:44:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 01:44:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/pcWZ87ZneWtFQkvL112Hs6GrUTLNga7Ln79ODVIC6beX0jGFJ6nvHeEQc5q6axsqK0l/agS9/9ouHNrwbginbcJSToIel1D/u8sw0MORNgtF2xx1a/JSwEY6ceMAEt5Nc5qN1O5eMwjvkXvn5pSmzvEr90T9isUo4g9c82LNiaVEaUnCROREXnV+ny6TCrjGO1ejjJvhd6sc0VYqsIByRvk0+QVQRAbdDErXoQdAFj4Kv0UKXcp6w1ZPPMGWf97L7ChSJowR3P48yG6DrNxo9KoWHNq/xM1CjExsbw4iEe6rqc6a6u40mRY1vJ1TNIC3tAr5kALyxXLCZX/tdPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/BPfoOwjIQ5NCEwW9Y/CSuQ5KN8yMPHpmIpoy0bNb4=;
 b=DDqPj4csyU2/CFfGI9CuPJwGRL4Iat/xB875CbDdMA+KGiGY+uF1Vm+MnfrFklvmyk7kMH42rYSqqwnO9zHXXzIZGYGUiQmFBc5yRU3ECm/zAUREyaygPV5YZAKui4KYefIXFSw2yT9ZBXBpUYfmUZil/WfmmkTpFWrNS97QuwygATznBXxOW12QxhAj5HTPwq2rCfRKIF/jbXHQFOoiq9Dbzqtjb0mrABzBBR33VopAhmfoZ1z00uMJvqbQxM4FCX/bg9gBIyidgxHsFOXXgcNXqcp69ueye1ox4HYKHsaRHiK4FPMmpzLZJTDXCSHV1Msn0lcCyRCNhu44CI3jHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH3PR11MB7674.namprd11.prod.outlook.com (2603:10b6:610:12b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Tue, 25 Jun 2024 08:44:10 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 08:44:10 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Thread-Index: AQHaxmFff77Il8lRzEK1iBvQR8HtErHYKu2A
Date: Tue, 25 Jun 2024 08:44:10 +0000
Message-ID: <59aa114f979ea1b46edf17adfbbc242298d2ebcf.camel@intel.com>
References: <20240624181533.1600552-1-jeevan.b@intel.com>
 <20240624181533.1600552-3-jeevan.b@intel.com>
In-Reply-To: <20240624181533.1600552-3-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH3PR11MB7674:EE_
x-ms-office365-filtering-correlation-id: 31ac3608-26d5-4558-230e-08dc94f2fbbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|366013|1800799021|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?Z09sajlXeXJGTFkvQ1o0alNZRFZEdG1pUEdOcVhqQXEvU1gzQW44VFhhU1Jn?=
 =?utf-8?B?dmFlVXRkdi80TElHQnhWbE9EakVRQkVpL1I2Qm5QYXVReDVmRTlTRnNDTW9w?=
 =?utf-8?B?NUZEMGZtVWlXSjFmVVh0YktUSFJEd05YRFN2cnRMRWt6MDhvSWxrL05odjZa?=
 =?utf-8?B?SytHa010OVUrd0lSUzdqeUhBSEs3Y3NtaERlVUM3d2d3dUZ3OGJBRHUzL0Nn?=
 =?utf-8?B?cUV1MG5yWVdDS2V5a0lVZGZacTl2Q0hhK0trMi9VT1lkRE9iRlU3OVJFaE5w?=
 =?utf-8?B?RWtkQ3hyNHh3R0JkMklObmRxMmVoSW80ZTl1Y1FjV212RnpsTzU1dzZIeXFx?=
 =?utf-8?B?Y3hXREVVWVVadjhvTGNpNG1qa25adDBVeHRHU3BQYjlGSHMrS3N2eHR0eWNF?=
 =?utf-8?B?Q2FmK3hNK1cwVkY4bDh5VkM0YlV0SlliK1N3NXphdHlBNU16MGgzVE0wWnQz?=
 =?utf-8?B?Um9FUUJ5SDFISGVjaHFQbjVqYVNwemUwWFZTYmZNanFSNFBxMHZPRG4ycUJP?=
 =?utf-8?B?dlQ2aDVsc1VYU1Vpc04rUTB3RlBSYVpZcjBDNXNlbjZxYUpKUTZkT2d3WTJv?=
 =?utf-8?B?OGtOZmovSklCK0dnY1Z5R2tnOExwTlN5L1VTRnZScnBULzltVFJSUmpQQXZO?=
 =?utf-8?B?ZjhMMHNWR0JIbk5VN0RpYXR1TWZiNUxpQWg5Y0p1ZVpYRWc0SDE2TlowcnJO?=
 =?utf-8?B?ak5qSFhLOHNmYjlGV09FSG9BNHRVRng2aXF5ZmE0eE00RzNqNmxKaUVMU29i?=
 =?utf-8?B?Y1RSTXBzUVRyUTI3cFFqUW9DVWU1TjZ0d2JRbm5iUmloQzZTQmpZZmYvRUZE?=
 =?utf-8?B?ZUZGeW1XR0J6NGFVOU9uYlVCdy9DNHFycTZIK3JrQklQWEI4eHpPd2NZa2Vy?=
 =?utf-8?B?amRpYUNDR1dnL2lrYThYc3p5aUdwWDZUdktsZUdpT0l4c2krU2FydUZJSURq?=
 =?utf-8?B?OTJMWGxFd3NqS25ITGJ2UWJkdUszVkgzQUM4ZW1sdG52WVdaSjliT3VFYWw0?=
 =?utf-8?B?NUxPSFZWTVFjdjdvT2VydEZyMUhjSXNwdkFxMnp2YmMwR0hxbVlTZ3JNSksy?=
 =?utf-8?B?alo0SkpLdjZoTENaVVc1Mm0xM2JlRFZCV0dscW02KzIyTkQxazhCZUR3a1pD?=
 =?utf-8?B?VjZZV3NFRmlyQjdDeDlKZ0cwNE9tMXROck12Y3hEcFVoN2U2Wm5sejU5dTdp?=
 =?utf-8?B?WnNwK1B3dVFsWXJPZlhsQkhEbjJyRGp2U3lrUUluS2NKdmtKbEIwWWloZEI3?=
 =?utf-8?B?L0dZRDdxVU12NFNQN2RSMFRlS2JTMS9pSHIzdi9YaUJiYTArRzUyZUphWDNv?=
 =?utf-8?B?WmJSMndlVVRQRi9rZHpTOGgwOFUxU2VaUTJzYzN6THBjNzhJaFJYeFF2ZklI?=
 =?utf-8?B?cHU2T1R0aDNqU2o5ZWJRK2VCN3pHb3NPVFdRa0NpV0paTWZ2VnkyaTVqbFRD?=
 =?utf-8?B?MzU5cG5YcDg2MEQyTmgxWDhUS293UTdJd041MmlQWEtqb05vb2NhdWMyNkFF?=
 =?utf-8?B?QkR5SE9mWFc3U3RqbGtKNjJiU0pzVS9DazltZVJaeUlHcGFOOXFpL0dzS0w5?=
 =?utf-8?B?M3p1aTUxdENCdW84MmVxUlhkdEZVU3l4aWUwRjZYVTVEdGk1ZGJocXZMZFZW?=
 =?utf-8?B?Mjgzb010UWFGazFmdXNkbXhWazd1Mnh5MnBPU2tUTUlrSFdyTitCbVJjL256?=
 =?utf-8?B?amtFOWF6NDdxcVh6cmFpWW9IUkoyTHVOOEt3MTRLRTdhekFmYXFaS0J5d25u?=
 =?utf-8?B?L25mb0ZyYjJXcTJETERwaXVIbXlGR1h0RU4xMllhUTB6YnRrK1JCL3lTNWha?=
 =?utf-8?Q?PMARsXQWRdhh0+dWKpziSkznFYYhEwi7io06M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjVxdU91cGxXamdBcXlMQmgxSGNuMzYwWDE3ckd0eWUrUHFmRCtVU3ZCRCtl?=
 =?utf-8?B?eWtMZGNSbzRiZDhnNGdOQ3lnNk5hcmZWV2lhVlZwVi9ka1JQQ0FHUXpZVHJX?=
 =?utf-8?B?VzhCRjhWUmpsbTVjaVNnQjZzZWorRFpWQUhhS3NqdThuVmNzUm93L28xYStH?=
 =?utf-8?B?MERwM2xSNXRFTldIQ3ZzaDZhMWFWUW1OWXYxc29vREhTbnVTUFJkOGppWCs5?=
 =?utf-8?B?eVVmbzlmY3dNamJRTWVxbXNpRUMyS09lYnZadXFqdHRmZjJOM1BBMjdzZkJO?=
 =?utf-8?B?YW9YdUh1ZkdCZWt5bnVWeTgyc2ljbjNKemZwb0toS1dPTHhwR1lOWnlMb3pk?=
 =?utf-8?B?MTF3Vy9JM0xjUlZXRERuQzMycWFnclBOVkpnWFFPVFhNR1hMOFNYQVliejAy?=
 =?utf-8?B?aU5pZEt6OUJIcnh6RkcwZDVIYTlQWGNTRWpTSTR2TXNoRzMybVI0Vndsb0NG?=
 =?utf-8?B?TnJKeWFDalJXZ1ZTTSs0ZlJKcHk0ZkcrQnVxc2N5L2FYaXBkUldBS09DWC84?=
 =?utf-8?B?UW5VREo1SndSb1UyMW9nWHZFZHVYRkFRZUJackRUUnRsZkRINUtwN0srbVFY?=
 =?utf-8?B?ZDZQNHdQRFpUWkwzSmRHY3gwVTNvRHJjZWVVSkpsY2ZsaytpN3BFU1dYanR4?=
 =?utf-8?B?MWk4a0tjYnBaMXErS1k2dFJ6SFBSVDJmbk1NV09IUDdzc3NVbkNlTkNWS08y?=
 =?utf-8?B?dGpySmt1QldIdGhGbVdpUnJTcWE2eCtOdXdvMlJqV1FTQUFhcHpyM0lKM2cz?=
 =?utf-8?B?cVlEWDhGK0xNdDBSUGxEdTIxdXkvaXJCMnIybmxMWGw2S0ZJcTBGbTc1S1FT?=
 =?utf-8?B?MlhNaHVNbG05S0VXYXhJc204RXhhU1VaSElLQW55QnBJR0ZOTjdiVGtFWC9U?=
 =?utf-8?B?c2Y0QWZpK1JTUXNqL0xpaU8wNjU3aDVMT2Z5VXMyZlRzKzUraUkrSHR1NE9i?=
 =?utf-8?B?K3JDbjVPdFZMN29yRmk5RjQvTjM4QklHTjBMUmtBTlJvZ2VWN0dLT3RsUGtI?=
 =?utf-8?B?UGJjWHlPMHppL1IzTDA3eUdWZUdiSE5XUm1zd1ZpbU1TRXBwNTBwM2FLWjRG?=
 =?utf-8?B?UEdQWGNSZWxGR25DdFE4WXdsUlowdlRzQmRUaFRUTW5Ja0xFL2VHWk92d1VF?=
 =?utf-8?B?cE91Qkczem0vYzNCL2Y5ME8ramdNNVRZTFh3ZWFEQ0tzUnZReVd3Y2FOZkdK?=
 =?utf-8?B?TEd6czlOLzJrRUVXcE1XU1RrbFVrK3RNMGRjMSsyNCtEblNSQ0FHdWRLakdV?=
 =?utf-8?B?bnB2SVBkMEI3d29tMWEvR0g1V3N4aHRpaE9zd1dHM25QazBhWFU3SEhXN1kr?=
 =?utf-8?B?Mkc0cmhMTFo1aWpkbDBLTDVJUlloSU9ua3JnRmR3UFB2TGZVQW5tQW01S3Mv?=
 =?utf-8?B?WU5MdWs2azVmWGtPRXpQYWJxdFFDeXF0aThOTVZzMFNqTFMwc0dQa1dEL2Nr?=
 =?utf-8?B?T2NKOW5mSUV1UnM1c2J2ZTN4bU1sWWg2ejZyTHZUOURDQVQzN1pvVTF3Q0VT?=
 =?utf-8?B?T1JsVWNZMzdpdVdrS21XQ0RoeXVTbGp0WW1Ec2FWaWNUaERiRzZJL2Z0QjVS?=
 =?utf-8?B?bHE5RXo0aUJzRVVyb0pyQ3dZdjY3MkdFbFZtRklKT3N3SElYcXFaZkRsZkc1?=
 =?utf-8?B?bGYvcTFLU0puWndibXIxWDVIS3pWRzJMWjRVMWJqZEFheUs1OStQT3FhczZD?=
 =?utf-8?B?NkNhNW5RYkRISlZaaXE2Ny84b3ZuQkRobW4yZmgreEpXUjN6N2NIckVOWDQz?=
 =?utf-8?B?cDRZVFd1cktBbXdtREhaSzdQSGhtWGZpRXZmc2krQzE4eXRyY1o5RWxJTjIw?=
 =?utf-8?B?Z1pBN3FMWlN3cE0vNEFXS3VKQVVKdDR4T29KRmNEdGtmQ0FyNThOcHdhS1A3?=
 =?utf-8?B?bE1lV2FTSVJrcEM4Mk5NZzdQczhZMXU2ZVQvbkpDWlgybThiQXF1ZC9SYVVX?=
 =?utf-8?B?UlZyeHgyQWd4b29BTkFGR09kMnZKK3RBcjFBRzgrZGF6LzVxakV0VnJKZjAz?=
 =?utf-8?B?aTNFREdMTWVQU0JiR20wM1lTV2FuNXZGVi9pSm9VS0dydldSem9Oc1UyS1JT?=
 =?utf-8?B?OW1mVWluOGUyUkE0bm95QUlEMlZBM0ZoR2hkVnlVeGpVbyt0bHhUNFRXaDNk?=
 =?utf-8?B?V0FQamt3MW5FY0xPUkNWVFhqell3VVpLYlh0N2dPVkhUNWQxVlU2bVdLUUtv?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F270D10872C1D4FA64B142FF5CD5466@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ac3608-26d5-4558-230e-08dc94f2fbbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 08:44:10.5611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H2BM1A9f1w0K8aD0uSLJxwT7+mpkv0t3AbhgjmI4k7nHsp5FnFY/31C1uvvY5pThqmwdvUc4U7kVyhtazmRFFskqav2DvCAXCDjjE1XUnzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7674
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

T24gTW9uLCAyMDI0LTA2LTI0IGF0IDIzOjQ1ICswNTMwLCBKZWV2YW4gQiB3cm90ZToKPiBBZGQg
Y2hlY2tzIHdlYXRoZXIgZWFybHkgdHJhbnNwb3J0IGlmIHN1cHBvcnRlZCB0aGVuCgpzL3dlYXRo
ZXIvd2hldGhlci8KClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVy
QGludGVsLmNvbT4KCj4gd2UgY2hlY2sgaWYgZWFybHkgdHJhc3BvcnQgaXMgd29ya2luZy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPgo+IC0tLQo+IMKg
dGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyB8IDE4ICsrKysrKysrKysrKysrKysrLQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyBiL3Rlc3RzL2ludGVsL2ttc19wc3IyX3Nm
LmMKPiBpbmRleCA0YzNlMzRhYTAuLmU2MTJiODI2NiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pbnRl
bC9rbXNfcHNyMl9zZi5jCj4gKysrIGIvdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYwo+IEBAIC0x
NjgsNiArMTY4LDcgQEAgdHlwZWRlZiBzdHJ1Y3Qgewo+IMKgwqDCoMKgwqDCoMKgwqBpZ3RfcGxh
bmVfdCAqdGVzdF9wbGFuZTsKPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBiaWdfZmJfdGVzdDsKPiDC
oMKgwqDCoMKgwqDCoMKgYm9vbCBmYmNfZmxhZzsKPiArwqDCoMKgwqDCoMKgwqBib29sIGV0X2Zs
YWc7Cj4gwqDCoMKgwqDCoMKgwqDCoGNhaXJvX3QgKmNyOwo+IMKgwqDCoMKgwqDCoMKgwqB1aW50
MzJfdCBzY3JlZW5fY2hhbmdlczsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IGN1cl94LCBjdXJfeTsK
PiBAQCAtMTg0LDExICsxODUsMjMgQEAgc3RhdGljIGJvb2wKPiBzZXRfc2VsX2ZldGNoX21vZGVf
Zm9yX291dHB1dChkYXRhX3QgKmRhdGEpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgc3Vw
cG9ydGVkID0gZmFsc2U7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBkYXRhLT5ldF9mbGFnID0gZmFs
c2U7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocHNyX3Npbmtfc3VwcG9ydChkYXRhLT5kcm1f
ZmQsIGRhdGEtPmRlYnVnZnNfZmQsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgUFJfTU9ERV9TRUxfRkVUQ0gsCj4gZGF0YS0+b3V0cHV0KSkgewo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gUFJfTU9ERV9TRUxfRkVUQ0hfRVQsIGRhdGEt
Pm91dHB1dCkpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3VwcG9ydGVkID0g
dHJ1ZTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGF0YS0+cHNyX21vZGUgPSBQ
Ul9NT0RFX1NFTF9GRVRDSDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGF0YS0+
ZXRfZmxhZyA9IHRydWU7Cj4gK8KgwqDCoMKgwqDCoMKgfSBlbHNlIGlmIChwc3Jfc2lua19zdXBw
b3J0KGRhdGEtPmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQUl9NT0RFX1NFTF9GCj4gRVRDSCwg
ZGF0YS0+b3V0cHV0KSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3VwcG9y
dGVkID0gdHJ1ZTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRhdGEtPnBzcl9t
b2RlID0gUFJfTU9ERV9TRUxfRkVUQ0g7Cj4gwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAocHNy
X3Npbmtfc3VwcG9ydChkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNfZmQsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUFNSX01PREVfMl9F
VAo+ICwgZGF0YS0+b3V0cHV0KSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBz
dXBwb3J0ZWQgPSB0cnVlOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkYXRhLT5w
c3JfbW9kZSA9IFBTUl9NT0RFXzI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRh
dGEtPmV0X2ZsYWcgPSB0cnVlOwo+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZcKgwqBpZiAocHNyX3Np
bmtfc3VwcG9ydChkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNfZmQsCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBTUl9NT0RFXzIs
Cj4gZGF0YS0+b3V0cHV0KSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Vw
cG9ydGVkID0gdHJ1ZTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRhdGEtPnBz
cl9tb2RlID0gUFNSX01PREVfMjsKPiBAQCAtOTE2LDYgKzkyOSw5IEBAIHN0YXRpYyB2b2lkIHJ1
bihkYXRhX3QgKmRhdGEpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfYXNz
ZXJ0X2YoaW50ZWxfZmJjX3dhaXRfdW50aWxfZW5hYmxlZChkYXRhLQo+ID5kcm1fZmQsCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRh
dGEtCj4gPnBpcGUpLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAiRkJDIHN0aWxsCj4gZGlzYWJsZWRcbiIpOwo+ICvCoMKgwqDCoMKg
wqDCoGlmIChkYXRhLT5ldF9mbGFnKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
Z3RfYXNzZXJ0X2YoZWFybHlfdHJhbnNwb3J0X2NoZWNrKGRhdGEtPmRlYnVnZnNfZmQpLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkVh
cmx5IFRyYXNwb3J0IERpc2JhbGVkXG4iKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBkYXRhLT5z
Y3JlZW5fY2hhbmdlcyA9IDA7Cj4gwqAKCg==

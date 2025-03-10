Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40FEC28B2F
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 03:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6455F10E03F;
	Mon, 10 Mar 2025 03:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFTbnxuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C9D10E03F
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 03:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741576462; x=1773112462;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=G0uld244G5ghdJjyHDXmCkIHSo7Q29PD+II1ewyK5Kg=;
 b=NFTbnxuXaEQGgRL5aW4SxEjHjzyJvVokfdHFoku7Cf1Li73YInfAHw+7
 Jih3IqVZiZc/Z51s4nDdVhH4qC5OvwNwyHGBITk6ykRqVUxQ4Jbi2P4Yr
 lSGmscKGImq+z5imd58QIlX112Db8+Tw7fuJER3h5Z9/Sr2Axm7s9uMNB
 JXSy3b3reOBsGu0kisDV4IMnYRyL07Y2NUu5tMU6udnV8YYqU8J/ALEs/
 19klIvdOR+f3t/2NC+tK4A0fkpjRAuLOTRZIJ8QimNhs7YhSgUGi8LG2m
 bs3b1GY6M+Gds7JX4t5AoMiQfq8Kum49m4P7sYTHmRVQ+wqyPuy26zWtF Q==;
X-CSE-ConnectionGUID: O8hRo0c6S2qMW+poQkATFA==
X-CSE-MsgGUID: YtF7cmYyRpOEKzhAARF1kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="67920544"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208,217";a="67920544"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 20:14:20 -0700
X-CSE-ConnectionGUID: zvoN9XhxQb6PN18eEjAOCw==
X-CSE-MsgGUID: J903KGC9SO6LUwJ+HXJ27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="120769896"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 20:14:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 9 Mar 2025 20:14:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 9 Mar 2025 20:14:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 20:14:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4FfpNBjRuw51i4notQlMpLKrBB8wWvE7CbzGlYrDJXLEdGSDjw7hbJFOJpENyv3JW+tKXz7Y4GPAy4ySrSjACHIpKc2VP/SUlpsOEo3r38i47tC6HNwuxR7kNhDAP7D4jP3RDQRvbhmZMjiy+NIFKij3AwYGHXerCFT3FaplPb8CD8tnuVnSWoUNrqqMyjG1FKnbq0JsL+QbtTXz2Im4UQX67wNoNPhRlKtvnoYgO93sVCHhDZwX8tVMikyDqU2akaeS2SA9EQ8lNEYtTtm5WJVowIUZOR9dAuPs+VVZ1BI/6O9ft2IuQFPKRxsdVn1yK57gD4Ldo6al1IAoXer1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LUOZ0awjpjTI2asjCEey3U+h8yxtc262FzyRNocdqM=;
 b=kvppUs5bGzPu/mWVIDbkjAgH6py1F8ALWGhRdgbZkpSzBu5RH7xCxsUO/c0CZeG3MKetF1ZkR9Tc7NNk4q4NYWet8+4QPO7s+jIP5EQkfNF+qJKlH7tJA/8yZDheC7dt7E4a7pKFlTC+gXCD9nsfUNzaughP0a3TQFroSe4KgFA4IKi28+bA5CYKrY1CGliw5iXAt9Sy1wOUiHL1UqRbYx70o/xavWjrIv+al+IrXEcs0BOc9jmRIO4hEy9Fb+XKqlHVwLXLEs+mWMadOaTyguyNXh4R1MR29Nht3Go55w5Ip5CTyxXJIW9Y3iBHOR0vcEJSW6/Gu8Y70Mc/R8n0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 03:14:13 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 03:14:13 +0000
Content-Type: multipart/alternative;
 boundary="------------0DaFofE0s2OqS4xWUgKWs35f"
Message-ID: <cf07f541-c182-450d-9d86-fef704e8339a@intel.com>
Date: Mon, 10 Mar 2025 08:44:06 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/kms=5Ffbc=5Fdirty=5Frect=3A_fix_the_log_level_in_fbc_enabled_che?=
 =?UTF-8?Q?ck?=
To: <igt-dev@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>, Vinod Govindapillai
 <vinod.govindapillai@intel.com>
References: <20250305103207.137714-1-vinod.govindapillai@intel.com>
 <174126035873.67188.12071413029782030897@64e06c682a23>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <174126035873.67188.12071413029782030897@64e06c682a23>
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 2adc330d-b87b-4863-2101-08dd5f81a1df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFZMcVVQZzU5Mm9ha2ZZM2pTd1BMc0R1ZDBVMEt1bHB5RW5lb2k4YTVDYzVn?=
 =?utf-8?B?WVFJTTQ5UWJhS1k5QmJVcWhPSjdVL2FqRjlrclRnbjhqN2gxOFo3SnVhMmJL?=
 =?utf-8?B?b3FOdTcwZDNTa2YvS1NweHFlYUZxckpaUXcxaE9QRUtJTTNYcmRFQzJvc2to?=
 =?utf-8?B?OFZ5VHYxZHIrQkk0WnNZbUYxLzJyblQvd0thUjZEbHp1SzlPdjFxQXpqYk5y?=
 =?utf-8?B?YzVXV2t1bFVBNXJtOVMwMDRpNTlGUHBCSTFBSlhvcDlHNGNUeXk5dXhIeEs2?=
 =?utf-8?B?Qy9yTk15ajYyZENRTkw4VUhHNk5BNDFmS2JONURFS01QbEZDdHhGQWpseEpn?=
 =?utf-8?B?LzBURnVYNFMzT2Viam1YMzl6dUlNSklnUXFhVGpEQXdIVkg0YzUvT3g5cjdy?=
 =?utf-8?B?c2ZZcVpvZlptbXVUbzRYNTlTeksxd1BzQjFvcENLaXcyVXpPaEJqb0E3Mzds?=
 =?utf-8?B?NHZPTWs4MUwrYXd5WUF3ZUlqQW1Ob1ZJaGRycEtnU21VejlVWERlZlpTVStO?=
 =?utf-8?B?UDVZV2QrNkZOV2lqdEwvME9rV3hGNXZ6WFg3cFZvS1NUUTFZMTZDWnArQSta?=
 =?utf-8?B?K25iY0tZaVJTU3FURW1QZmZUNUpTTE9uUXRwMUJVQ1NESVFlVlkyZTBEYVMx?=
 =?utf-8?B?NW11ZllNSzJXeUR0aS9zYk5lOTF5UkdYKzhlL1hyWWVSQ2VUSkVhSmpWVVZX?=
 =?utf-8?B?OW9qandQOWZ1NzhiOTZTaENQWFJGcEVzME4yWFI5dk5TeEg4QXA4Z0treWx3?=
 =?utf-8?B?STcvOWgzYkdmUWVnbGFjd2gzY294MG55RUFlUGs4TGJQUHIzQ3d2RkNhajNY?=
 =?utf-8?B?Sjl1YVpoUUJaMTcwaWZLM29MZlVjUzlJT0VBbTVDMllWSFBKMnNPbmRvVXZy?=
 =?utf-8?B?SzlSRjJ6ZzFiWE9UdTRJOS9EQTdFV2FqUEhTM2UxeWFzYUN2cE9qN2RtTkZn?=
 =?utf-8?B?QnZ6bWRpWEU3ZHhiYUh5TkpjSTRYKzErZHE3Qmx2cncrWnZrZDJpR1hQa2s0?=
 =?utf-8?B?b0w2K0t2NldCcHRIVzVIN0FxZm1INVl0a05WbnJvaVJSQmIzdG1yd0FzVWVU?=
 =?utf-8?B?R1JwcnlCYkp6bmw4a3pTTFFFaTQrT0N5OVg2bjI0RW5OMnVWbGFEQ3ZScTBj?=
 =?utf-8?B?RGRHQTJDazVjWS94VUN0M2tRaG1Wd0xpQUtmYmpVWlVQVUt2bGdEUFByQ2Jh?=
 =?utf-8?B?MHBsTjBGWVVSK2NKQ0xXc1h6KzJwWHpOUi9XajBOSHFFMGJvZzMwK3Vpdyto?=
 =?utf-8?B?RjFUTlI2V2I1bGVvRXFkakpwV2JzZjdVaGRIOGVEa3Z1WFJXcGZGVG1GYzUz?=
 =?utf-8?B?L3JJOEJqbmF0ZWNYaW5VcUU3emdOdGVzdmh1SFBISFh6Nm51Yld0OXo5YU1S?=
 =?utf-8?B?QkhES3ZXdUFDWDZFVFRHNERtazl2Q0h4Z2Fyc1B6WFZ4SHIySFQyWE5TaWdN?=
 =?utf-8?B?RUVTWDVpdlFoTzRzYk5IUitSdndzV1Axc0pWalo4MzhXT1dxcFhJa3FSU2xF?=
 =?utf-8?B?U093c05ZWURwYkQwSmdjZjdiUEtnM3ArYkhZRDllM2grdTE4NFBkdlkxM0tB?=
 =?utf-8?B?aDNyQWJLOFNEREx4U2RndzlWWFlUZzUrbGFWdXI3Q0MxYmg2eHJydnhUZFBV?=
 =?utf-8?B?Y2FBaUNHMjE4RWJCVlk3MTN3bEExeXRIbWNsNnFYcTN1VVc0TkFmZy9adm1J?=
 =?utf-8?B?SHM2b3dBUVRscVZnMko5ZFhMLzdITm9iWjd4aCs3aXVQZFVLaVluS0xvUFNh?=
 =?utf-8?B?NGYzamxaNHVmS0hkcGFGQzlrWkhNcTBkQkVOS0NCTEY2MHE3NjdPOWNtc0l3?=
 =?utf-8?B?OWFia041bVZLMWIyQW9YZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGc2a0E3ZU1IMXpvaXlQTkhiRE1Yd3BCbkdaMFNUdnk0N3lhV01YMWMzSGln?=
 =?utf-8?B?ZEd5UnBvbVB3NUhDbHpaNGNnYVZMTURGaWp5bFhtdEcyUTYzZWF2azc0SUph?=
 =?utf-8?B?THZnTjVvUXdVaGQ4RmJaY0RnTG82ZkVFZFU1eVJtRGlHU1IrMVNCZXYrTTVS?=
 =?utf-8?B?Si8ySTZ0ZStqNlVRTWNSSlMvRW1QNlk2cysyV2ErenFHVkhNNnBBbHQ1bzBl?=
 =?utf-8?B?RkE4bVlJUGs0N1lWWTRwTnk2V2kzNkxjS0p5YWVvSUNFcFAzRmlhYzFBOWpm?=
 =?utf-8?B?aU50UVU2NkxTZDg4Ly9GQTYzbE1BblprRG9RQ1pITDJDeHZBZmM0bmZDUlhm?=
 =?utf-8?B?Qm9ITVo5STRobC9JSTU2TkpUUkowMGUxcVhlRSt1YlY5N1VnZU1TdjJsVXQw?=
 =?utf-8?B?bDd5ckZqUFZUUTYza0ZKckI4TGM0UmJ2d0tnMmVSejhIRVpBRWhkQ1M1TEVl?=
 =?utf-8?B?Q0FvemJCQ2taNDF2QzVZbjREb2p6UnN2N0g2QjF6SzFPWUxPa2R3UFhIb1BY?=
 =?utf-8?B?WHBTVnozNDdqd1E3RDVmZkIyZGU1S1VEenpmUW1GU1JUam9sUTh0blp5c3Vy?=
 =?utf-8?B?K1ZuQmg2NUJiN2RIbnBQOWJnSUZRcVVDcEpoYkFqQlVlRWV0dlRWeTMxanJD?=
 =?utf-8?B?bzZCUjUyMGNsc1FLV1JJUUZYYWJJbU9mTkdWcVE3NHYwalVKajZtYXY4Z0Rt?=
 =?utf-8?B?aVEwRytJRGRWMVBaTk9yMGoyRlZ3cmszYzl4ZmVpVURDRWd1MlNHNWg4VVpY?=
 =?utf-8?B?M200N0w2SWJZZUMwK04zWVNEWUVwUVRvNVdUQXRMdXJzT0o2MVZXTTVyTlpU?=
 =?utf-8?B?eFdEMFFsdmVXSWs5NmlHY1k3V3NYc0p1bldpazRycHl6Kzk1SEkwMk9rVlRO?=
 =?utf-8?B?UTNwV0Q4L3N1dFZ1UzQvSUhKd3JEak1zbGZORnZHSEJWREQwUXNyYTZvVSsx?=
 =?utf-8?B?MVB6b05YczcybVdnZGNRV0N3QW5PNlZuRUNOb3ZiZUdqblBUWDBkNEtpbXZ5?=
 =?utf-8?B?d3owK3lUblhkODZ0eHk3YW1aZGNDK0E5WGk3enlNemNWSm1Jb0lKajh2eHVT?=
 =?utf-8?B?U1RvWWZ0Q0ZoRWFIT0J6UUpJaE90T0ZpV2lUNEN4elZPRDBoWU1IWnVVR0hQ?=
 =?utf-8?B?N3ppL3hwK1hGamRoRXZtVlVFMlIvRUhZcFpYNVNxR1JKaGhFSWNQQitDZFVY?=
 =?utf-8?B?bFBJOTgreXVIbzZmSXNrcTlVM050a0FJRG50WFZqL1ZmQ3BYVU5VdmxzdUZN?=
 =?utf-8?B?TTBFNDdSRlg5RDJ4VFNIeHE0aU82VEdRYnE5NlFMT0VMV1cwVkZ4Um9GTnVz?=
 =?utf-8?B?MHZ2cG4zM3FQSmpqVzRYYkY1ZmZQczUxYnM3MmlVRVBURjB3Sk1WMXJWOFRl?=
 =?utf-8?B?ZzI3V01yMjNJRVJyeElMb0Z4cEQvV1A2ZHpmSmlma2xROXpXdGIxNk8zSWk4?=
 =?utf-8?B?TTk4Y0gwTU4xMHczL2FCZVMwUHBMUDVNWTBtUitLc211ajJSclYwbDV4QXRB?=
 =?utf-8?B?TnhwV1RZWkRBajRnczBTOVhnUEhBMTVzY3dkaDVOd0N2Zzk1eVp1ZVBsb0U5?=
 =?utf-8?B?Y3ZJZnowSExqYThJWGx2UDBGT3FQdzhpZkhBWGpNM1VJLzlIYVhEeG9YZE1J?=
 =?utf-8?B?VFF4VHBuYUdUNDYvbnVMalNmTnphNGpKWUdiU2pkS2dZZmdsejBpYXlvOHps?=
 =?utf-8?B?NzJXeWpmZDRrMWh5YmpDUWpUWDRRMmhNTXBibmoySnJ2MExxS3BHaEs3UHBa?=
 =?utf-8?B?Y3RlU0tNc3d2dVFRQ0xvNVZtdExkekZpV3NkL1NQeVdHV1lLVENKVEtSMzBs?=
 =?utf-8?B?T0czZ2NKZ1E4Wi9GZjI1TnVmaFR5TCtPbVREZHp5em1vbEMwSnlSTlZwb0Ru?=
 =?utf-8?B?R0FHcUxUR1dtdEpBc3Awam9QM2lCblRWZFVjVWxzdzJ5ZUtMbUJKMTFvNHpK?=
 =?utf-8?B?SHFGRXJwaWpnRXZLbXgwT2cvbEVrY3BXOEJDODNkOVdCb2VNcERlUHRLNWpI?=
 =?utf-8?B?SGtzTDJzZGVheXIrVEVzdVVDcFNuL3dIUU15eXpJaUs5UWtCbzJHT2hzN3h5?=
 =?utf-8?B?YW5za0xFNmgydGZtdEp0enBuM0NFeHJhNTA0K1d6U0liUi81SmxrbmNtWVA2?=
 =?utf-8?Q?AQlxcAHD3v6nfxVuxzu8ahe3t?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2adc330d-b87b-4863-2101-08dd5f81a1df
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 03:14:13.7920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGEbF4PUdoS6VufvjRcbE5hVcgIHe9DB7TNM1flt86UjF0YA1GpZU51Js7KlkG7FbZij1gMcV7LdXu/svFcm+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
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

--------------0DaFofE0s2OqS4xWUgKWs35f
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

These failures are unrelated to the patch. Merging this.

Thanks,
Karthik.B.S

On 3/6/2025 4:55 PM, Patchwork wrote:

> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/kms_fbc_dirty_rect: fix the log level in fbc 
> enabled check
> *URL:* 	https://patchwork.freedesktop.org/series/145841/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/index.html
>
>
>   CI Bug Log - changes from XEIGT_8262_full -> XEIGTPW_12709_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_12709_full absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12709_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12709_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html>
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         +1 other test abort
>  *
>
>     igt@kms_vblank@wait-forked-busy-hang@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_vblank@wait-forked-busy-hang@pipe-d-dp-4.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_vblank@wait-forked-busy-hang:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_vblank@wait-forked-busy-hang.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_vblank@wait-forked-busy-hang.html>
>  *
>
>     igt@xe_eudebug_sriov@deny-eudebug:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_eudebug_sriov@deny-eudebug.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_eudebug_sriov@deny-eudebug.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-userptr:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html>
>         (Intel XE#4268
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_pm@s4-vm-bind-userptr.html>
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8262_full and 
> XEIGTPW_12709_full:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@xe_exec_atomic:
>
>       o Statuses : 1 incomplete(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@xe_oa@buffer-size@rcs-0-128m:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.85] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_12709_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@hotreplug:
>
>       o shard-lnl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@core_hotunplug@hotreplug.html>
>         (Intel XE#3914
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html>
>         (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3
>         other tests fail
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html>
>         (Intel XE#2550
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550> /
>         Intel XE#3767
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767>)
>         +15 other tests skip
>  *
>
>     igt@kms_async_flips@test-cursor-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_async_flips@test-cursor-atomic.html>
>         (Intel XE#664
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/664>)
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658>)
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +4
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#1477
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477>)
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>         +16 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +9
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>         +20 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +43
>         other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>         +15 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>         +220 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +5
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +21
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html>
>         (Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_cdclk@mode-transition.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +9
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +9
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +7
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +3
>         other tests fail
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_content_protection@legacy.html>
>         (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_content_protection@mei-interface.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_content_protection@mei-interface.html>
>         (Intel XE#1468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468>)
>  *
>
>     igt@kms_content_protection@uevent@pipe-a-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +6
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
>       o shard-bmg: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-mst:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-mst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (Intel XE#4294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_dsc@dsc-with-formats:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_dsc@dsc-with-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>) +1
>         other test skip
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_feature_discovery@display-2x.html>
>         (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +8
>         other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +4
>         other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>)
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a2-dp2:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a2-dp2.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>)
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +3
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +2
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +5
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +4
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +4
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +17
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +2
>         other tests skip
>  *
>
>     igt@kms_force_connector_basic@force-edid:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@kms_force_connector_basic@force-edid.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +18
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>         +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +31 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +23
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#1469
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +29 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +19
>         other tests skip
>  *
>
>     igt@kms_getfb@getfb-reject-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#2502
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502>)
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_hdr@static-swap.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) +1
>         other test skip
>  *
>
>     igt@kms_joiner@basic-max-non-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_joiner@basic-max-non-joiner.html>
>         (Intel XE#4298
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_joiner@basic-max-non-joiner.html>
>         (Intel XE#4298
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298>)
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>)
>  *
>
>     igt@kms_plane_lowres@tiling-4:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_plane_lowres@tiling-4.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
>         (Intel XE#2566
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>         +20 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +9
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>         +14 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2505
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505>)
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2029
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html>
>         (Intel XE#2499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +7
>         other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#1128
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128>)
>  *
>
>     igt@kms_psr@fbc-pr-sprite-plane-move:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-plane-move.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@psr-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_psr@psr-dpms.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +10
>         other tests skip
>  *
>
>     igt@kms_psr@psr-primary-page-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>         +17 other tests skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_rotation_crc@primary-rotation-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +4
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +2
>         other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#4459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) +1
>         other test fail
>  *
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug@basic-close:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_eudebug@basic-close.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +7
>         other tests skip
>  *
>
>     igt@xe_eudebug@basic-connect:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@xe_eudebug@basic-connect.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>         +11 other tests skip
>  *
>
>     igt@xe_eudebug@discovery-empty:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>         +17 other tests skip
>  *
>
>     igt@xe_evict@evict-large-multi-vm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@xe_evict@evict-large-multi-vm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>  *
>
>     {igt@xe_exec_atomic} (NEW):
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@xe_exec_atomic.html>
>         (Intel XE#2594
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>         +11 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +25
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_mmap@pci-membarrier:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@xe_mmap@pci-membarrier.html>
>         (Intel XE#4045
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045>) +1
>         other test skip
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@xe_mmap@small-bar.html>
>         (Intel XE#586
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/586>)
>  *
>
>     igt@xe_noexec_ping_pong:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@xe_noexec_ping_pong.html>
>         (Intel XE#379
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/379>)
>  *
>
>     igt@xe_oa@syncs-ufence-wait-cfg:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +5
>         other tests skip
>  *
>
>     igt@xe_pat@pat-index-xe2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1
>         other test fail
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@s3-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@xe_pm@s3-basic.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_pm@s4-mocs.html>
>         (Intel XE#4268
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268>)
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#4268
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268>) +1
>         other test abort
>  *
>
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +3
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>) +1
>         other test skip
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#3342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>  *
>
>     igt@xe_sriov_flr@flr-vfs-parallel:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html>
>         (Intel XE#4273
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>
>
>         Possible fixes
>
>  *
>
>     igt@core_getversion@basic:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@core_getversion@basic.html>
>         (Intel XE#4284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4284>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@core_getversion@basic.html>
>  *
>
>     igt@fbdev@unaligned-write:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@fbdev@unaligned-write.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@fbdev@unaligned-write.html>
>  *
>
>     igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-6/igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
>         +118 other tests pass
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@blocking-wf_vblank@b-dp2:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-dp2.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-dp2.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>         +284 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         +15 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_cursor@viewport:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@kms_plane_cursor@viewport.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_plane_cursor@viewport.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html>
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@kms_vrr@negative-basic.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_vrr@negative-basic.html>
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_live_ktest@xe_bo.html>
>         +1 other test pass
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html>
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-7/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-4/igt@xe_module_load@load.html>)
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) ->
>         (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@xe_module_load@load.html>)
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-8/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html>)
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457>) ->
>         (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_module_load@load.html>)
>       o shard-dg2-set2: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@xe_module_load@load.html>)
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) ->
>         (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_module_load@load.html>)
>  *
>
>     igt@xe_module_load@reload-no-display:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@reload-no-display.html>
>         (Intel XE#4490
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4490>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_module_load@reload-no-display.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-atomic.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html>
>         (Intel XE#3768
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768>)
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>         +11 other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (Intel XE#3442
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-6.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-limited-range:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +14
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@kms_content_protection@uevent.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1
>         other test skip
>  *
>
>     igt@kms_dp_link_training@non-uhbr-mst:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-mst.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-mst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>) +1
>         other test skip
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#1135
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +2
>         other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-suspend:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +14
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +18
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +11
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +26
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +8
>         other tests skip
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (Intel XE#4328
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_pm_backlight@fade.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>         +13 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-no-drrs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +5
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +10
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@bad-tiling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +3
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) +1
>         other test skip
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_vrr@cmrr.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@kms_vrr@flipline.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_vrr@flipline.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +13
>         other tests skip
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0x369:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>         +16 other tests skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html>
>         (Intel XE#3889
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889>)
>  *
>
>     igt@xe_eudebug@discovery-race-sigint:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_eudebug@discovery-race-sigint.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_eudebug@discovery-race-sigint.html>
>         (Intel XE#4259
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +38
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +8
>         other tests skip
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s4-d3hot-basic-exec:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#4268
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268>) +2
>         other tests abort
>  *
>
>     igt@xe_query@multigpu-query-mem-usage:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_query@multigpu-query-mem-usage.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +5
>         other tests skip
>  *
>
>     igt@xe_sriov_auto_provisioning@exclusive-ranges:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_sriov_auto_provisioning@exclusive-ranges.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>) +1
>         other test skip
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#3342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>  *
>
>     igt@xe_sriov_scheduling@equal-throughput:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_sriov_scheduling@equal-throughput.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_sriov_scheduling@equal-throughput.html>
>         (Intel XE#4351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8262 -> IGTPW_12709
>
> IGTPW_12709: 12709
> IGT_8262: 8262
> xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c: 
> 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c
>
--------------0DaFofE0s2OqS4xWUgKWs35f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>These failures are unrelated to the patch. Merging this.</p>
    Thanks,<br>
    Karthik.B.S
    <p>On 3/6/2025 4:55 PM, Patchwork wrote:</p>
    <blockquote type=3D"cite" cite=3D"mid:174126035873.67188.12071413029782=
030897@64e06c682a23">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/kms_fbc_dirty_rect: fix the log level in fbc
              enabled check</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/145841/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/145841/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12709/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8262_full -&gt;
        XEIGTPW_12709_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_12709_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_12709_full, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_12709_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cur=
sor-busy-crc-legacy.html" moz-do-not-send=3D"true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_plane_scaling@inte=
l-max-src-size@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">ABORT</a> +1 =
other test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@wait-forked-busy-hang@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_vblank@wait-forked=
-busy-hang@pipe-d-dp-4.html" moz-do-not-send=3D"true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_vblank@wait-forked-busy-hang:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_vblank@wait-forked-busy-hang.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" mo=
z-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_vblank@wait-forked-=
busy-hang.html" moz-do-not-send=3D"true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_sriov@deny-eudebug:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_eudebug_sriov@deny-eudebug.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg=
2-464/igt@xe_eudebug_sriov@deny-eudebug.html" moz-do-not-send=3D"true">SKIP=
</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-userptr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html" moz-do-not-sen=
d=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4268" moz-do-not-send=3D"true">Intel XE#4268</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@x=
e_pm@s4-vm-bind-userptr.html" moz-do-not-send=3D"true">ABORT</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8262_full and
        XEIGTPW_12709_full:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@xe_exec_atomic:</p>
          <ul>
            <li>Statuses : 1 incomplete(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@buffer-size@rcs-0-128m:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.85] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_12709_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotreplug:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@core_hotunplug@hotreplug.html=
" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3914" moz-do-not-send=3D"true">Intel XE#3914</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-ed=
p-1-linear:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts@pipe-a-edp-1-linear.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html"=
 moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/911" moz-do-not-send=3D"true">Intel XE#911</a>) +3 =
other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hd=
mi-a-6-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_async_flips@async-=
flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2550" moz-do-not-send=3D"true">Intel XE#2550</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3767" moz-do-not-send=3D"tru=
e">Intel XE#3767</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-cursor-atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_async_flips@test-cursor-a=
tomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/664" moz-do-not-send=3D"true">Intel XE#6=
64</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_big_fb@4-tiled-8bp=
p-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">Int=
el XE#316</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-asyn=
c-flip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658" moz-=
do-not-send=3D"true">Intel XE#3658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE#=
2327</a>) +4 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send=3D"true">Intel XE#=
1407</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send=3D"true"=
>Intel XE#607</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_big_fb@y-tiled-add=
fb-size-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send=
=3D"true">Intel XE#607</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1477" moz-do-not-send=3D"true=
">Intel XE#1477</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_big_fb@yf-tiled-16=
bpp-rotate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">In=
tel XE#1124</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel X=
E#1124</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-a=
sync-flip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" m=
oz-do-not-send=3D"true">Intel XE#1124</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-2-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send=
=3D"true">Intel XE#2191</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=
=3D"true">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2894" moz-do-not-send=3D"true">Intel XE#2894</a>) +1 othe=
r test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_bw@connected-linea=
r-tiling-4-displays-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-no=
t-send=3D"true">Intel XE#2191</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_bw@linear-tiling-1=
-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"t=
rue">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_bw@linear-tiling-3-displa=
ys-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>) +3 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-send=3D"true">I=
ntel XE#1512</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true">=
Intel XE#2887</a>) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_ccs@bad-pixel-form=
at-yf-tiled-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">=
Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +43 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"tr=
ue">Intel XE#2887</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-d=
p-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_ccs@ccs-on-another=
-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" m=
oz-do-not-send=3D"true">Intel XE#787</a>) +220 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"tru=
e">Intel XE#3432</a>) +5 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"tru=
e">Intel XE#3432</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</=
p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-se=
nd=3D"true">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +21 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6=
:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc=
-ccs@pipe-c-hdmi-a-6.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html" moz-do-no=
t-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not=
-send=3D"true">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3124" moz-do-not-send=3D"true">Intel XE#3124</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_ccs@rando=
m-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send=3D"true">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" m=
oz-do-not-send=3D"true">Intel XE#1727</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3113" moz-do-not-send=3D"true">Intel XE#311=
3</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-=
a-2:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc@pipe-b-hdmi-a-2.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html" moz-=
do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3113" moz-do-not-send=3D"true">Intel XE#3113</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_cdclk@mode-transition.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2724" moz-do-not-send=3D"true">Intel XE#2724</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2325" moz-do-not-send=3D"true">Intel XE#2325</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D=
"true">Intel XE#2252</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_chamelium_hpd@vga-=
hpd.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373=
</a>) +9 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) +=
7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_content_protection=
@dp-mst-lic-type-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send=3D"tru=
e">Intel XE#307</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_content_protection@dp-mst=
-lic-type-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send=3D"true">Inte=
l XE#307</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_content_protection@dp-mst=
-lic-type-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2390" moz-do-not-send=3D"true">Int=
el XE#2390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_content_protection@legacy=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178<=
/a>) +3 other tests
              fail</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_content_protection@legacy=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3278" moz-do-not-send=3D"true">Intel XE#3278<=
/a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_content_protection@mei-in=
terface.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send=3D"true">Intel X=
E#2341</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_content_protection@mei-in=
terface.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1468" moz-do-not-send=3D"true">Intel X=
E#1468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_content_protection=
@uevent@pipe-a-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1188" moz-do-not-send=3D"t=
rue">Intel XE#1188</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_cursor_crc@cursor-onscree=
n-32x10.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel X=
E#2320</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-64x21.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send=3D"true">I=
ntel XE#1424</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_cursor_crc@cursor-=
sliding-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send=3D"true">=
Intel XE#308</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding=
-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel =
XE#2321</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding=
-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel =
XE#2321</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send=3D"true">In=
tel XE#309</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.ht=
ml" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_cursor_legacy@2x-flip=
-vs-cursor-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"tru=
e">Intel XE#2291</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:=
</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-434/igt@kms_cursor_legacy@2x-nonblocking-modes=
et-vs-cursor-atomic.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt=
@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/309" moz-do-not-send=3D"true">Intel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_cursor_legacy@curs=
ora-vs-flipb-atomic-transitions.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-no=
t-send=3D"true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-=
flipa-varying-size.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-sen=
d=3D"true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" mo=
z-do-not-send=3D"true">Intel XE#2286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1508" moz-do-not-send=3D"true">Intel XE#1508=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-mst:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_dp_link_training@non-uhbr=
-mst.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4354" moz-do-not-send=3D"true">Intel XE#4=
354</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_dp_link_training@non-uhbr=
-mst.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4354" moz-do-not-send=3D"true">Intel XE#4=
354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-=
fallback.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4294" moz-do-not-send=3D"true">Intel =
XE#4294</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_dsc@dsc-basic.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-formats:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_dsc@dsc-with-formats.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#2244</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:<=
/p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc=
-dirty-rectangle-different-formats.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-d=
o-not-send=3D"true">Intel XE#4422</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-s=
end=3D"true">Intel XE#4422</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-send=
=3D"true">Intel XE#4422</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_fbcon_fbt@psr.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/776" moz-do-not-send=3D"true">Intel XE#776</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_feature_discovery@display=
-2x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2373" moz-do-not-send=3D"true">Intel XE#23=
73</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_feature_discovery@display=
-4x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1138" moz-do-not-send=3D"true">Intel XE#11=
38</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank-interru=
ptible.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip@2x-ab=
solute-wf_vblank-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not=
-send=3D"true">Intel XE#310</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip@2x-flip-vs-dp=
ms-off-vs-modeset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send=3D"true=
">Intel XE#310</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a=
6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_flip@2x-flip-vs-ex=
pired-vblank-interruptible@bc-hdmi-a6-dp4.html" moz-do-not-send=3D"true">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
 moz-do-not-send=3D"true">Intel XE#301</a>) +8 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1421" moz-do-not-send=3D"true">Intel XE#1421</a=
>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate.htm=
l" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_flip@2x-plain-flip-f=
b-recreate.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send=3D"true">Intel=
 XE#886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a2-dp2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_flip@2x-plain-flip=
-fb-recreate@ab-hdmi-a2-dp2.html" moz-do-not-send=3D"true">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-se=
nd=3D"true">Intel XE#886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html" moz=
-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vbl=
ank.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/886" moz-do-not-send=3D"true">Intel XE#886=
</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not-send=3D"true=
">Intel XE#3321</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@b-edp1.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_flip@flip-v=
s-expired-vblank-interruptible@b-edp1.html" moz-do-not-send=3D"true">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz=
-do-not-send=3D"true">Intel XE#301</a>) +5 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html" =
moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_flip@flip-vs-expired-vbla=
nk@c-edp1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel =
XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3149" moz-do-not-send=3D"true">Intel XE#3149</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-u=
pscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" mo=
z-do-not-send=3D"true">Intel XE#2293</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#2380=
</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-u=
pscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2293" moz-do-not-send=3D"true">Intel XE#2293</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downsc=
aling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-d=
o-not-send=3D"true">Intel XE#1397</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#1745</a=
>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downsc=
aling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1397" moz-do-not-send=3D"true">Intel XE#1397</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rccc=
s-downscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/238=
0" moz-do-not-send=3D"true">Intel XE#2380</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upsc=
aling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip_scaled_crc@fl=
ip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +17 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rc=
ccs-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
1" moz-do-not-send=3D"true">Intel XE#1401</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE=
#1745</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rc=
ccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1401" moz-do-not-send=3D"true">Intel XE#1401</a>) +2 other=
 tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-edid:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@kms_force_connector_basic@for=
ce-edid.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send=3D"true">Intel XE=
#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_frontbuffer_tracki=
ng@drrs-indfb-scaledprimary.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-se=
nd=3D"true">Intel XE#651</a>) +18 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
-indfb-scaledprimary.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"t=
rue">Intel XE#651</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-no=
t-send=3D"true">Intel XE#4141</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-d=
o-not-send=3D"true">Intel XE#2312</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt=
@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656" moz-do-not-send=3D"true">Intel XE#656</a>) +4 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-dra=
w-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" m=
oz-do-not-send=3D"true">Intel XE#2311</a>) +31 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-dra=
w-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do=
-not-send=3D"true">Intel XE#656</a>) +23 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1469" moz-do-not-send=3D"true">In=
tel XE#1469</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2352" moz-do-not-send=3D"true">In=
tel XE#2352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw=
-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz=
-do-not-send=3D"true">Intel XE#2313</a>) +29 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-b=
lt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" mo=
z-do-not-send=3D"true">Intel XE#656</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_frontbuffer_tracki=
ng@fbcpsr-slowdraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"tru=
e">Intel XE#653</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb-reject-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_getfb@getfb-reject-ccs.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2502" moz-do-not-send=3D"true">Intel XE#2502</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_hdr@static-swap.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>) +1 ot=
her test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-max-non-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_joiner@basic-max-n=
on-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4298" moz-do-not-send=3D"true">Intel=
 XE#4298</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@kms_joiner@basic-max-non-join=
er.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4298" moz-do-not-send=3D"true">Intel XE#429=
8</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send=3D"true">Inte=
l XE#2927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_plane_cursor@overl=
ay@pipe-a-hdmi-a-6-size-64.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-sen=
d=3D"true">Intel XE#616</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-4:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_plane_lowres@tiling-4.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/599" moz-do-not-send=3D"true">Intel XE#599</a>) +=
3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_plane_scaling@inte=
l-max-src-size@pipe-a-dp-4.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566" moz-do-=
not-send=3D"true">Intel XE#2566</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-f=
ormat@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_plane_scaling@plan=
e-downscale-factor-0-25-with-pixel-format@pipe-b.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2763" moz-do-not-send=3D"true">Intel XE#2763</a>) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-fac=
tor-0-25@pipe-d:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_plane_scaling@plan=
es-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2763" moz-do-not-send=3D"true">Intel XE#2763</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true=
">Intel XE#455</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-fac=
tor-0-5:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz=
-do-not-send=3D"true">Intel XE#2763</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-fac=
tor-0-5@pipe-c:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5@pipe-c.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
63" moz-do-not-send=3D"true">Intel XE#2763</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_pm_backlight@brightness-w=
ith-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2938" moz-do-not-send=3D"true">Intel =
XE#2938</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_pm_backlight@brigh=
tness-with-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2938" moz-do-not-send=3D"true"=
>Intel XE#2938</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_pm_backlight@fade-=
with-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send=3D"true">Int=
el XE#870</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_pm_backlight@fade-with-su=
spend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send=3D"true">Intel XE#8=
70</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1129" moz-do-not-send=3D"true">Intel XE#1129</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2505" moz-do-not-send=3D"true">Intel XE#2505</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html" moz=
-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2029" moz-do-not-send=3D"true">Intel XE#2029</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2499" moz-do-not-send=3D"true">Intel XE#2499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</=
p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-se=
nd=3D"true">Intel XE#1489</a>) +7 other tests
              skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-o=
verlay-primary-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do=
-not-send=3D"true">Intel XE#1489</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-s=
f:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-no=
t-send=3D"true">Intel XE#2893</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_psr2_su@page_flip-nv12.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2387" moz-do-not-send=3D"true">Intel XE#2387</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1128" moz-do-not-send=3D"true">Intel XE#1128</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-plane-m=
ove.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#14=
06</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_psr@psr-dpms.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-=
not-send=3D"true">Intel XE#929</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-primary-page-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_psr@psr-primary-page-flip=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#2234<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" =
moz-do-not-send=3D"true">Intel XE#2850</a>) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_psr_stress_t=
est@invalidate-primary-flip-overlay.html" moz-do-not-send=3D"true">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"=
 moz-do-not-send=3D"true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_rotation_crc@primary-rota=
tion-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Intel X=
E#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3904" moz-do-not-send=3D"true">Intel XE#3904</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_rotation_crc@sprit=
e-rotation-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">=
Intel XE#3414</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_rotation_crc@sprite-rotat=
ion-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Intel X=
E#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3904" moz-do-not-send=3D"true">Intel XE#3904</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_tiled_display@basic-test-=
pattern.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send=3D"true">Intel X=
E#2426</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@kms_vrr@cmrr.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2168" moz-do-not-send=3D"true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-se=
nd=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12709/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not=
-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4459" moz-do-not-send=3D"true">Intel XE#4459</a>) +1 other tes=
t
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vr=
r.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499=
</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vr=
r.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_writeback@writebac=
k-fb-id-xrgb2101010.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"tr=
ue">Intel XE#756</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@kms_writeback@writeback-fb-id=
-xrgb2101010.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Int=
el XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@kms_writeback@writeback-pixel=
-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel X=
E#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_cl=
ass_compute:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_compute_preempt@com=
pute-preempt@engine-drm_xe_engine_class_compute.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1280" moz-do-not-send=3D"true">Intel XE#1280</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Inte=
l XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_copy_basic@mem-copy=
-linear-0xfd.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send=3D"true">In=
tel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_copy_basic@mem-set-=
linear-0xfffe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send=3D"true">I=
ntel XE#1126</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-close:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_eudebug@basic-close=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905" moz-do-not-send=3D"true">Intel XE#2905<=
/a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-connect:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@xe_eudebug@basic-connect.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2905" moz-do-not-send=3D"true">Intel XE#2905</a>) =
+11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-empty:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_eudebug@discovery-empty.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2905" moz-do-not-send=3D"true">Intel XE#2905</a>=
) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@xe_evict@evict-large-multi-vm=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel XE#688</a=
>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>{igt@xe_exec_atomic} (NEW):</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@xe_exec_atomic.html" moz-do-n=
ot-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2594" moz-do-not-send=3D"true">Intel XE#2594</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer=
-bind:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues=
-many-vm-basic-defer-bind.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432=
/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true">Intel XE#1392</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=3D"true"=
>Intel XE#2322</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"=
true">Intel XE#1392</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p=
>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_exec_basic@multigpu=
-no-exec-userptr-invalidate-race.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-=
not-send=3D"true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_exec_fault_mode@twi=
ce-userptr-prefetch.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"tr=
ue">Intel XE#288</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_exec_mix_modes@exec=
-spinner-interrupted-lr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360" moz-do-not-send=
=3D"true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@pci-membarrier:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@xe_mmap@pci-membarrier.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4045" moz-do-not-send=3D"true">Intel XE#4045</a>) +1=
 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-7/igt@xe_mmap@small-bar.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/586" moz-do-not-send=3D"true">Intel XE#586</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_noexec_ping_pong:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@xe_noexec_ping_pong.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/379" moz-do-not-send=3D"true">Intel XE#379</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@xe_oa@syncs-ufence-wai=
t-cfg.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send=3D"true">Intel XE#=
2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
573" moz-do-not-send=3D"true">Intel XE#3573</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xe2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_pat@pat-index-xe2.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/977" moz-do-not-send=3D"true">Intel XE#977</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_peer2peer@write@wri=
te-gpua-vram01-gpub-system-p2p.html" moz-do-not-send=3D"true">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173" moz-do-no=
t-send=3D"true">Intel XE#1173</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@xe_pm@s3-basic.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/584" moz-do-not-send=3D"true">Intel XE#584</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_pm@s4-mocs.html" moz-do-no=
t-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4268" moz-do-not-send=3D"true">Intel XE#4268</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbin=
d-all.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4268" moz-do-not-send=3D"true">Intel XE=
#4268</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Int=
el XE#944</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@xe_query@multigpu-query-inval=
id-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE=
#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase=
-numvfs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz=
-do-not-send=3D"true">Intel XE#4130</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz=
-do-not-send=3D"true">Intel XE#4130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-n=
umvfs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_sriov_auto_provisio=
ning@selfconfig-reprovision-reduce-numvfs.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130=
" moz-do-not-send=3D"true">Intel XE#4130</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vf1-clear:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3342" moz-do-not-send=3D"true">Intel XE#3342</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4273" moz-do-not-send=3D"true">Intel XE#4273<=
/a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@core_getversion@basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@core_getversion@basic.html" moz-do-not=
-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4284" moz-do-not-send=3D"true">Intel XE#4284</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/ig=
t@core_getversion@basic.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@unaligned-write:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@fbdev@unaligned-write.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2134" moz-do-not-send=3D"true">Intel XE#2134</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/ig=
t@fbdev@unaligned-write.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-lnl-6/igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1.h=
tml" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#32=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
09/shard-lnl-3/igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1.html" moz-do=
-not-send=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking-fenci=
ng:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_atomic_transition@modeset-transiti=
on-nonblocking-fencing.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=
=3D"true">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-4=
33/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html" m=
oz-do-not-send=3D"true">PASS</a> +118 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-si=
ze.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"true">Intel XE#229=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
09/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html" mo=
z-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-ato=
mic-transitions-varying-size.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-s=
end=3D"true">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-f=
lipb-atomic-transitions-varying-size.html" moz-do-not-send=3D"true">PASS</a=
> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hd=
mi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank=
-interruptible@ab-hdmi-a6-dp4.html" moz-do-not-send=3D"true">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not=
-send=3D"true">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolut=
e-wf_vblank-interruptible@ab-hdmi-a6-dp4.html" moz-do-not-send=3D"true">PAS=
S</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg=
-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send=3D"true">P=
ASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3.ht=
ml" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2049" moz-do-not-send=3D"true">Intel XE#20=
49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
709/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3.html" moz-do=
-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-dp2.html" moz-d=
o-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2882" moz-do-not-send=3D"true">Intel XE#2882</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4=
/igt@kms_flip@blocking-wf_vblank@b-dp2.html" moz-do-not-send=3D"true">PASS<=
/a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downsc=
aling:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-t=
o-64bpp-4tile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-se=
nd=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp=
-4tile-to-64bpp-4tile-downscaling.html" moz-do-not-send=3D"true">PASS</a> +=
284 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-se=
nd=3D"true">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2=
-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.ht=
ml" moz-do-not-send=3D"true">PASS</a> +15 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:=
</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-indfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D"tr=
ue">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12709/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscr=
n-indfb-plflip-blt.html" moz-do-not-send=3D"true">PASS</a> +1 other test pa=
ss</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@viewport:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-434/igt@kms_plane_cursor@viewport.html" moz-do=
-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/616" moz-do-not-send=3D"true">Intel XE#616</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/=
igt@kms_plane_cursor@viewport.html" moz-do-not-send=3D"true">PASS</a> +1 ot=
her test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html" moz-do-not-send=3D"t=
rue">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/718" moz-do-not-send=3D"true">Intel XE#718</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-5/igt@kms_pm_dc@dc=
5-dpms.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealin=
g.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"true">Intel XE#1435=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1270=
9/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html" moz-=
do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-464/igt@kms_vrr@negative-basic.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt=
@kms_vrr@negative-basic.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-inv=
alidate-race:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues=
-many-vm-userptr-invalidate-race.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-=
not-send=3D"true">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_exec_basic@multigpu-m=
any-execqueues-many-vm-userptr-invalidate-race.html" moz-do-not-send=3D"tru=
e">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_live_ktest@xe_bo.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2229" moz-do-not-send=3D"true">Intel XE#2229</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"t=
rue">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12709/shard-dg2-464/igt@xe_live_ktest@xe_bo.html" moz-do-not-s=
end=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kun=
it.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2229" moz-do-not-send=3D"true">Intel XE#222=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
09/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html" moz-do-=
not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-lnl: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8262/shard-lnl-3/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
262/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-l=
nl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-8/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-1/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-8/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8262/shard-lnl-1/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8262/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_826=
2/shard-lnl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl=
-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-5/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-5/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-5/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8262/shard-lnl-7/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8262/shard-lnl-3/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/=
shard-lnl-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-7=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-3/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-7/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-6/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8262/shard-lnl-6/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8262/shard-lnl-6/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/=
shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-4=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-4/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-lnl-4/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#3=
78</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2709/shard-lnl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/sha=
rd-lnl-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-6/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12709/shard-lnl-8/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12709/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12709/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1270=
9/shard-lnl-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-=
lnl-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-4/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@xe_module_load=
@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-1/igt@xe_module_load@load.ht=
ml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12709/shard-lnl-4/igt@xe_module_load@load.html" moz-=
do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12709/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12709/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2709/shard-lnl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/sha=
rd-lnl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-3/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-lnl-7/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>)</li>
            <li>shard-bmg: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8262/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
262/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-b=
mg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-8/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-2/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-8/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8262/shard-bmg-2/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_826=
2/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg=
-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-8/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-8/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/=
shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-4/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2457" moz-do-not-send=3D"true">Intel XE#2457</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shar=
d-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/=
igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@xe_module_lo=
ad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_module_load@load.=
html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12709/shard-bmg-2/igt@xe_module_load@load.html" mo=
z-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not=
-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12709/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12709/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/s=
hard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg=
-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-4/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12709/shard-bmg-8/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12709/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12709/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1270=
9/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>)</li>
            <li>shard-dg2-set2: (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGT_8262/shard-dg2-432/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8262/shard-dg2-434/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_826=
2/shard-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"true">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-d=
g2-463/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@xe_modu=
le_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-432/igt@xe_module_load@l=
oad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8262/shard-dg2-463/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8262/shard-dg2-432/igt@xe_module_load@load.html" moz-do-n=
ot-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8262/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=3D"true"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/sh=
ard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-4=
33/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_l=
oad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt@xe_module_load@load.=
html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html" moz=
-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8262/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262=
/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg=
2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-464/igt=
@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-463/igt@xe_modul=
e_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-dg2-463/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8262/shard-dg2-434/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8262/shard-dg2-434/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#378</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/i=
gt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@xe_=
module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@load.h=
tml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@load.html" m=
oz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12709/shard-dg2-432/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12709/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-se=
nd=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12709/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-send=3D"=
true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12709/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-send=3D"true">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/=
shard-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-=
dg2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-43=
4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt=
@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_mo=
dule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-433/igt@xe_module_l=
oad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_module_load@load.htm=
l" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_module_load@load.html" moz=
-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12709/shard-dg2-434/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12709/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12709/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
709/shard-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/sh=
ard-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg=
2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload-no-display:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_module_load@reload-no-display.html"=
 moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4490" moz-do-not-send=3D"true">Intel XE#4490</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard=
-dg2-432/igt@xe_module_load@reload-no-display.html" moz-do-not-send=3D"true=
">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-ato=
mic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#42=
08</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2575" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_async_flip=
s@invalid-async-flip-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768" moz-do-not-s=
end=3D"true">Intel XE#3768</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2351" moz-do-not-send=3D"true">Intel XE#2351</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-d=
o-not-send=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_big_fb@linear-16bp=
p-rotate-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">Inte=
l XE#316</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/sha=
rd-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/316" moz-do-not-send=3D"true">Intel XE#316</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-asyn=
c-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp=
-rotate-0-hflip-async-flip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-se=
nd=3D"true">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2=
-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#1124</a=
>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</=
p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp=
-rotate-180-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"tru=
e">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12709/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-=
rotate-180-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true=
">Intel XE#1124</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-1920x1=
080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_bw@linear=
-tiling-4-displays-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-=
send=3D"true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-=
a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-yf-ti=
led-ccs@pipe-d-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=
=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/=
igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +3 othe=
r tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-ln=
l-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12709/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3442" moz-do-not-send=3D"true">Intel XE#3442</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-6:</=
p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-cc=
s@pipe-d-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true=
">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12709/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@p=
ipe-d-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">I=
ntel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen=
12-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send=3D"true">Intel=
 XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_ccs@=
missing-ccs-buffer-y-tiled-gen12-mc-ccs.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" m=
oz-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</=
a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-cc=
s.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1270=
9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907" moz-do-not-send=3D"true">Intel XE#2907</a>) +4 other te=
sts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc=
-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2709/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-se=
nd=3D"true">Intel XE#787</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-limited-range:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/257=
5" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_chamelium_colo=
r@ctm-limited-range.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"tr=
ue">Intel XE#306</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-n=
ot-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) =
+14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-434/igt@kms_content_protect=
ion@dp-mst-type-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send=3D"true=
">Intel XE#307</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-464/igt@kms_content_protection@uevent.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-=
432/igt@kms_content_protection@uevent.html" moz-do-not-send=3D"true">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188" mo=
z-do-not-send=3D"true">Intel XE#1188</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/25=
75" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_cursor_crc@cu=
rsor-onscreen-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send=3D"=
true">Intel XE#308</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-le=
gacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_cursor_le=
gacy@2x-cursor-vs-flip-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-=
send=3D"true">Intel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p=
>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-befo=
re-cursor-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true=
">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt=
@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/323" moz-do-not-send=3D"true">Intel XE#323</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-mst:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-mst.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" m=
oz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_dp_link_training@n=
on-uhbr-mst.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4354" moz-do-not-send=3D"true">Int=
el XE#4354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle=
-dirtyfb-tests.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">=
Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12709/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dir=
tyfb-tests.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-send=3D"true">Inte=
l XE#4422</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_feature_discovery@psr2.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-n=
ot-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_feature_discovery@psr2.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1135" moz-do-not-send=3D"true">Intel XE#1135</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblan=
k.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip@2x-bloc=
king-absolute-wf_vblank.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send=
=3D"true">Intel XE#310</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interrupti=
ble.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3321" moz-do-not-send=3D"true">Intel XE#33=
21</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
709/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>)</l=
i>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-int=
erruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send=3D"true">Intel=
 XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12709/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel XE#301</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz=
-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip@flip-vs-expired=
-vblank.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel XE=
#301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downsc=
aling:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-t=
o-32bpp-ytile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-se=
nd=3D"true">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2=
-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) =
+2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rc=
ccs-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-t=
o-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do=
-not-send=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_flip_scaled_crc@fli=
p-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455" moz-do-not-send=3D"true">Intel XE#455</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-r=
ender:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr=
-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"tr=
ue">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscr=
n-spr-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=
=3D"true">Intel XE#2312</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-m=
map-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri=
-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"t=
rue">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12709/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-se=
nd=3D"true">Intel XE#2311</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-r=
ender:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scnds=
crn-pri-shrfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-sen=
d=3D"true">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-no=
t-send=3D"true">Intel XE#656</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351" moz-do-not-send=3D"true">Intel XE#2351</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" m=
oz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_frontbuffer_tr=
acking@drrs-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"tr=
ue">Intel XE#651</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indf=
b-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"true">In=
tel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb=
-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Int=
el XE#2312</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indf=
b-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">In=
tel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12709/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb=
-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"true">Int=
el XE#4141</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rt=
e.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1270=
9/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651" moz-do-not-send=3D"true">Intel XE#651</a>) +18 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-dra=
w-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-sc=
ndscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not=
-send=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" =
moz-do-not-send=3D"true">Intel XE#656</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-=
blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-sc=
ndscrn-shrfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send=
=3D"true">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/656" moz-do-not-send=3D"true">Intel XE#656</a>) +6 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-ono=
ff:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-sc=
ndscrn-spr-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D=
"true">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-=
scndscrn-spr-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-sen=
d=3D"true">Intel XE#651</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move=
:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-c=
ur-indfb-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">I=
ntel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12709/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-c=
ur-indfb-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">I=
ntel XE#2313</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scn=
dscrn-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-sen=
d=3D"true">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12709/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not=
-send=3D"true">Intel XE#653</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling=
-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351" moz-do-not-send=3D"true">Intel XE#235=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt@kms_frontbuffer=
_tracking@fbcpsr-tiling-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-sen=
d=3D"true">Intel XE#653</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primsc=
rn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-se=
nd=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-=
not-send=3D"true">Intel XE#653</a>) +26 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8262/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indf=
b-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">In=
tel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12709/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb=
-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Int=
el XE#2312</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:=
</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primsc=
rn-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"tr=
ue">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12709/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscr=
n-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D"tru=
e">Intel XE#656</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/=
shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346" moz-do-not-send=3D"true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-big-j=
oiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12709/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4328" moz-do-not-send=3D"true">Intel XE#4328</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra=
-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12709/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2925" moz-do-not-send=3D"true">Intel XE#2925</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scali=
ng:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-fac=
tor-0-25-unity-scaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=
=3D"true">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-4=
64/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2763" moz-do-not-send=3D"true">Intel XE#2763</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-no=
t-send=3D"true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_pm_backlight@fade.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/ig=
t@kms_pm_backlight@fade.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send=
=3D"true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2351" moz-do-not-send=3D"true">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"tr=
ue">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12709/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1129" moz-do-not-send=3D"true">Intel XE#1129</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/igt=
@kms_pm_dc@deep-pkgc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/908" moz-do-not-send=3D"t=
rue">Intel XE#908</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-=
464/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836" moz-d=
o-not-send=3D"true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-upd=
ate-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12709/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update=
-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">In=
tel XE#1489</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-no-drrs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351" moz-do-not-send=3D"true">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-se=
nd=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-n=
ot-send=3D"true">Intel XE#929</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg=
2-432/igt@kms_psr@fbc-psr-sprite-render.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" =
moz-do-not-send=3D"true">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D"true">Intel XE#929=
</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-tiling:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-=
not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Intel XE#3414</=
a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-refle=
ct-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_rotatio=
n_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do=
-not-send=3D"true">Intel XE#1127</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-=
do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12709/shard-dg2-464/igt@kms_tv_load_detect@load-d=
etect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/330" moz-do-not-send=3D"true">Intel XE#3=
30</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_vrr@cmrr.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send=3D"tru=
e">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12709/shard-dg2-464/igt@kms_vrr@cmrr.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
168" moz-do-not-send=3D"true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@kms_vrr@flipline.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send=3D=
"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12709/shard-dg2-433/igt@kms_vrr@flipline.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-eac=
h-numvfs-all.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">In=
tel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-463/igt@sriov=
_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1091" moz-do-not-send=3D"true">Intel XE#1091</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send=3D"true">Intel=
 XE#2849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/sha=
rd-dg2-464/igt@xe_compute_preempt@compute-preempt.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1280" moz-do-not-send=3D"true">Intel XE#1280</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">In=
tel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/sha=
rd-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1126" moz-do-not-send=3D"true">Intel XE#1126</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-parameters:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/=
shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905" moz-do-not-send=3D"true">Intel XE#2905</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint=
-client.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12709/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3889" moz-do-not-send=3D"true">Intel XE#3889</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-race-sigint:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_eudebug@discovery-race-sigint.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard=
-dg2-434/igt@xe_eudebug@discovery-race-sigint.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4259" moz-do-not-send=3D"true">Intel XE#4259</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexe=
cqueue.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12709/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true">Intel XE#1392</a>) +=
2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userpt=
r-fault.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12709/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE#288</a>) +=
38 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-st=
ore-lr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12709/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2360" moz-do-not-send=3D"true">Intel XE#2360</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-=
oa.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
09/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2541" moz-do-not-send=3D"true">Intel XE#2541</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573" moz-do-not-se=
nd=3D"true">Intel XE#3573</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-432/=
igt@xe_pm@d3cold-basic-exec.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-s=
end=3D"true">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366" moz-do-not-send=3D"true">Intel XE#366</a>) +1 oth=
er test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3hot-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-43=
2/igt@xe_pm@s4-d3hot-basic-exec.html" moz-do-not-send=3D"true">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268" moz-do-=
not-send=3D"true">Intel XE#4268</a>) +2 other tests
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-mem-usage:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shar=
d-dg2-463/igt@xe_query@multigpu-query-mem-usage.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/944" moz-do-not-send=3D"true">Intel XE#944</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-r=
anges.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12709/shard-dg2-434/igt@xe_sriov_auto_provisioning@exclusive-ranges.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4130" moz-do-not-send=3D"true">Intel XE#4130</a>) +1 =
other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vf1-clear:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/shard-dg2-4=
64/igt@xe_sriov_flr@flr-vf1-clear.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342" moz-do=
-not-send=3D"true">Intel XE#3342</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_scheduling@equal-throughput:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8262/shard-dg2-433/igt@xe_sriov_scheduling@equal-throughput.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12709/s=
hard-dg2-464/igt@xe_sriov_scheduling@equal-throughput.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4351" moz-do-not-send=3D"true">Intel XE#4351</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8262 -&gt; IGTPW_12709</li>
      </ul>
      <p>IGTPW_12709: 12709<br>
        IGT_8262: 8262<br>
        xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c:
        3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c</p>
    </blockquote>
  </body>
</html>

--------------0DaFofE0s2OqS4xWUgKWs35f--

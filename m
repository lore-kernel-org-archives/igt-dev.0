Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F627C5AD49
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 17:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33A810E32A;
	Fri,  6 Jun 2025 17:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxZ0D5xi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408E810E32A
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749231996; x=1780767996;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8b3/H/D76s2LRcidd8OGRxSFWCL47xFyo1n33WoNBxM=;
 b=IxZ0D5xittHKQ6J31khNBspDnzBIMaBjQp66Iyf6WOMmDnbKjQ0L1bSg
 YdvkMprpHqUEyB71LddOBhjAUZMjOlOHoinjMZiPWOkT4XDe45zyKepMp
 Et5X2XK0GfHeKBF0EgCXNCXzETOR3Z28PHG1WK624nJQLi1iqrfhooPoK
 paOL+5cCUckF7u8kS/Y4t8/TOxP4CymojFgVh1LxfHbq6hLF8ZcvXG6UN
 gvZOhnad7JILIyjXlT53l998W1EKDoZjQOoZ2YvGHNbqClZwWGYXVbodn
 YgryzqUf7CGVmMr4kMktOgNIh/rJil4hOP2AYrWhY7+hjCbogC/qPCa3s Q==;
X-CSE-ConnectionGUID: 2pjlYZN6QW+u6v2dAM1whA==
X-CSE-MsgGUID: oBbLXAYPRQGkW2HCCg5X/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="55180955"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="55180955"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:46:36 -0700
X-CSE-ConnectionGUID: irrQETzqTCqplJRva0esNw==
X-CSE-MsgGUID: 0kitICS7RKm/VwAHknR5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="146839183"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:46:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 10:46:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 10:46:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.74)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 10:46:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifdxcz5aZ5qhbW3dVPzgFqaNeYNyEEuJWK1/ntC3e/ySmOAQBPJtolbPLcU5zHfZ2OQIqm5rCoT0QjRNEktrIcPTqDtAL8a4CumqLAzO+KRCyx/NTP/kNbCbxS8/5ZtkyHNGuKfHgG4Q9QYrj0kKu0lT4W0OXmarYXGR4hUL4DOmzP5i89aeCsLHOAKe8OiEh8/UNNyW3g99b3EEUU6Vx+s7Jua6+MhdzrOW4wSNSqjSRr4UXwGv+Z/ayCk5dSFDS9e/38c4gV3i896+SjhXUr/PhwL1kj+ufocMk3Zic5R8GJyFOWUr9mMI5M1aIHCdC+FCGqU6Ot4YXn4rgY/lFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NOhM7XdzXYn7/Koqr8CPdSia4NBvZyd7oMDbVXB4mA=;
 b=EIfRw56KQFfNbKLCg5HjAO842BSAawsVZ+yRgDJEed9bOxi3ou37JjN1HqE924x3ZyIQihtD+duXMhckgSOoHvcukL4cSU34ltY0lfw4kZ/22pGx2mr8y4mxWO3BwDM7fIQZvXYEXVw3/4IA8tnv2qwgophPKYof3cV9TswuqC4A6bCCCQOFf6b6r2FnFNCqXtHTi7Xdkdher12YHlwi9XJBVLWjB8mWM6Ngv1SK+NIQ7zTgXP6+VadQWUNY6R/dHo+DZKWWBPfZIQj3ylauABOkEmrobJmLwILGv+PXrP35aWK6Laf2gpVcjupUUyHXG9eryK/NrKqq57ez4IsvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH2PR11MB8778.namprd11.prod.outlook.com (2603:10b6:610:281::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 17:45:48 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Fri, 6 Jun 2025
 17:45:48 +0000
Date: Fri, 6 Jun 2025 10:45:46 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v3 3/5] tests/intel/xe_pmu: Add tests to validate
 engine activity on render node
Message-ID: <aEMpSq2Xzc2BLqns@unerlige-desk.amr.corp.intel.com>
References: <20250606101008.1949955-1-riana.tauro@intel.com>
 <20250606101008.1949955-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250606101008.1949955-4-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:a03:333::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH2PR11MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: a60deeee-48db-4b9f-14c6-08dda521f8d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEdSdXBoUDVpTUsrOTNzQ200QmlpdVBIbkVFcHU1ZERzNmlpU0QzYkFSVDJ4?=
 =?utf-8?B?SVc1QXhYSUthQkU1TEpMYlhJWWIzTEhoTE1pQ21qWGVVZDR1cm9ZSEQyeHRZ?=
 =?utf-8?B?MlpDdWpabnhXNjhVTHQvYzhJbUxySEpYTld3cWxEdmk0QVNvVWg0NUovUkRz?=
 =?utf-8?B?REtUZk5RYjB6aXNlQzJpUmRRaWdoMzJhdjNaaDBISTMxdE41dGQzZ2RTWU8v?=
 =?utf-8?B?REN6dXU3WG9qcU4yWndJQ3BBMFZNOWYxaDMvRE1UcERiSVB5NDk1ZjlLbzBD?=
 =?utf-8?B?U2lpV1RIMG5EM1JJRnF3aklMQnFmL1g0YURKdVZBOEwzTGwwU2prVjA0TzRL?=
 =?utf-8?B?YkxxSlhxa0NJcXp6ZXdYLytkWGZtN21rUVJqMzVrS3J2Z1YyWDVyMTZrQkE0?=
 =?utf-8?B?SGQxVHg4d2hlMEtLKyt1NUJkblVxOTZmWnZ0WVlPOGt5NE5rV0RLOStTN01J?=
 =?utf-8?B?NHFEc1JKTkNpU1Vidm5EYVdqWjhteWJTdWxsek52cDJyTFphMG9GS1RDS1RT?=
 =?utf-8?B?NkZFanFoRzJkM0I0N2hYWEpwZG11L2lJaWpWVVg5ZksvTUg1a2l4K0JTcHZw?=
 =?utf-8?B?WXVCWVQ5SjV6VnplZ2NCbGk4L0tBM1BtTyt3UEFSUkQ4MFN2REZxblcrV0FW?=
 =?utf-8?B?V3U4R3R1elNleUU3NkEvc1VvOW1KNFNqTDJGbUZsNys2U1lCQ2k3cEtzQkJi?=
 =?utf-8?B?b2VPWXFaY2UwYUkzL0dLU1hLbDRWeHBpTCtid1UxaWJBUFROVmxhdmlXMGdX?=
 =?utf-8?B?MW9nVkZWR1VaNlBkSVZrWnVlanZJK0VidTMvQkZEMFRzTWVQWEc5T3pqRUVW?=
 =?utf-8?B?Y1ZoSzBMOWx2Mkc2MXRZWGZXalo1RXcwREV0TlZjcU5TYkhuQ2hodE5lOGY5?=
 =?utf-8?B?d0lmMm9EQmgvY2R3WkQ3QTRaM211Z25xZjdzOGVvTDBYOFovS2RHZWVBMkYw?=
 =?utf-8?B?Tnk4c0cvdCtVa1RSQ1BRNUZlcHFkL2dESWhBaVc0d2xVSmMrcDlSeGprTmJQ?=
 =?utf-8?B?NnIxTFYwMSs4ZCs3YURMS3AzNDhwZkxyT2dJWjNBTXp2OHo3STQrWmlJaFd5?=
 =?utf-8?B?OE94OCtWNndFVlFuT1VGY2FOcFhnL1JrVk03R3dJekxMYWxxU0xqUVpMN0NZ?=
 =?utf-8?B?ZTlwbnRLcHhuTFFnN1VhZVBGWlp2WFI1VFdDTDBXRHNTQmZSTk1ONnMzY2RQ?=
 =?utf-8?B?OXVtVDdaQndzWG82M3dtRkVGRHNBR1ErSXFlZ3BzSDVmWmp4TU1VY05XN0N3?=
 =?utf-8?B?Q0h5VkxvS2F4WG11TFNnSnJUcmFmYVBnd1lEY3Jhb1puVjhFVWkwS0ZiK2gx?=
 =?utf-8?B?NGxiRzFKeTFpQXZONHRtUTN4UDZkYlpXUTJyWEMraE1xUGlpVHZtaWhCY0V3?=
 =?utf-8?B?bUlUd2lhTzJJOGs5Umg3MFY3TmxybEZjY0UxSFV2QlFLOGkrczAxNW5nRVMv?=
 =?utf-8?B?NEdZeXhqTk5LZUxkNXVFMkt6eS8yK1dkSkZyR2luM1BWUkhVVGRySCt2Q2ZD?=
 =?utf-8?B?YkZLaXlIQUYvRndSK1hTUmtXQ1ExUE5BdWdYMlhVaHV2UzZFMW9JUU9DOVB1?=
 =?utf-8?B?VjRoR0o2RXNqalRMNlU3ekN0VEJMdktKWmdSbzhJNCtwa3FsZ1JuTXVBWEg5?=
 =?utf-8?B?cWJOZytMa0Q2R0xDUWYvc1o5RkJuQ05jbVV6K2NEaXVQb09DemFFQXZhMjFR?=
 =?utf-8?B?bDFTZFRZSlRjYmk1dnRNRmVJRzZiOERqNWZDSEtQc1Y2eCtjNm9lRk5NNllG?=
 =?utf-8?B?Q2xlemRJUU9OMmpRanUzVzJsbjUwVWRZcnVZdVJESGt1UXVmamp1ck5vY2dH?=
 =?utf-8?B?N1J1SjRyQk10WHd4L01oUWNsV01hbjZNWjUwMWdvanhQUFpkM3c1cnFFcDZX?=
 =?utf-8?B?SHVLT01Qd2VoUll4ODd0VUFFQjVQblROcGllWHdxN0dRTGZURlJYMkNka1hl?=
 =?utf-8?Q?zVD/N2vCr44=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2N5UGIvQU9DdW55UHE3dG1QT0VwYWdJR1duai9XSFplaE5ZZjhYUWltZFhp?=
 =?utf-8?B?ckVsQXU2T2pHemVoWnd1dno4bVFpZHltK0M5WHJhWUg4ckJYVy9GZEp2MWlI?=
 =?utf-8?B?a0p6dkZoUHRJeERaRUZHWjFvRk1wMWR1QXVid0NoM1FoR3RvZ2lnUTRIK3E5?=
 =?utf-8?B?Q1AwZVhYeDYvSWtOSGxINXMxNXlseElEc24xVnplQUlYRi9lSGlqc3gxTC82?=
 =?utf-8?B?M1pyRm5pZElOS041ZFd2VHZxU0VlaTVsRGcrQnRyd0pORHJ6T1dRNVpFTnQ3?=
 =?utf-8?B?V2N1NzR6Q3A2QVh1RWJKT05KM0htcG1Kb3RxdU1yWlh0bE1DcjF2bVUzaEk4?=
 =?utf-8?B?N2NndTNvcUtzREJlclNFcGZrdmE3aENzdGJNa3htTmw2TlVEVk9ILytsYk9R?=
 =?utf-8?B?TWpsR3RUNmkxbXJDUEcvQkpqSjFDN042SnNhWEo2ZGwyYkpSMEkwK3FiWHdq?=
 =?utf-8?B?NENrZ0Zzc1J1OFlwdWowd2JXS0czRVNGUGxnbFRkVUp6WS81S2NnTDkyL3JK?=
 =?utf-8?B?cVFNUWFNWjFMRUtlbFd1L2hhN2VtTW4rYW9yLzNQTEdFdlVEUkxsL3VONHFG?=
 =?utf-8?B?QU1qTStDK3c3dFFyZDVDWStpejB3Y0o1M2NiL2lyVi9UdVRyTTEyZHF1QVNl?=
 =?utf-8?B?QTNjanM5alRocjlDTng1NGhPcEVqN3IwY09pNkRzS2s2NjNwSmxXRDErT2Ru?=
 =?utf-8?B?YjVPNXF3YTF0WDU3ZSs4VU96b0liYmJwVGNXa0hXZWRLbDlRdHVRTS9uQ3ZD?=
 =?utf-8?B?Q1hWOXcxc0FFMXFXVmZ6UHp4UDFrY0RQWm8xNDRjQ2NYeERDWllDNFJMZHZh?=
 =?utf-8?B?Qkw2WEtqc0FCcDJyUFMyQ3dlTHlHTHZ0ZHZaQVNicUtHZnQ3dnlFR2wwQzBk?=
 =?utf-8?B?UWNMNlprU3BZcnJ1a05EZkFWOTFURkVtR3JzVFpUU0xucS9pZXlnSG9TcmpL?=
 =?utf-8?B?UzVpajFkb3BvNHRiYW9YcmJLSm52cGR5OXBLM2h4NGJkSEVaaXJobjl4K3JL?=
 =?utf-8?B?TkxPS2tXSHM1Z0JMWkVKM1lBZ2R3Y0Y2SGxSRmtCR3pOeU5XYUcrb3RJeTNp?=
 =?utf-8?B?QmVxcVZSWG5MV3VVSStKaWs0TkdKZ2YrSXFFQ0xma1plSFl4WndPamRaeWpv?=
 =?utf-8?B?SFNSMzhJSmFFY3JCU25qcC9VWXpLNUIrVTJjRGMzKzE2bDlzSHBXRVFCQXNw?=
 =?utf-8?B?cCtvWUhjdi9rYlFCbk9KNTdmKzIrOERQazlwK1ZlajMzUDJqTzdsUXpDMWFM?=
 =?utf-8?B?RzV1U1drcmY0VVB0K3p1QnRIc1hkZGVvR3NSY2lnSFJpTzJnSDA3cHQ2b3ZI?=
 =?utf-8?B?RDk2WlBBaFJocHlLM0NWUGRPZ1BnUXlIbEdoeDVVV0RsYWEzem41eWRkdjFl?=
 =?utf-8?B?WXFHVHdaM3k3aFJyQllEZHFYNVRVNCtVT09VRFZIN0lISTFoR3JWMGdZZjVk?=
 =?utf-8?B?NTJ2bUh4aDl3aTFDbG1HUVhiVWNoVzNCZGpUZDUxNlF2U28xV3h1ZXZjZzBy?=
 =?utf-8?B?WFFvM01xTytKaFRFOURCejBXQ0VGZDlOSndyUnhabkFheEoyclBHU2tHakxB?=
 =?utf-8?B?S1I0R1lDa2Q0OEl3SHcvTmJtM0JuK3UzZVRlTXN2ZkxQSldXQlFQQTRJNUNG?=
 =?utf-8?B?bnp3L3FFeHZja3YrbFNkSlM0ZUZ4NGIzS3o5OFU4UFU2dEprbUJKQzRwOTRO?=
 =?utf-8?B?SFNWdWlIQ2R5V28reHg0NEV3dWU0Y2p3MkIyR1B6cmsxUHg2WEV0T3MxN01k?=
 =?utf-8?B?ZHZIVk9uaURjN3k0S0tPTTlBSCsyMWZFWkhOdjRJUTFBcFEvdWZRTWU1cW5n?=
 =?utf-8?B?Mlh6VWRsQzdYL28xVFU2dWV4K1pZYW1YT2tmR3k2U2VlN3JCaVhCOW56Vmdl?=
 =?utf-8?B?cXVkN3JxMytBTzhnUEwvOXcxUGJHMDl5M3d2N2JxZW91ZjdjV2RPRlJDS3Bz?=
 =?utf-8?B?L2hPdUs5bXVXb2hDTWFMQkxWZmQ4c2lKMXBOSHZvUW9aTWpKUmhzMW5NZU9M?=
 =?utf-8?B?Z0wrRjJFWlBPWDFGd3lhcVNBYlpidVRuR2FqUjJJTlVwT1NWU1hWNHZibkJo?=
 =?utf-8?B?RlloVU02em92Rjc2RGU4Uzl2WmlnWmZqeFAwbWt4MzBxSnM4Nm8rQXlvVjB6?=
 =?utf-8?B?eVpadlp4WmtnL2V1ME8ra1dkOGdnU0tjbUE4ZmpXZVh4NjRCTkdpMUZ5clhK?=
 =?utf-8?Q?z6LC4Rg2ubL2qHagJz8NHts=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a60deeee-48db-4b9f-14c6-08dda521f8d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 17:45:48.5858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRcWcplSPcNRUYiELZiVLoSRTt/w4CAHP3VXJIiF5iNxjO3g3DAfjWmbOOQ+zRVGSKKQPqQbNxyLifo60Z3n3NRWJ9/3Bmb7gTzmq/3Cw0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8778
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

On Fri, Jun 06, 2025 at 03:40:06PM +0530, Riana Tauro wrote:
>Add idle, load and trailing idle tests to validate engine activity on
>render node
>
>v2: fix render fd (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_pmu.c | 33 +++++++++++++++++++++++++++++++++
> 1 file changed, 33 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index e6afca9c4..00c2b88b7 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -56,6 +56,15 @@
>  * Description: Test to validate engine activity by running workload and trailing idle on all engines
>  * 		except one
>  *
>+ * SUBTEST: engine-activity-render-node-idle
>+ * Description: Test to validate engine activity on render node shows no load when idle
>+ *
>+ * SUBTEST: engine-activity-render-node-load
>+ * Description: Test to validate engine activity on render node by running workload
>+ *
>+ * SUBTEST: engine-activity-render-node-load-idle
>+ * Description: Test to validate engine activity on render node by running workload and trailing idle
>+ *
>  * SUBTEST: all-fn-engine-activity-load
>  * Description: Test to validate engine activity by running load on all functions simultaneously
>  *
>@@ -857,6 +866,30 @@ igt_main
> 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
> 	}
>
>+	igt_subtest_group {
>+		int render_fd;
>+
>+		igt_fixture {
>+			render_fd = __drm_open_driver_render(DRIVER_XE);
>+			igt_require(render_fd);
>+		}
>+
>+		igt_describe("Validate engine activity on render node when idle");
>+		test_each_engine("engine-activity-render-node-idle", render_fd, eci)
>+			engine_activity(render_fd, eci, 0);
>+
>+		igt_describe("Validate engine activity on render node when loaded");
>+		test_each_engine("engine-activity-render-node-load", render_fd, eci)
>+			engine_activity(render_fd, eci, TEST_LOAD);
>+
>+		igt_describe("Validate engine activity on render node with load and trailing idle");
>+		test_each_engine("engine-activity-render-node-load-idle", render_fd, eci)
>+			engine_activity(render_fd, eci, TEST_LOAD | TEST_TRAILING_IDLE);
>+
>+		igt_fixture
>+			drm_close_driver(render_fd);
>+	}
>+
> 	igt_subtest_group {
> 		unsigned int num_fns;
>
>-- 
>2.47.1
>

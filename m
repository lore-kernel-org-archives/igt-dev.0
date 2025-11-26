Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81F6D1039A
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 09:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6FC10E599;
	Wed, 26 Nov 2025 09:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXEAa1ii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509F810E599
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 09:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764151007; x=1795687007;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=kzk4Bj5JW6FylYhjd71hr+cGHANfBtJ+SyTPd1c/twk=;
 b=YXEAa1iiaMFplAPVGG2PHgj8raKDIlaWh0loE0lz62IDaZ8nBQzQgkQ2
 FMgmjqEzJo0zl9GwpSKVr5ld3n2hLoYFuhPEH2Izwi3koi+r0CIi6lmdS
 XwopoIRa/QkIPC96Y+l/EuSGsMOe632+TbmhXNOjP03mvqgCHRXej9R+a
 8H2my4wpbH92Y73Bil1tZ1REp5laliFYyP+ayiY2AFI+Mdb12uaJscuYh
 DBCinlbHzBlgZTKCGNE1PNm0r2tDt1hzqXBJRnzGqmu/Km7fbJOBB0DhU
 KshSeiOw+CfH8+6y6YcAqdzYF3RcVVuLlRnU3kOGlZsMxdIDcKMHdmSNL g==;
X-CSE-ConnectionGUID: /t4hSJKUSR2i4RStveskTQ==
X-CSE-MsgGUID: cipO4imyTJ+J2heggZQ1zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77548839"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="77548839"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:56:47 -0800
X-CSE-ConnectionGUID: N69nVpgJQCeVCpQqDQdWfQ==
X-CSE-MsgGUID: 6sJPYqAiQLqgubhmC3FrPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="197382294"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:56:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 01:56:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 01:56:46 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 01:56:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlCvEWyiv1Iy7epoShjKs4O9nC/johmwDpmr3zgbxlr580QpUkr9ekJxcL41FLIYk+dDW0GV4L+7DgYFzZX41M54QO624C6RZ5dImXvl+tzJ1kasdWgVEbRrek0YjlBROsUB8XEIpOvB0qiKEM1ocHqgcmV7tE8E/FjVO/QRJit1mvJOxxwMR4KXil3u7Uh6h+rSVSjNcTYIqzBWZlshMqFsxN6Z0rkYV2fVR/0fL3libxmyQyGHwxeveUBkxVneSglX57aHRHAh9xjwc0GqUdtLyXxDZVDAMh6tFUkmBOfF2+pQinJNfTTOn1D/RepH3jKdq/chN9WiAg4Lt/9sYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzk4Bj5JW6FylYhjd71hr+cGHANfBtJ+SyTPd1c/twk=;
 b=JLkHNIZCa4vi6mr0X+UsmRaWeby/uazg35K5ramHBS2wR7GEGPgXEl7wm6yGR36V6pONvY9J5jXH4ZiZIKovFrpg5eJue8Qz2S4UUkTGbMsOTohfmwCpTmWyq7TpX250K7aPXYyVguoGN57DpuE2985OmA3B/6iEW3JC/CWFVLKukxoX3OGD0w+osRKZMWcZnYwU8JhLPjKUPlu+Dtfl+Xr/nfvNGp1aFqidt28AvCAxbLGKwRZgzlZrMitn/tB24mBOjZZlB4DDiLUrK7uHHbIX73OX2BRk2rVj8z8k5IfucClFMEZHOFko6biIKPVetzAlZKxf35EVI6QEwniZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:56:43 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 09:56:43 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v8 09/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU conflicting madvise test
Thread-Topic: [PATCH i-g-t v8 09/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU conflicting madvise test
Thread-Index: AQHcWwN/36yh6MJh9kiy0o5QpiifyrUEv+iA
Date: Wed, 26 Nov 2025 09:56:43 +0000
Message-ID: <e5355e207dfc4a85baa21758d822f31618dc3ab8.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251121162537.77551-10-nishit.sharma@intel.com>
In-Reply-To: <20251121162537.77551-10-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|CH3PR11MB7392:EE_
x-ms-office365-filtering-correlation-id: a2ca5c6c-7b5a-477c-c351-08de2cd21ac9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WUF2VnlZYzd1QVZYYnQxbGl1ZWdLd1JxRE44ZHk0V3pvc1c5Z1ZGT09PV1lv?=
 =?utf-8?B?bkxKQkRUZXJxK0picmJlbElVRG5oWEtxNkNWbzd6UW54SUo5Z3NlVVNlQjcx?=
 =?utf-8?B?WmhxRUVsY1RrejRXVUU3TlRXcEphVEpBejJsS1ZmQ281OVNVSkZqSFA4L3Zn?=
 =?utf-8?B?cmhWYm9SSW9CWE54ZXlqempmTWVEdFNTTjhvdEhRVmJ4V3U1bzAxZzhmWWpE?=
 =?utf-8?B?R2hOTFFKVmxENEdKZHRRMXlyVEwvVHNISG9RaUVZamlhSFg5QklVQjlQYWNP?=
 =?utf-8?B?TVNxdGlLNlhEVTcremRaNFVCZTJKYUp5MXd2cFJwcENrUjZ4bEVic0l6d2k5?=
 =?utf-8?B?UmNyN0kzdXFYTXVDblRsdXBDTURwb21YRm5VeEE3YncxOFlITzR5cFFCZEpS?=
 =?utf-8?B?RGxoazVWVEhCYjZSb0RTN2JVVXRDYUZTK3E1QmhIejlMNFlDeTVOT0NMQmxY?=
 =?utf-8?B?eXI3WjV0T2daYU52U3dHcHhwekhiY2s4SzdiVEJINHpiREdzYmR3ZGJPakFW?=
 =?utf-8?B?ampLaDZxdmdTRUczOWhkNnJ5SHBESVF3SmNlWjZiZ2NGTVR2d1h6UHFrWG5D?=
 =?utf-8?B?NjBOVTVqRWNJc3JhY1YrdXVyRDFpZUo4aXJhWEQ0NDBHUnltaHlaTXduejNv?=
 =?utf-8?B?eTF2L2d4Mm82R0xab05RTXNIeE1mWEQrWEI3WTdmVDZyYURpU1ByUXFmTzE0?=
 =?utf-8?B?SENScUEyY0xtNmhvK1BYY3BTRTJzR3ZHY2FrZHlpdDZlaklxRWpnZU95K3h1?=
 =?utf-8?B?QzVXTnF4anNXWktzVHAvS2dWQkZpOFkreUpYNUNtSE55eWZnb2hvQm5UMUZN?=
 =?utf-8?B?aGRuR0FqdjFnZnhsdGdNcFJBVXpxTjVXOVRNck1SaUs1NlhNdVJoT3lKWkVB?=
 =?utf-8?B?WWJlcUZhSlYvS09OQU83dVcweVlQQXQ2TExRTGxMd3l3aDNlbGxWWVFBZ0h5?=
 =?utf-8?B?QUZTb0l2d1hhejZKM1oxSVUzU3hzWlV5N3IxZlNoR2djWUEvSEdwTmJYaDdV?=
 =?utf-8?B?dXdOT0N5WjdLMDBNdlpNR2ZGdFhWdmtZblNzaDQ0bnBtaWZLRys3OWhtM25E?=
 =?utf-8?B?eExpdCtoTU9hVzlPbUNvdzFlNkpyZ0owOFJ1bFBZNDZmVVBIYVh5VDl2SHdq?=
 =?utf-8?B?NVZOOEhtVkRvekxaZnlUWXNjY202QTdkV1B3QXdzcytHaFN5c1RacmcrZVhV?=
 =?utf-8?B?QmFCYzZodGd6ZXMwSE5rL2Jhc2JCWVhyN1IrVkZlT1Eza2ZJTHVaWlAwdmkz?=
 =?utf-8?B?aFBhS2NrSkpoV0hoLzgrNUJ2UXZKT2RQYTkxT3psMnNzcFQycktUT3ZFTTRL?=
 =?utf-8?B?V2JkeGVBTWFiTmRpSWRyME5sV2RHR0Y3NVVOTWRYdEozOHJIVEVZSzFRS0Z0?=
 =?utf-8?B?TGwvaGI0aGRVZHJVdHM5WXhtaTF6b2tyd3NnRjlCZE84THFoSlQvZThPQVZr?=
 =?utf-8?B?eTdUNWVMWHVXUjBaQ3Y0QTh6dnpZdGdrYWw2cnVTamNFT0owQ0RPNS9seTEz?=
 =?utf-8?B?am5sR2tqV3NtMFFuRC82QndGZVRoMmxaQjg0b2w1akJkNHBscVM5eVFJOCtV?=
 =?utf-8?B?VjdvcHlRTEQ3cjkrOHA3OVc5L1ExeWFjT0lVckNWdUhtWWJjVjk1dkcvdFdF?=
 =?utf-8?B?a1oyRGIwWE9xY1Z2WHJiRHJudlB1Nk11c00zMkROTXpSZTNwTlpPVzJyK25x?=
 =?utf-8?B?bzI3Nzd2TmcxYklSR05vcU42MFZqZ2lDZEhCR3lONHRXd3B6T1psOGdrdWpP?=
 =?utf-8?B?Slc3Rmt5ZjBDYWlqUVhpKy8vOWxTR3ZKYTRwd2tqRXo1MUllSE42SHBDbmZY?=
 =?utf-8?B?VVJJRXBnK3JHcVJOZGgyM3dIM2VkZ2NRVUdNcDV1QUlVMVdjaTltYlljTmZw?=
 =?utf-8?B?dFRqU2dablVhMzBsQnhXY0JyYzhaMlkxdzUreFBXM2VIWFpaeG1tb0VyaUVv?=
 =?utf-8?B?YlNnY2kxcDRXNHBVbEhUcFZpS3M3TldjMnU2ZVYvSitvMnZsd0hPRERHZTMy?=
 =?utf-8?B?aUpkOWY1d0lQNzk5R252SzBPcFBVakVLMERiUnZUM3U3emRxdlZoYU9VeWVR?=
 =?utf-8?Q?jKcbIJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE1OK0twYk16RDVxMjFNTU54eEFLMTdIeGtPYXpBZWxPN0N5b1F2REtEbHRZ?=
 =?utf-8?B?d0dGQjdxT0Rza3E0cmZTZ25ZcWNXbHgram8vRFZoYk5rWHBTUlU0MUhOYVZk?=
 =?utf-8?B?SVlqS3BtaFN1c1hxdy9RaHgxdUM3bGtKbXB4VUFKVmdyTHY4dHBabDArOXdI?=
 =?utf-8?B?SWRIRkRzenEwaTc1MkRReEd0Y3NZUHZCMjl3RTNoWHk4L0llOCtoVXhhTWdJ?=
 =?utf-8?B?Nmk4UExBNUUzNW5oMnJzY1d2b0R2a3VDNGdCRzF6RVFwd056TnlxUE9pVE1z?=
 =?utf-8?B?NUhiZ0F5Y0hobE5UUnkvVnJQTzFvZTVmdXhFcHJyeVVuMDIraHA5SFFZaVZa?=
 =?utf-8?B?cy8zd3MwRlhOY2lTQmJ1NUNZMENISjFNdlE0Y1hibVoveUhrMHZFYVpSdFVD?=
 =?utf-8?B?dEIxUWFzM2lGbW9EZmp4dUI4eFN2QS93T1FkWVlybFpGSjRSVVRZeVNPSzFO?=
 =?utf-8?B?eDVWK3RBZlAzYzJmaG5WWWFQa0FiNll5WWxSNjZCV0pTa3NUUWJLM3FuWTNE?=
 =?utf-8?B?c3d3QUxtVXRMR0txWFRWQmxHYW5EekNlTTNsdi80RU8vYXdCMCtjK1J2NnFY?=
 =?utf-8?B?VHhCZHFEdnpqbWlKczNzbFZqeEJNQU9QdmVTQzRWV0tuK09IWVNVOUhvZ0k4?=
 =?utf-8?B?OU9EUm44Q3NFVGJJZ05SaURIZkhHUmh0dlprOUhDZk5CWDl3Zi80cGFxNlN2?=
 =?utf-8?B?cWxmYVZ5MDU5eEhjSWVaekwrZkI3VjZ4SUE5eWRySXBxK1hnejVNZWlOanlG?=
 =?utf-8?B?WmpqUTBNMWZIYzRiakxnNEhoMmVDVWQ1MDdYUk12UUdWK1AydnkvMm1iUjVj?=
 =?utf-8?B?WFovbUZqYzNtV0g0UmIrMWpZOUczWFdoZ2hXYVB6Z1VubmRSS3NVdHNNSkNF?=
 =?utf-8?B?cWNkRDIvYnV2WDc2emIwcnJvaDVsVEtaZUFWczBtQ0p1cU4rVXZxeVNEdmhh?=
 =?utf-8?B?RG1Qemh1Wjl3bEVUTXNJTE03NXZ5L251S1dQcVJUcUdnWWw2ZDBLQ2hDNmkz?=
 =?utf-8?B?YzVKeEp3M2p0dVllOXhEbzNIajdWS1dWV3pQVndDNnlqWDJZZ0RqWjdzZkZq?=
 =?utf-8?B?WG5jdHJyK3RCdTRPY2RDMldnZ1l0ZDdTWGV4dlNHbXcwY0ovWEJCT01rQkJy?=
 =?utf-8?B?SFROT3pBcmQ3TWZHZFJ6RDV1VVZ5MTRMMUp2MEJ2UUxsN3puTFdOR3RtY0kz?=
 =?utf-8?B?REI3VzNUT09QV0Q2Vkhma2pwY3hWRjdRdHVDZEdWWTBNQS9sTXp2RUVLdDZq?=
 =?utf-8?B?ekpiMU9GK2tZODBuY2MxM1dGNjlZdFB3TFlnK240ZXBmL2lTekFFMWpIWXFY?=
 =?utf-8?B?TDhock83MU40TCtWYU81VnRpL0t6V212RUdJc1F5N0E5VjJ4a3Z2bThUSjdN?=
 =?utf-8?B?ZHNBYmZmVVZZQ0NiYzBidFhTZm5ybER4eDNoVEVWSUh3SEVudWU1d0JXMGQr?=
 =?utf-8?B?eUlvSE5FWW16aWpwWUJWZFF5NWRucjV5NzFBMG5TNXJ2SlliZWU2MDRHOGZS?=
 =?utf-8?B?dmtVSHA2TzNiQlBMZlBwejRmS0s2RjZIWnJSQXVEUEN0WWtkb01TaXJmcWdo?=
 =?utf-8?B?Mm9sNjVmb2hDUXlnVU9uRzZ5OFVDS0FieUNFSUhEazNFWC9CTWFaR05md0Nn?=
 =?utf-8?B?Z29lWGRCaVZlMktUZ21iUXo4REJqbmovUnM3U3FRb0VpMUp4bWdIdEYwZkUz?=
 =?utf-8?B?ZjYrNlg5WFRvRmU5clh4WXVNaXNWaHNKRVF1YjNRcDJFSGhvbzNlYnJaQVBQ?=
 =?utf-8?B?K1NTcGZKUVlMdVpySWRtSTZITG9kM2FzcC9Mb1QyUFpkMjZEVStoMCtmSU8w?=
 =?utf-8?B?VGd5d2dGdXpNNm93bVFNOEQxOXdoMjgrcDVmWllKODlGTXgwSktlSnVHZEJX?=
 =?utf-8?B?L0pFTERod2crMjZqTWpKOEg3eUtjb0kxVk9SQU92TUNuajJLaEtpS1JJK3Qw?=
 =?utf-8?B?VWI0VFh3NnhBaVJ4ZUZLNmx3dkhMSk9xcDdKRHlhMmg3cUd0WVhBUWpMT1Jm?=
 =?utf-8?B?cFNKdDVMSDQ5MnQvOXc5eG1qU0prOFArV0xYZ0lCcWp3WXdwU01oVjVyT0Mx?=
 =?utf-8?B?Z1dzeG9ET3FtaEpCa1BWR3NpeDhUY2Y3WHMzVnVyNDd5SHY0b0dVSFhlOEVj?=
 =?utf-8?B?c0J6YnBUZHE2QXR4N2VCc3VFenhpRUQzY1VyeDg5RGEyWFRZZEo2eEFBSXRV?=
 =?utf-8?Q?hsuPvnbLi+++js/7WF6hmP1jqOsdSuWxA3Got/IkZ8ou?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE4B25569C6179488A3C4D3DF20ABE9E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ca5c6c-7b5a-477c-c351-08de2cd21ac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 09:56:43.6743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yzDWf3m/RW9FF5McfXrVmXSl3CtvDKvc3202baQd/EBRJzUQmuspbFcpkzBdnYi6W8NcTkDz4xX9hTNg+Vi0Ia0mhYv2a5x9Jcx2szi1pTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
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

SGksIE5pc2hpdCwNCg0KT24gRnJpLCAyMDI1LTExLTIxIGF0IDE2OjI1ICswMDAwLCBuaXNoaXQu
c2hhcm1hQGludGVsLmNvbSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNo
YXJtYUBpbnRlbC5jb20+DQo+IA0KPiBUaGlzIHRlc3QgY2FsbHMgbWFkdmlzZSBvcGVyYXRpb25z
IG9uIEdQVTAgd2l0aCB0aGUgcHJlZmVycmVkDQo+IGxvY2F0aW9uIHNldA0KPiB0byBHUFUxIGFu
ZCB2aWNlIHZlcnNhLiBJdCByZXBvcnRzIGNvbmZsaWN0cyB3aGVuIGNvbmZsaWN0aW5nIG1lbW9y
eQ0KPiBhZHZpY2UNCj4gaXMgZ2l2ZW4gZm9yIHNoYXJlZCBTVk0gYnVmZmVycyBpbiBhIG11bHRp
LUdQVSBlbnZpcm9ubWVudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hpdCBTaGFybWEgPG5p
c2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9pbnRlbC94ZV9tdWx0aV9n
cHVzdm0uYyB8IDEyNQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDEyNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVz
dm0uYw0KPiBpbmRleCA3ZjNjNWU2M2MuLjA2OGI5NjcxYiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMv
aW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1
c3ZtLmMNCj4gQEAgLTExMCw2ICsxMTAsMTUgQEANCj4gwqAgKglUZXN0IGNvbmN1cnJlbnQgYXRv
bWljIG1lbW9yeSBvcGVyYXRpb25zIHdpdGggcHJlZmV0Y2ggd2hlcmUNCj4gwqAgKgltdWx0aXBs
ZSBHUFVzIHNpbXVsdGFuZW91c2x5IGFjY2VzcyBzaGFyZWQgbWVtb3J5IHRvDQo+IHZhbGlkYXRl
DQo+IMKgICoJY29oZXJlbmN5IHdpdGggbWVtb3J5IG1pZ3JhdGlvbiBhbmQgbG9jYWwgVlJBTSBh
Y2Nlc3MNCj4gKyAqDQo+ICsgKiBTVUJURVNUOiBtZ3B1LWNvbmZsaWN0aW5nLW1hZHZpc2UtYmFz
aWMNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJVGVzdCBjb25mbGljdGluZyBtYWR2aXNlIG9w
ZXJhdGlvbnMgYWNyb3NzIG11bHRpcGxlIEdQVXMNCj4gKyAqDQo+ICsgKiBTVUJURVNUOiBtZ3B1
LWNvbmZsaWN0aW5nLW1hZHZpc2UtcHJlZmV0Y2gNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJ
VGVzdCBjb25mbGljdGluZyBtYWR2aXNlIG9wZXJhdGlvbnMgd2l0aCBwcmVmZXRjaCBhY3Jvc3MN
Cj4gbXVsdGlwbGUgR1BVcw0KPiArICoNCj4gwqAgKi8NCj4gwqANCj4gwqAjZGVmaW5lIE1BWF9Y
RV9SRUdJT05TCTgNCj4gQEAgLTEyMCw2ICsxMjksOCBAQA0KPiDCoCNkZWZpbmUgRVhFQ19TWU5D
X1ZBTCAweDY3Njc2Nw0KPiDCoCNkZWZpbmUgQ09QWV9TSVpFIFNaXzY0TQ0KPiDCoCNkZWZpbmUJ
QVRPTUlDX09QX1ZBTAk1Ng0KPiArI2RlZmluZSBVU0VSX0ZFTkNFX1ZBTFVFwqDCoMKgwqDCoMKg
wqAgMHhkZWFkYmVlZmRlYWRiZWVmdWxsDQo+ICsjZGVmaW5lIEZJVkVfU0VDwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICg1TEwgKiBOU0VDX1BFUl9TRUMpDQo+IMKgDQo+IMKgI2RlZmlu
ZSBNVUxUSUdQVV9CQVNJQwkJCUJJVCgwKQ0KPiDCoCNkZWZpbmUgTVVMVElHUFVfUFJFRkVUQ0gJ
CUJJVCgxKQ0KPiBAQCAtMTMxLDYgKzE0Miw3IEBADQo+IMKgI2RlZmluZSBNVUxUSUdQVV9QRVJG
X1JFTV9DT1BZCQlCSVQoNykNCj4gwqAjZGVmaW5lIE1VTFRJR1BVX1BGQVVMVF9PUAkJQklUKDgp
DQo+IMKgI2RlZmluZSBNVUxUSUdQVV9DT05DX0FDQ0VTUwkJQklUKDkpDQo+ICsjZGVmaW5lIE1V
TFRJR1BVX0NPTkZMSUNUCQlCSVQoMTApDQo+IMKgDQo+IMKgc3RydWN0IHhlX3N2bV9ncHVfaW5m
byB7DQo+IMKgCWJvb2wgc3VwcG9ydHNfZmF1bHRzOw0KPiBAQCAtMTkxLDYgKzIwMywxMSBAQCBz
dGF0aWMgdm9pZCBncHVfc2ltdWx0X3Rlc3Rfd3JhcHBlcihzdHJ1Y3QNCj4geGVfc3ZtX2dwdV9p
bmZvICpzcmMsDQo+IMKgCQkJCcKgwqDCoCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19p
bnN0YW5jZSAqZWNpLA0KPiDCoAkJCQnCoMKgwqAgdW5zaWduZWQgaW50IGZsYWdzKTsNCj4gwqAN
Cj4gK3N0YXRpYyB2b2lkIGdwdV9jb25mbGljdF90ZXN0X3dyYXBwZXIoc3RydWN0IHhlX3N2bV9n
cHVfaW5mbyAqc3JjLA0KPiArCQkJCcKgwqDCoMKgwqAgc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAq
ZHN0LA0KPiArCQkJCcKgwqDCoMKgwqAgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5z
dGFuY2UgKmVjaSwNCj4gKwkJCQnCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBmbGFncyk7DQo+ICsN
Cj4gwqBzdGF0aWMgdm9pZA0KPiDCoGNyZWF0ZV92bV9hbmRfcXVldWUoc3RydWN0IHhlX3N2bV9n
cHVfaW5mbyAqZ3B1LCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNp
LA0KPiDCoAkJwqDCoMKgIHVpbnQzMl90ICp2bSwgdWludDMyX3QgKmV4ZWNfcXVldWUpDQo+IEBA
IC0xMTY0LDYgKzExODEsOTggQEAgbXVsdGlncHVfYWNjZXNzX3Rlc3Qoc3RydWN0IHhlX3N2bV9n
cHVfaW5mbw0KPiAqZ3B1MSwNCj4gwqAJY2xlYW51cF92bV9hbmRfcXVldWUoZ3B1Miwgdm1bMV0s
IGV4ZWNfcXVldWVbMV0pOw0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyB2b2lkDQo+ICtjb25mbGlj
dGluZ19tYWR2aXNlKHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdwdTEsDQo+ICsJCcKgwqDCoCBz
dHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHUyLA0KPiArCQnCoMKgwqAgc3RydWN0IGRybV94ZV9l
bmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gKwkJwqDCoMKgIHVuc2lnbmVkIGludCBmbGFn
cykNCj4gK3sNCj4gKwl1aW50NjRfdCBhZGRyOw0KPiArCXVpbnQzMl90IHZtWzJdOw0KPiArCXVp
bnQzMl90IGV4ZWNfcXVldWVbMl07DQo+ICsJdWludDMyX3QgYmF0Y2hfYm9bMl07DQo+ICsJdm9p
ZCAqZGF0YTsNCj4gKwl1aW50NjRfdCBiYXRjaF9hZGRyWzJdOw0KPiArCXN0cnVjdCBkcm1feGVf
c3luYyBzeW5jWzJdID0ge307DQo+ICsJdm9sYXRpbGUgdWludDY0X3QgKnN5bmNfYWRkclsyXTsN
Cj4gKw0KPiArCS8qIFNraXAgaWYgZWl0aGVyIEdQVSBkb2Vzbid0IHN1cHBvcnQgZmF1bHRzICov
DQo+ICsJaWYgKCFncHUxLT5zdXBwb3J0c19mYXVsdHMgfHwgIWdwdTItPnN1cHBvcnRzX2ZhdWx0
cykgew0KPiArCQlpZ3RfZGVidWcoIkJvdGggR1BVcyBtdXN0IHN1cHBvcnQgcGFnZSBmYXVsdHMg
Zm9yDQo+IHRoaXMgdGVzdFxuIik7DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICsNCj4gKwljcmVh
dGVfdm1fYW5kX3F1ZXVlKGdwdTEsIGVjaSwgJnZtWzBdLCAmZXhlY19xdWV1ZVswXSk7DQo+ICsJ
Y3JlYXRlX3ZtX2FuZF9xdWV1ZShncHUyLCBlY2ksICZ2bVsxXSwgJmV4ZWNfcXVldWVbMV0pOw0K
PiArDQo+ICsJZGF0YSA9IGFsaWduZWRfYWxsb2MoU1pfMk0sIFNaXzRLKTsNCj4gKwlpZ3RfYXNz
ZXJ0KGRhdGEpOw0KPiArCWFkZHIgPSB0b191c2VyX3BvaW50ZXIoZGF0YSk7DQo+ICsNCj4gKwlz
dG9yZV9kd29yZF9iYXRjaF9pbml0KGdwdTEtPmZkLCB2bVswXSwgYWRkciwgJmJhdGNoX2JvWzBd
LA0KPiAmYmF0Y2hfYWRkclswXSwgMTApOw0KPiArCXN0b3JlX2R3b3JkX2JhdGNoX2luaXQoZ3B1
Mi0+ZmQsIHZtWzFdLCBhZGRyLCAmYmF0Y2hfYm9bMV0sDQo+ICZiYXRjaF9hZGRyWzFdLCAyMCk7
DQo+ICsNCj4gKwl4ZV9tdWx0aWdwdV9tYWR2aXNlKGdwdTEtPmZkLCB2bVswXSwgYWRkciwgU1pf
NEssDQo+ICsJCQnCoMKgwqAgMCwgRFJNX1hFX01FTV9SQU5HRV9BVFRSX1BSRUZFUlJFRF9MT0Ms
DQo+ICsJCQnCoMKgwqAgRFJNX1hFX1BSRUZFUlJFRF9MT0NfREVGQVVMVF9TWVNURU0sIDAsDQo+
IDAsIGV4ZWNfcXVldWVbMF0pOw0KPiArDQo+ICsJaWd0X2luZm8oIlRlc3RpbmcgR1BVMSBWTSB0
cnlpbmcgdG8gcHJlZmVyIEdQVTIncyBWUkFNDQo+IChzaG91bGQgZmFpbClcbiIpOw0KPiArDQo+
ICsJLyogVGhpcyBTSE9VTEQgZmFpbCAtIEdQVTEncyBWTSBjYW5ub3QgcHJlZmVyIEdQVTIncyBW
UkFNICovDQo+ICsJeGVfbXVsdGlncHVfbWFkdmlzZShncHUxLT5mZCwgdm1bMF0sIGFkZHIsIFNa
XzRLLA0KPiArCQkJwqDCoMKgIDAsIERSTV9YRV9NRU1fUkFOR0VfQVRUUl9QUkVGRVJSRURfTE9D
LA0KPiArCQkJwqDCoMKgIGdwdTItPmZkLCAwLCBncHUyLT52cmFtX3JlZ2lvbnNbMF0sDQo+IGV4
ZWNfcXVldWVbMF0pOw0KPiArDQo+ICsJLyogVGhpcyBTSE9VTEQgYWxzbyBmYWlsIC0gR1BVMidz
IFZNIGNhbm5vdCBwcmVmZXIgR1BVMSdzDQo+IFZSQU0gKi8NCj4gKwl4ZV9tdWx0aWdwdV9tYWR2
aXNlKGdwdTItPmZkLCB2bVsxXSwgYWRkciwgU1pfNEssDQo+ICsJCQnCoMKgwqAgMCwgRFJNX1hF
X01FTV9SQU5HRV9BVFRSX1BSRUZFUlJFRF9MT0MsDQo+ICsJCQnCoMKgwqAgZ3B1MS0+ZmQsIDAs
IGdwdTEtPnZyYW1fcmVnaW9uc1swXSwNCj4gZXhlY19xdWV1ZVswXSk7DQo+ICsNCj4gKwlzZXR1
cF9zeW5jKCZzeW5jWzBdLCAmc3luY19hZGRyWzBdLCBCSU5EX1NZTkNfVkFMKTsNCj4gKwlzZXR1
cF9zeW5jKCZzeW5jWzFdLCAmc3luY19hZGRyWzFdLCBCSU5EX1NZTkNfVkFMKTsNCj4gKw0KPiAr
CS8qIEZvciBzaW11bHRhbmVvdXMgYWNjZXNzIG5lZWQgdG8gY2FsbCB4ZV93YWl0X3VmZW5jZSBm
b3INCj4gYm90aCBncHVzIGFmdGVyIHByZWZldGNoICovDQo+ICsJeGVfbXVsdGlncHVfcHJlZmV0
Y2goZ3B1MS0+ZmQsIHZtWzBdLCBhZGRyLCBTWl80SywgJnN5bmNbMF0sDQo+ICsJCQnCoMKgwqDC
oCBzeW5jX2FkZHJbMF0sIGV4ZWNfcXVldWVbMF0sIGZsYWdzKTsNCj4gKwlmcmVlKCh2b2lkICop
c3luY19hZGRyWzBdKTsNCj4gKw0KPiArCXhlX211bHRpZ3B1X3ByZWZldGNoKGdwdTItPmZkLCB2
bVsxXSwgYWRkciwgU1pfNEssICZzeW5jWzFdLA0KPiArCQkJwqDCoMKgwqAgc3luY19hZGRyWzFd
LCBleGVjX3F1ZXVlWzFdLCBmbGFncyk7DQo+ICsJZnJlZSgodm9pZCAqKXN5bmNfYWRkclsxXSk7
DQo+ICsNCj4gKwlmb3IgKGludCBpID0gMDsgaSA8IDEwMDsgaSsrKSB7DQo+ICsJCXN5bmNfYWRk
clswXSA9ICh2b2lkICopKChjaGFyICopYmF0Y2hfYWRkclswXSArDQo+IFNaXzRLKTsNCj4gKwkJ
c3luY1swXS5hZGRyID0gdG9fdXNlcl9wb2ludGVyKCh1aW50NjRfdA0KPiAqKXN5bmNfYWRkclsw
XSk7DQo+ICsJCXN5bmNbMF0udGltZWxpbmVfdmFsdWUgPSBFWEVDX1NZTkNfVkFMOw0KPiArDQo+
ICsJCXN5bmNfYWRkclsxXSA9ICh2b2lkICopKChjaGFyICopYmF0Y2hfYWRkclsxXSArDQo+IFNa
XzRLKTsNCj4gKwkJc3luY1sxXS5hZGRyID0gdG9fdXNlcl9wb2ludGVyKCh1aW50NjRfdA0KPiAq
KXN5bmNfYWRkclsxXSk7DQo+ICsJCXN5bmNbMV0udGltZWxpbmVfdmFsdWUgPSBFWEVDX1NZTkNf
VkFMOw0KPiArCQkqc3luY19hZGRyWzBdID0gMDsNCj4gKwkJKnN5bmNfYWRkclsxXSA9IDA7DQo+
ICsNCj4gKwkJeGVfZXhlY19zeW5jKGdwdTEtPmZkLCBleGVjX3F1ZXVlWzBdLCBiYXRjaF9hZGRy
WzBdLA0KPiAmc3luY1swXSwgMSk7DQo+ICsJCWlmICgqc3luY19hZGRyWzBdICE9IEVYRUNfU1lO
Q19WQUwpDQo+ICsJCQl4ZV93YWl0X3VmZW5jZShncHUxLT5mZCwgKHVpbnQ2NF90DQo+ICopc3lu
Y19hZGRyWzBdLCBFWEVDX1NZTkNfVkFMLA0KPiArCQkJCcKgwqDCoMKgwqDCoCBleGVjX3F1ZXVl
WzBdLCBOU0VDX1BFUl9TRUMgKg0KPiAxMCk7DQo+ICsJCXhlX2V4ZWNfc3luYyhncHUyLT5mZCwg
ZXhlY19xdWV1ZVsxXSwgYmF0Y2hfYWRkclsxXSwNCj4gJnN5bmNbMV0sIDEpOw0KPiArCQlpZiAo
KnN5bmNfYWRkclsxXSAhPSBFWEVDX1NZTkNfVkFMKQ0KPiArCQkJeGVfd2FpdF91ZmVuY2UoZ3B1
Mi0+ZmQsICh1aW50NjRfdA0KPiAqKXN5bmNfYWRkclsxXSwgRVhFQ19TWU5DX1ZBTCwNCj4gKwkJ
CQnCoMKgwqDCoMKgwqAgZXhlY19xdWV1ZVsxXSwgTlNFQ19QRVJfU0VDICoNCj4gMTApOw0KPiAr
CX0NCj4gKw0KPiArCWlndF9hc3NlcnRfZXEoKih1aW50NjRfdCAqKWFkZHIsIDIwKTsNCj4gKw0K
PiArCW11bm1hcCgodm9pZCAqKWJhdGNoX2FkZHJbMF0sIEJBVENIX1NJWkUoZ3B1MS0+ZmQpKTsN
Cj4gKwltdW5tYXAoKHZvaWQgKiliYXRjaF9hZGRyWzFdLCBCQVRDSF9TSVpFKGdwdTItPmZkKSk7
DQo+ICsJYmF0Y2hfZmluaShncHUxLT5mZCwgdm1bMF0sIGJhdGNoX2JvWzBdLCBiYXRjaF9hZGRy
WzBdKTsNCj4gKwliYXRjaF9maW5pKGdwdTItPmZkLCB2bVsxXSwgYmF0Y2hfYm9bMV0sIGJhdGNo
X2FkZHJbMV0pOw0KPiArCWZyZWUoZGF0YSk7DQo+ICsNCj4gKwljbGVhbnVwX3ZtX2FuZF9xdWV1
ZShncHUxLCB2bVswXSwgZXhlY19xdWV1ZVswXSk7DQo+ICsJY2xlYW51cF92bV9hbmRfcXVldWUo
Z3B1Miwgdm1bMV0sIGV4ZWNfcXVldWVbMV0pOw0KPiArfQ0KPiArDQo+IMKgc3RhdGljIHZvaWQN
Cj4gwqBncHVfbWVtX2FjY2Vzc193cmFwcGVyKHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKnNyYywN
Cj4gwqAJCcKgwqDCoMKgwqDCoCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpkc3QsDQo+IEBAIC0x
MjM2LDYgKzEzNDUsMTggQEAgZ3B1X3NpbXVsdF90ZXN0X3dyYXBwZXIoc3RydWN0IHhlX3N2bV9n
cHVfaW5mbw0KPiAqc3JjLA0KPiDCoAltdWx0aWdwdV9hY2Nlc3NfdGVzdChzcmMsIGRzdCwgZWNp
LCBmbGFncyk7DQo+IMKgfQ0KPiDCoA0KPiArc3RhdGljIHZvaWQNCj4gK2dwdV9jb25mbGljdF90
ZXN0X3dyYXBwZXIoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqc3JjLA0KPiArCQkJwqAgc3RydWN0
IHhlX3N2bV9ncHVfaW5mbyAqZHN0LA0KPiArCQkJwqAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2UgKmVjaSwNCj4gKwkJCcKgIHVuc2lnbmVkIGludCBmbGFncykNCj4gK3sNCj4g
KwlpZ3RfYXNzZXJ0KHNyYyk7DQo+ICsJaWd0X2Fzc2VydChkc3QpOw0KPiArDQo+ICsJY29uZmxp
Y3RpbmdfbWFkdmlzZShzcmMsIGRzdCwgZWNpLCBmbGFncyk7DQo+ICt9DQo+ICsNCj4gwqBzdGF0
aWMgdm9pZA0KPiDCoHRlc3RfbWdwdV9leGVjKGludCBncHVfY250LCBzdHJ1Y3QgeGVfc3ZtX2dw
dV9pbmZvICpncHVzLA0KPiDCoAnCoMKgwqDCoMKgwqAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2UgKmVjaSwNCj4gQEAgLTEyNTMsNiArMTM3NCw4IEBAIHRlc3RfbWdwdV9leGVj
KGludCBncHVfY250LCBzdHJ1Y3QNCj4geGVfc3ZtX2dwdV9pbmZvICpncHVzLA0KPiDCoAkJZm9y
X2VhY2hfZ3B1X3BhaXIoZ3B1X2NudCwgZ3B1cywgZWNpLA0KPiBncHVfZmF1bHRfdGVzdF93cmFw
cGVyLCBmbGFncyk7DQo+IMKgCWlmIChmbGFncyAmIE1VTFRJR1BVX0NPTkNfQUNDRVNTKQ0KPiDC
oAkJZm9yX2VhY2hfZ3B1X3BhaXIoZ3B1X2NudCwgZ3B1cywgZWNpLA0KPiBncHVfc2ltdWx0X3Rl
c3Rfd3JhcHBlciwgZmxhZ3MpOw0KPiArCWlmIChmbGFncyAmIE1VTFRJR1BVX0NPTkZMSUNUKQ0K
PiArCQlmb3JfZWFjaF9ncHVfcGFpcihncHVfY250LCBncHVzLCBlY2ksDQo+IGdwdV9jb25mbGlj
dF90ZXN0X3dyYXBwZXIsIGZsYWdzKTsNCg0KSGVyZSwgcmF0aGVyIHRoYW4gYWRkaW5nIGEgc3Bl
Y2lmaWMgdGVzdCBmb3IgdGhpcywgU2luY2UgeW91IGFscmVhZHkNCmludHJvZHVjZSBhIE1VTFRJ
R1BVX0NPTkZMSUNUIGZsYWcsIEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8ganVzdCBoYXZlDQp0
aGlzIGZsYWcgc3dhcCB0aGUgbWFkdmlzZSByZWdpb25zIGluIHRoZSBvdGhlciB0ZXN0cyBzbyB0
aGF0IGFsbCBvdGhlcg0KdGVzdHMgYXJlIHJ1biB3aXRoIGEgQ09ORkxJQ1QgdmFyaWFudC4NCg0K
VGhhbmtzLA0KVGhvbWFzDQoNCg0KDQo+IMKgfQ0KPiDCoA0KPiDCoHN0cnVjdCBzZWN0aW9uIHsN
Cj4gQEAgLTEyOTAsNiArMTQxMyw4IEBAIGlndF9tYWluDQo+IMKgCQl7ICJwYWdlZmF1bHQtcHJl
ZmV0Y2giLCBNVUxUSUdQVV9QUkVGRVRDSCB8DQo+IE1VTFRJR1BVX1BGQVVMVF9PUCB9LA0KPiDC
oAkJeyAiY29uY3VycmVudC1hY2Nlc3MtYmFzaWMiLCBNVUxUSUdQVV9CQVNJQyB8DQo+IE1VTFRJ
R1BVX0NPTkNfQUNDRVNTIH0sDQo+IMKgCQl7ICJjb25jdXJyZW50LWFjY2Vzcy1wcmVmZXRjaCIs
IE1VTFRJR1BVX1BSRUZFVENIIHwNCj4gTVVMVElHUFVfQ09OQ19BQ0NFU1MgfSwNCj4gKwkJeyAi
Y29uZmxpY3RpbmctbWFkdmlzZS1iYXNpYyIsIE1VTFRJR1BVX0JBU0lDIHwNCj4gTVVMVElHUFVf
Q09ORkxJQ1QgfSwNCj4gKwkJeyAiY29uZmxpY3RpbmctbWFkdmlzZS1wcmVmZXRjaCIsIE1VTFRJ
R1BVX1BSRUZFVENIDQo+IHwgTVVMVElHUFVfQ09ORkxJQ1QgfSwNCj4gwqAJCXsgTlVMTCB9LA0K
PiDCoAl9Ow0KPiDCoA0KDQo=

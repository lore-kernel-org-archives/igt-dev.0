Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029FCC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 11:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73F910E6BF;
	Wed, 22 Jan 2025 11:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzK864lH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C2B10E6BF
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737544837; x=1769080837;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=5WTY/fLJPsDCH9d5QcHjJsJe+PnKWsdknBbEiRDx6bM=;
 b=nzK864lHBuKPHAMGpdM8qYluuwLX63prks6xbdvGJNa7mkumhIlKW/eY
 7gZcroiIr1mZG/mgXJL+mNQvDr54nSt8CmkAJKrfaiPlOfCJlgUiQgmFX
 31gKZXNdotQf1Uf2i+DoknnZzJozl4jVTEZtJAHeohwejLFo4xVCdLEOh
 miWhLd65hysci1Li3jwECcLdj7ePILgt4K3+WUe9xwBxRkkq/2k8k7Me+
 bHgBih70qSixmFA8448hVXdiMPHhS1qP6O+KQfaSZdd3uvjxpzdxca2rO
 Sh4mCqam7TScmJcK0xzkBf7+5ZNaSYXcjAQhYyehhch5eQbahnyVHdBNg g==;
X-CSE-ConnectionGUID: 7WgBNCepSIGi1hkcYqAbtA==
X-CSE-MsgGUID: mSMD0U8bTHK5Ai6zJHhAXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48591685"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48591685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 03:20:37 -0800
X-CSE-ConnectionGUID: XE/mV9PCTrCYMehacpUXXg==
X-CSE-MsgGUID: 2fnOjXtTQBivXC5YZtMD+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107994695"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 03:20:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 03:20:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 03:20:36 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 03:20:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrshtGbKYs8l8bQtEss4eD+MvS00gzYL+wg4EXMkraNoUubEBavd1zYmio6xOLw4HFOGECsQKvvMVaggFKOzYhqLXwf6/W8760S1JPnb2PhCPH1DXUsLUkVNGZkvASTyXz2zBaRNPw3WNfnhmXfi1VMTdfbuNOVpP6ihsjRs/t4Tve68egDLNJSrYzf4rgieJWpp+RRZ6PFgY+jm1il1A4DYxTtW0mk60Th9JDFdH9YaWo/iaONmYU2Wyo/dmPTV6V+2u/jI5XyTrFb0SLGnIlneC6s8N4cDLkJQ2FthJDCIkCa/fdNeTxxrzubAksU1MGV1pn1ib8nQWPrzd12N2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xbdqhJx/XUTOMmHXaXrVF7ypvblItVtqte6bFIDdiQ=;
 b=bTFW9LTeV7B49Kpp73M47qeSmftd3XMBYbuk2CsfjsKFDQkydRME+pni1KEM4OLZYJVYCL1PBvZeT3/m3VwnjxS9EfeG+ZodXMXXr+B6ZXm9ghH8BoRPuc4ijCd90jV8M8wtWIt2dxYjQZ3QyYYarfXZ0WFvZkFoINsw5fFN0ZsLz6MAoOl26+D8Q1C0wctkdcuSAmZaIhvIa4OC622ShNo3vFCr72ZhO1SoLqxbiDxXWjTOg93nhMYBl9KA7Fm3o0AAqm68kLKficK8SJJtZRfaCrmSI0B2NdHWg5IOzB7lr6bVEk6z/4hFtdgI1bbhuWMwKVAz2EOhBkl9wpLCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV8PR11MB8560.namprd11.prod.outlook.com (2603:10b6:408:1e7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 11:20:29 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 11:20:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250121225733.808978-3-lucas.demarchi@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-3-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 2/7] runner/settings: Use wrapper functions for
 each type
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jan 2025 08:20:24 -0300
Message-ID: <173754482486.5500.2959553679406990943@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0349.namprd04.prod.outlook.com
 (2603:10b6:303:8a::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV8PR11MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b55250-3bb3-4f40-1e62-08dd3ad6c6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFVBRGJpWXNlSnJjU291R3BWd1RCQXh6ZXgzNGpINmFGdTZnVyt3WVRjdFp1?=
 =?utf-8?B?RFZ5enE1SmREMkJaMFp6ZVFKN1pqYURvazNtVUFSNVI0R1o3NjI4NkRKL29D?=
 =?utf-8?B?SFFiUUdraUJEdEVFYkhEeTFCd05ZMEJEaDRYT1BYN1E0S1htNlQ4Z0ZvN2Ri?=
 =?utf-8?B?RVZWb0tlSkRablU3YjJMNjZUOG1kaWJ0dTJpRmxSaGJ0c21TRytVY0FoRmFB?=
 =?utf-8?B?NFlZSnZzanNtSWxYVDh0MjQ2ZWdjalk1bEh4QW1mVUhmanZNQVVtM1ZDV24y?=
 =?utf-8?B?ejMvZDdUc0FpRHBMV0lFVWJ6MmFkaXNUczJBaWVFb1poZjd3NzRYTnRpeHBG?=
 =?utf-8?B?bmFhSDlSWmNtVnc4RmdRbGdJblp6bGtSdGhmYlFEMmJVclB3MmRMT2xVdXdY?=
 =?utf-8?B?S2NnTUZ2UjhPTjhIM2ZJUlFzRnUvbmZtUjg1eFFXMm9GdW01MHFaZE94OVBP?=
 =?utf-8?B?aVk5aVlCY2x2dDhOcDNOcHdYbE4rZkpya2hpTEFZYnNOMmkvVTBCNnFkRG5C?=
 =?utf-8?B?dUk5bVlxV1dSZEpIUG5Wa3lJeHZxOVJoLzY2R2k1V0REeXB5ajl3MEdkQlJk?=
 =?utf-8?B?ZXNQa1ZTZU9qSWR2cEtUeGNxNk9JRUF5d0h4ZU85elh0SFZIVU5YaHFUSUFm?=
 =?utf-8?B?Z1BBQ2g1V3pscVEzcisxWmdnc0hianZxbDNua085QndLcm9PQlNwT2RGdUN2?=
 =?utf-8?B?SkRJakJRMk5yNG42c0g3MzNhaUdhTDB6akhIanNqUm1TaDByVE9HSlNxc0FM?=
 =?utf-8?B?UkdvdTFhVWhQNFAzNWR4LzVKYjlkbnMvY05BQ1B0TnpoQ0ZmSlQxWmlKSTBz?=
 =?utf-8?B?bVFsM3E4NElZbEpIZEcvTVlwaUNoc2xXYXhHN3dJNDk4S00wby95TjUvcGtu?=
 =?utf-8?B?UWsreUNDSHIyQ0Y0UTlSM05pQnY3bXo1dDk2S2tKMUVSaUNlMlgrcHQ2RmJ2?=
 =?utf-8?B?UDBBbXZiN3FsYytwMkVoYjN5WHA4SGdyUDNCTTluendjMFVvRm1EbWtBWDhm?=
 =?utf-8?B?VnkvRGhPL1NiLzRTQUxpbk05MWg5cFJlZWJLVXNkT29zZ0Nvd2NueUhjbEo4?=
 =?utf-8?B?NWR6LzFIUHI1eDZyTS8rRUdkZXpOdlJQSjNQZ2o2RzAvZ1lRbUp2OFhKM1Br?=
 =?utf-8?B?OUVBeHdPVE84aHZHRUpxZEoyL2RuUm5qRUJBTElmUVBpWlpNdG1UcmVPYlRQ?=
 =?utf-8?B?NlBTREZQcEk4U2FPZENoalZZdVhvajAvY0lyT0phVitFd081V0dTMDJmWFdl?=
 =?utf-8?B?VUFlc2J2bzc0ZDNlZnNmYUd2UmcyT0VrcjUrM0ZVVU1pY2F1L04rTnl1TTlJ?=
 =?utf-8?B?bHZFMEluR3c5Mm90eWlaSndPVUNSQ1VRYUwyU0oyaDhzZGxLU1VVRE9kQTcz?=
 =?utf-8?B?cXFvZE90eWJJNmlHaFhKQ3BNcnNzUWxxbjZoZ0I0azluUWF5TUJKbFJGMWMz?=
 =?utf-8?B?M0JEazNKbWh3cFRYOUY2eDdyRzN1blVNTjhnUjVwK3c3TlNON0ZuaTRuaHBl?=
 =?utf-8?B?d09Bd051QnZHT0dYUm1HN0dvK1lTL0p5UkZLS3AzbGI1d1hvbzlhK1M4dE9G?=
 =?utf-8?B?emFYSzdPUmJOWjJ5VG5iNUxqU1lndU5NZFpVT1pENkZsNVdCV0czS0NhRmVU?=
 =?utf-8?B?OEdnWjF2Ym9wQllaT01WVXM1ZnNsb3dFMTRENkI5bFhpRzFvZC9GVUhvckVW?=
 =?utf-8?B?SkxsdTNPdFVsUEUrMnc4MjdSSFVsTmtQcUhRaEZnRC90ZjRrcVJnNFVnL1ha?=
 =?utf-8?B?NVBYdzFLdFd0ZHY5dHlZNjFOM3VTWFI2UEU1cUE3Y2k1Qm9oamhRR2VRVDhk?=
 =?utf-8?B?NXJ5dEtLdFBZRmJRSkY2K0Y2MjB1b2F4bUwzRGtWMVFWRmJwZ3gvUGl1TGV2?=
 =?utf-8?Q?iwLf26lMfRlRj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjVLRTJ4aGZxNzBtUW5sRUxNeThiWGNDbUJPaUdZWFYreHBwamV0dFZWK3ZQ?=
 =?utf-8?B?Mnh3T2NiYlovYWtEVFFQYUZvMlUxQTRWZmRuS1QxekprbitZYUhjeHJRMnlP?=
 =?utf-8?B?UzIwZk9RVXplMEZMZGltUld1cFExY0NFSW95WnpLZXNMdEVrRDJrNjExVVJw?=
 =?utf-8?B?cmpEOUVwa0lwREprNjRib1FoVWY1VTZwbjdyVWJmdlYydDh3UWJWZW9TMjFn?=
 =?utf-8?B?dzk2Z0E2SnUwRzdmdWxEQVVReDFDSzJvMFFxQWNSU3BPQzJ1dkYvTFB6VnE2?=
 =?utf-8?B?N3luNXhnZkRUVnQzWGlGK3lpNG5lZTJGK2JoSDl0TUZRUWpnM2pNWTQ0d0Y2?=
 =?utf-8?B?bG5VWURIMytYdWcwUC9NL3VwYVR1VEx4S0dEcFdZUjdYZVoycGt3WFpqWlY2?=
 =?utf-8?B?a0ZlQ2FscENkNnRHbXVlaGpQZW1acTZ0b1lWNW9Mb29HcjlSbHJvKzYrZVpM?=
 =?utf-8?B?bGZLZEhaNEhqK2xIUUNSY2YvR0ZmWTRPakZUUWtsdmE1MlBlUHc3QXRPeWhO?=
 =?utf-8?B?SUxxNmM4Nks2UTU4NzhzRll3MmVVdmxzQUpzVnplTEg4eHlhOU5kODlqK0No?=
 =?utf-8?B?OFUwejVnSG03VGROK1FDN3lGZklVbVRRSmUzQTQ5b1RaU0c4NU5CeUdxZllH?=
 =?utf-8?B?bUltL2laeTJZdE91cjZ0OXNsRmRtVUFrNnN5aUdEZyttMkJxWXMxb0hjOWpn?=
 =?utf-8?B?cVc3OG0rL2FuNFVTR2dHR1oyeWZEQ2FQRlZNMFo5N0lNVWpDQjdlTDdBYkFj?=
 =?utf-8?B?OXc3dHZxcDBzWUlnM29XeXZQcXI3WXg2ZVl1STlvMDMxSUxJTGZvOWNjdjQ0?=
 =?utf-8?B?Yi9BbGFsWmZRY3Vkc29ydGNuTTRlaXZxOW1pa0gvSDYvVi9LUnhaZzBkd0Mv?=
 =?utf-8?B?bitUTGp5MmJVZ09ST0VzUUhUMnFEYm5tRmJsM3BWc3hFeklpTi9JbkJlcUlo?=
 =?utf-8?B?TlNoaU96eXNsczNTU3JZVzdlN0oyKytMV3NqTmJranZXNFF5SGJiaUE4WXlY?=
 =?utf-8?B?R1JSVG00dkdCRlRCSkpnM0MrYWZKSDAzd01VQWpiN010WVkycVlpQzlCZ3E3?=
 =?utf-8?B?N2kvVXFRMFh1SThOSVI5ZTlwbDNTejRhU2tlRWx0MGk4L2JvSGk1YmlsMXhN?=
 =?utf-8?B?eHZZT2NKenBzNmhQREtTdExRcm9lVWJSbk5JbTJnZHZEeUM4VFNPajJjMjJP?=
 =?utf-8?B?U0YwTHFmeVArbEEydEhjOUdtZWZwVGYwMzJvelZMbkpTT2FuczA0bmxRWlRs?=
 =?utf-8?B?ZksrNm9PazMrdm9QcUhWeVIyMENyRFVhUTYvZERXRzdDcnRLVGQvbXcvTXpQ?=
 =?utf-8?B?NVZBcmNPOUR5SXJ0L1U5cFlhT2tHampraFAyL3hkVitwQW1TaDQ1a28zMzlQ?=
 =?utf-8?B?M25uU1BYNDdsK29xQi9FSDZCZWxKdUhTdm5KZnl3WnUwZ0JZZUhBYk91TFFz?=
 =?utf-8?B?S0tJVUxzU1NnY0tHOCtEZEpHSGdKbWRmSHIyVlVIZ21YSDd4cXZWNUt6UEZv?=
 =?utf-8?B?ZDkyajVta1Azd2xCL3ZMS3BVQ0xVOWQ5aEpPSGF5cmQxeUk4US9qQzBhTGhC?=
 =?utf-8?B?N296K2NHcnRvTjlIL2lkZGIyamRrUjVzbS9rNVE0RXY3eHllSVlyWnJNeHFT?=
 =?utf-8?B?T29taVZ3bk5SenJaRWN5dHdFZGV6djFuOHo2MnJaTUsvSmUzbUxpeUVhWDNQ?=
 =?utf-8?B?SmFVa3RTdlpDQ0p5ckYzZDlyL3VBZThwL25XL0FUZlZUdXhaSnppc25PdEVP?=
 =?utf-8?B?NlNkMlYyREZraGFrcjNEczJ5UCtFaUhDY3paQ1JjRHp2OU5Ja2ZBeENuc0g4?=
 =?utf-8?B?bXRhSWM3aTZEME1IYnNNajh4TndaYjd1d2tjNHd0QTVPd0xic0hBRUFKQ0di?=
 =?utf-8?B?RW9Bc3FEdEg3N011YWNadk5udTRIQk9EQitFcFBNTDVxQWVjdnplbFhJSDcv?=
 =?utf-8?B?TFVpYWhybERhQ0Uxbjg1dzdLanV3cldtSzlIZWdhcWZOaFRiWDhPSFNaaTBL?=
 =?utf-8?B?Vk4yU0VjWS9hOG5qSlBxemp6Z2p6TUk3bzljRVVONHV6bWFFZngxUU5kWmEw?=
 =?utf-8?B?VG9idGxSWU9heWw2OVc2V05qUytBTUU4a2hSZXY2ZG5GS1NLM2hqb2trVTlr?=
 =?utf-8?B?azV3TGNaeGVEOFFPOFBwRy9udkYvdUh2MWhmOGIyRG1vNVdSV25nWEQzTEtM?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b55250-3bb3-4f40-1e62-08dd3ad6c6b2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 11:20:28.9701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJ7LnOY6pz1nYpdD7hF/p9XTY+8gzg7WMMq63pc8PFczdBn4aePnaZQHGtFj0WMilW/Jy46d1uEpMl5YuqW8Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8560
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

Quoting Lucas De Marchi (2025-01-21 19:57:28-03:00)
>Simplify assigning the variables by using wrapper functions. This avoids
>calling atoi() on every iteration and will allow to simplify the
>strdup() calls in future.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> runner/settings.c | 74 ++++++++++++++++++++++++++++-------------------
> 1 file changed, 45 insertions(+), 29 deletions(-)
>
>diff --git a/runner/settings.c b/runner/settings.c
>index 80d95be5b..13694a51c 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -1152,43 +1152,60 @@ bool serialize_settings(struct settings *settings)
> #undef SERIALIZE_LINE
> }
>=20
>-bool read_settings_from_file(struct settings *settings, FILE *f)
>+static int parse_int(char **pval)
>+{
>+        return atoi(*pval);
>+}
>+
>+static unsigned long parse_ul(char **pval)
>+{
>+        return strtoul(*pval, NULL, 10);
>+}
>+
>+static char *parse_str(char **pval)
> {
>-#define PARSE_LINE(s, name, val, field, write)        \
>+        return *pval ? strdup(*pval) : NULL;
>+}

Why do we need char **pval for those functions instead of simply char
*val?

>+
>+#define PARSE_LINE(s, name, val, field, _f)        \
>         if (!strcmp(name, #field)) {                \
>-                s->field =3D write;                \
>+                s->field =3D _f(&val);                \
>                 goto cleanup;                        \
>         }
>+#define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, pa=
rse_int)
>+#define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, pa=
rse_ul)
>+#define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, pa=
rse_str)

I would have kept these inside read_settings_from_file(), since it is
very specific for that function.

(And in a follow-up patch even remove the s, name and val parameters to
make it simpler.)

>=20
>+bool read_settings_from_file(struct settings *settings, FILE *f)
>+{
>         char *name =3D NULL, *val =3D NULL;
>=20
>         settings->dmesg_warn_level =3D -1;
>=20
>         while (fscanf(f, "%ms : %m[^\n]", &name, &val) =3D=3D 2) {
>-                int numval =3D atoi(val);
>-                PARSE_LINE(settings, name, val, abort_mask, numval);
>-                PARSE_LINE(settings, name, val, disk_usage_limit, strtoul=
(val, NULL, 10));
>-                PARSE_LINE(settings, name, val, test_list, val ? strdup(v=
al) : NULL);
>-                PARSE_LINE(settings, name, val, name, val ? strdup(val) :=
 NULL);
>-                PARSE_LINE(settings, name, val, dry_run, numval);
>-                PARSE_LINE(settings, name, val, allow_non_root, numval);
>-                PARSE_LINE(settings, name, val, facts, numval);
>-                PARSE_LINE(settings, name, val, sync, numval);
>-                PARSE_LINE(settings, name, val, log_level, numval);
>-                PARSE_LINE(settings, name, val, overwrite, numval);
>-                PARSE_LINE(settings, name, val, multiple_mode, numval);
>-                PARSE_LINE(settings, name, val, inactivity_timeout, numva=
l);
>-                PARSE_LINE(settings, name, val, per_test_timeout, numval)=
;
>-                PARSE_LINE(settings, name, val, overall_timeout, numval);
>-                PARSE_LINE(settings, name, val, use_watchdog, numval);
>-                PARSE_LINE(settings, name, val, piglit_style_dmesg, numva=
l);
>-                PARSE_LINE(settings, name, val, dmesg_warn_level, numval)=
;
>-                PARSE_LINE(settings, name, val, prune_mode, numval);
>-                PARSE_LINE(settings, name, val, test_root, val ? strdup(v=
al) : NULL);
>-                PARSE_LINE(settings, name, val, results_path, val ? strdu=
p(val) : NULL);
>-                PARSE_LINE(settings, name, val, enable_code_coverage, num=
val);
>-                PARSE_LINE(settings, name, val, cov_results_per_test, num=
val);
>-                PARSE_LINE(settings, name, val, code_coverage_script, val=
 ? strdup(val) : NULL);
>+                PARSE_INT(settings, name, val, abort_mask);
>+                PARSE_UL(settings, name, val, disk_usage_limit);
>+                PARSE_STR(settings, name, val, test_list);
>+                PARSE_STR(settings, name, val, name);
>+                PARSE_INT(settings, name, val, dry_run);
>+                PARSE_INT(settings, name, val, allow_non_root);
>+                PARSE_INT(settings, name, val, facts);
>+                PARSE_INT(settings, name, val, sync);
>+                PARSE_INT(settings, name, val, log_level);
>+                PARSE_INT(settings, name, val, overwrite);
>+                PARSE_INT(settings, name, val, multiple_mode);
>+                PARSE_INT(settings, name, val, inactivity_timeout);
>+                PARSE_INT(settings, name, val, per_test_timeout);
>+                PARSE_INT(settings, name, val, overall_timeout);
>+                PARSE_INT(settings, name, val, use_watchdog);
>+                PARSE_INT(settings, name, val, piglit_style_dmesg);
>+                PARSE_INT(settings, name, val, dmesg_warn_level);
>+                PARSE_INT(settings, name, val, prune_mode);
>+                PARSE_STR(settings, name, val, test_root);
>+                PARSE_STR(settings, name, val, results_path);
>+                PARSE_INT(settings, name, val, enable_code_coverage);
>+                PARSE_INT(settings, name, val, cov_results_per_test);
>+                PARSE_STR(settings, name, val, code_coverage_script);
>=20
>                 printf("Warning: Unknown field in settings file: %s =3D %=
s\n",
>                        name, val);
>@@ -1210,9 +1227,8 @@ cleanup:
>         free(val);
>=20
>         return true;
>-
>-#undef PARSE_LINE
> }
>+#undef PARSE_LINE

Missing undef for the other macros here?

--
Gustavo Sousa

>=20
> /**
>  * read_env_vars_from_file() - load env vars from a file
>--=20
>2.48.0
>

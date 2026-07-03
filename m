Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6903DC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DD110F931;
	Fri,  3 Jul 2026 21:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k94pmRJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F154610F929
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112672; x=1814648672;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4AO3C7Dy4DC9qt8p+bXwyASBP1V5EOu3ARorugmV3i4=;
 b=k94pmRJ9SSt44RHHIxZri1c/r5rI1zJQgPPKh9szEGcfV6PfKf1eQ5fC
 5IGDoUS5brh5eMXA7WEMcNEBlFCteZk9emp6TLribyYudTEHvihgZzWKa
 cnQFSP6MZkhKw4qH4O8Si1xjoNzSOeJf2gEvHXHSE5wsxZofC4vEIzNnh
 uHdGAa2aGPwTEKwcSI18VddcZ0atIfwMkS/9SBsPUEFIw+DL3awnTSvlc
 vFcI1vbngco/QMU4GYn2PzUXhufqsoBmmd6uw/EuSbFvqh/YcDPgciWLO
 hGsx+l3MwQvPJ9L0ygDdaOtk8d0/GrUbfvGNIkOocm1y2DuKw1MA35nE3 Q==;
X-CSE-ConnectionGUID: RhR1v3lCRpWCwYfN5z2H9g==
X-CSE-MsgGUID: EH9Tl0qiTayL0PLmIHuLAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95366248"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="95366248"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:04:31 -0700
X-CSE-ConnectionGUID: mUeFqUEBQUWfw1ZGfYqt2A==
X-CSE-MsgGUID: DyQyMrZCQmy0Of560YXjUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="252718634"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:03:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:03:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:03:42 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTo95HpvavFFBtOjnzWiw0C4P/iKmmSYhSQ3MQD9lZ2f6VpdvmyazilcVSffTAffw4WUwetT1JEpl/Q+vghIc5fWdACtgajcHObVkktwdrqlx70hMtat4jMtQ8dx9sScVmBZxJaKNrWOdjLLh51KMo3aZCeavkpAT0ka88qSq0Q7L02EnTtyhWl2kESzoHVL0JNZZq9Vm7XlDndJl0v7KBVcPPZ35ygw9U7ir+1mRD49gXMQk7Py+bzUbIeDnk820nFp6FDih9JvRr0AmVvrLVXfhcPjM6/WGSNqOQ1BVoNDuHQ9ZfWPzhR0tScC17llBX4aJQNqtgF1HYmCEn0eAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gc0qEUSMdUnWmOvzGvx/OwcGpH1gv0AteUmK9vRfiUM=;
 b=c1V6VAs2O8ybiFQjWbdGG+DvHoUjL2CUhjt2PQfvTdAg3i4FrKKCrFpasLxbFxZ5Iw1EpJwQ1ntKusBBhvbE+4Hx8W2XQ7+nrf+1BGGbquztkm6BkMB8Z4+mzT+a6rZZT2Csxw7HYp+n4XvVN2LY59l3YWPutjNiuXJN/8fr+3HDAlQX3rn6tC+h3Fu1LvLHSI/4I08Hvqk4UjwHvv66IUMF9AXRp44bgKoLiY5DiEL+xXlGKnesUZEv0GCSwZ2RX+Q6av+AZPXwjSjnD5gklsGsbm2F49Jz2/7sZtnMRTRrdYionL8mMwg1BWvhV9osn77ptD1x0Fo83tZvekYQ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:03:39 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:03:39 +0000
Date: Fri, 3 Jul 2026 23:03:33 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 14/31] tools/intel_stepping: link with minimal
 sub-libraries
Message-ID: <ksupqgjbhxjerk2hg5u3tsup2z5s4ubjttu7boctfdtuw7jyou@5nhsahxb6o4p>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <177eb7b1b1bac7df3d653a207beb326023cb32ba.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <177eb7b1b1bac7df3d653a207beb326023cb32ba.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::29) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfcda4d-6178-4804-f9ef-08ded9468e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|23010399003|366016|1800799024|6133799003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UCuYLOXn+ybloaWYn2OFOsKKfBTgursW+AN3uVvU9U94zEGWBcQE0M2HhHaEPzChTz2s/m8tbNpxubMT494wOW5+v0pXUpkhRWb6bwfxyW7S10Sa9bUw0+zSJ0IO0HlKxk7cNmqgtS1UWsoHudn8LqYpaw0iqmFKYfhgbCxMmr3YWKewAkk+V7H6Hzg10UZIATo/nl1PhKqPGbk8Zg5ygPTB+CSEV4ov8epWdOt7v9zSybQXUSlP/ULEFoeQ2/hazboRFvrIfuJxVTBp6l8U0YQPirMArftvf/8L2TojNY2id4KkwIX5qkFdkX6rJSZjho2DmKLwZmtODWZfZrotjyt7OOZ1ghWDCUaECEc/K5MrfjB8s1KPnsbK5gjM+oifIbLYlvaOJR0TY6VcewRp7hRHG9N2bYIKxoVJNG2HuX2nartTLERGZ5vvqJMlRzfWwE60IqElmlOlAocS9zO3aIrRlvvMoru1XPqzGkC9TV7WeQP0VCeP7HkRtCEFVUs5kK+JhsoNnXLSNdD4r4HRg3+/3jtby6YaPme/WFnmBdKBYjbJFr93lY/dtfQHXXfBWpzs+MbE8rqGbh6ZK6NRZsO5KlOWU8EpIVnqteCQbEL6iNWm6DPW3qSuxLKM4amstHqb1wW7ZSug6Y+TqmnpC2cjpXLibXkmtWTVf7Gn0qs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am9nYUxib09pUytqd2hJd0k1cVFXM3g3Zi91UDhvS3M0TEh3VWtxMWFMaHFK?=
 =?utf-8?B?MFFFZERmcHFoYWZEWE1FYzI4Q3hGbERSdTRrTUFDL1ZsdXNsTTVFQnA2aW9R?=
 =?utf-8?B?NGZRMEkrd0tyY2RiOGpaVXBlNkJKWDI0SDVpQWhBaGprV1psM2xmSWVrdnBy?=
 =?utf-8?B?eTdFRWRtdkdabzY5UUlwV0JvMnhGZmhGaUppOTJ2T2l3bkwySjhMLzZ1NHov?=
 =?utf-8?B?QmZBbUdTS21NZE9hMXZ5ckt4SURZSGxWYzJpTCtDTDVEbFFENGp5dmMxa3pN?=
 =?utf-8?B?RXVtMjNaSGNtYS85aHFCaUlvWXFrS2cwcDJkU1VqTVdhcFRRRDl2dzZKdzIz?=
 =?utf-8?B?VjJNMDRjd0E2Q0FSWjUxOVl0a0FyQjM1YVJJY1doNHczNVJETFM4ZTZhZ0p4?=
 =?utf-8?B?b243TGhpNDhLaWlhY25ESUVRdDd3YUFUVVJNQUI2OVdQYVU5cjVweFhneVY0?=
 =?utf-8?B?eEtJTEhCSVd1Mm41NCsyMllHc1ZKaUJxRnhoRTBUOVZwUFVtMUhtcHIxVWNx?=
 =?utf-8?B?V2kzZ2pJbDNnb2huK29QdzZPOElVRTRobWdGY0RWL3hEb1RyaFROWk5xVHJ3?=
 =?utf-8?B?bENIM2lYdjNaRjFPeDRESVFKL0RZWTd3TzA1TlliTEpGcVgzQkJmRkY4Ym5a?=
 =?utf-8?B?QjhiRlArUlg2YnRiUWdWVDBRcXorWGRMNE5kYU9FcVVZZ2pnQU5aOGViNjM0?=
 =?utf-8?B?ZjdoWjVuNWRqMmZKcFRVTzNyazEycWg3aHhoc2EwbHV6cFRWZXc0ZStWYVRX?=
 =?utf-8?B?L21nZFgzZkxvWkY0TW5tLzVESXM0QVl2L1lyZ1kyWElWSS8rcU5qazVoeGVx?=
 =?utf-8?B?ZUp4ektpNG83M1hnWDVRL2VEaU44UHNsZ2w4ZWxqUUZsckJTYjYwYkl5MS9F?=
 =?utf-8?B?a25SSWFvNkVNd0dBbzZPeW9DMzgvT2E1d1BsWFlsaC83SjJMSGJYbDc0Q3Z2?=
 =?utf-8?B?VkhHdFNKeU9oYXpQUG5KU0txNitYQ09PaFR0S1dBMVJCTndFa2RXRmUvamEv?=
 =?utf-8?B?aTlQUTBFa2lvbU9Yc0kxcnBJRCtUZzJ6Zi94UnNiTGl4cUNuTGo1MFVXTEpm?=
 =?utf-8?B?SEFZbzRxTFpJRG5WbHBnUDAvUHh2R2NJb2doTDEybFNWeFZKYVYrUDk0aFRk?=
 =?utf-8?B?TTg4UHZNelhCeVdhcFd1VzBiZnF1UnBMYmNNYVlESGx3ZHZNU3N1ZFlYcUFL?=
 =?utf-8?B?dlpPRWNNczBOQXBWOEFvbXp0cDlPbXRpZm9KSFJ5c05IUVByMG05VEd4Z3pu?=
 =?utf-8?B?R1ExemJiOUhjVG1OZzZSQkdNSDgrU3o4bzhucnlZekdRQmVsQ3d3a3lveUZ3?=
 =?utf-8?B?b1J0SjJnMll5ZkZWc3lFQTdUTVM0eXA1azIyZk82TUwxV1pDSEU1Q0lPMkV5?=
 =?utf-8?B?alljcUtSbGpiOHJqV3pqVmhDUklsejB5M09Veng3UXRCMTNvVHZtSk81UDdC?=
 =?utf-8?B?LzIyYW16R2xTVVhKRkVsQWYzTE1uOUZ4Uk5ScGpRUzlYbk9ib2Q2VW1INTBo?=
 =?utf-8?B?TVBoZnhJSUhyeVVmOFlidXFFMzE1TStqdEd6MlIzQ2hUajQ1VERBSGJxeHJ2?=
 =?utf-8?B?VVFoMDVUV0xKSzJsanhJK0YxZy9ZUWVMeFozRjhNaXlMamw0V0lGdThJZmhv?=
 =?utf-8?B?ZDMwVWV4cllFV2tKNFpEbWl4cUF6VkNIY05EbFZZc2VyMC9EL0Q4SkpKckU5?=
 =?utf-8?B?MlIwdXk4anVzajRYeklsVDF6TVVMZEErSkVvYUlUeTdiUGpSV2VEYXhaOU8z?=
 =?utf-8?B?UEMwbnVlK1NVMTVjalpqY3hPN1BNNXBzN0ovcnA3NDJFWGx1L3Jka2duSFpO?=
 =?utf-8?B?U0FFc0w0UlIxNzBRVlpGVG1OdTdXbi9WWXZTR1pVMDZaWjNNVGRlem5HeEI2?=
 =?utf-8?B?VXJ4M0RycUZibXpDOFBMNDJ0TnQwM3Qyd0pOWjFFOHg3Ty9nNExJTXQzYmhy?=
 =?utf-8?B?RTUwS1o2MUN2Y29qdmRDTFE1NUdyb01pSVBvRCsrd01nSkVHR25TYlRra0tu?=
 =?utf-8?B?WWVQbmdoSWZXWEtCQlAxVkY2OHkrVDUvTVUrTzNZbFl1U2l5TnpEYkdsL3pX?=
 =?utf-8?B?ZnhGVnQ4ZFA0VWdzYUNtaDlJRHZLd2JXVFNSSjFvRnhXYXpBQmNWVUVyTnor?=
 =?utf-8?B?Y0JZbFJWdjFEWWYrSW96YzJ5N2FCSHBPUEd1RjdISGIzOXBZZ2FGMzFjUlR3?=
 =?utf-8?B?Y3UyalNpS3lpUmpCSUF1Mk51aUhLdE5wZmIyUDBYSEhGUzBaRGkzYnB1YlM2?=
 =?utf-8?B?VnFBR1paS2R3RjdZeGJWYTNydXpCU0tXZS9yZ282WGVKQkFFZThHdWk0bGE1?=
 =?utf-8?B?SHNFZ3AySFJwbTNtTndoQ1hWOGM1SVVuVGJweUQ3SHQ2V3ZlSm8rTTBQVjFZ?=
 =?utf-8?Q?BKWEd6Di2sbnHydGaGb1+qqLwCAVss8pBaQ3Jixx2GaV7?=
X-MS-Exchange-AntiSpam-MessageData-1: 05MThc/FtLoThaiw6e4FHJolLgJje0CFnfs=
X-Exchange-RoutingPolicyChecked: ahmQKOHD442KMCqX7wOcbL0bZkukwSWfFJduzvZ603GPKigATKJGHPQIyR4hVsMnzhJuUdOVQbYCEWesjQpJoCA2UcOnuFk0h9JhvwEHP1ZiykcbVg+9rdaFwmRAKqLJOWVrO63NWLx7mfkDI0URpwNpNl6hHIA6G92XsBB3NEbR5ibDDzaL4PrR456aLYY6zBeJC4iEi4fcmfftDfxPB+ksPuZXfAJVuYoDrq+1GP8RoS/L4HkDpJPa4ISjTP0dAd42y8JMO5QcZckgn9XDUIvvQuR3uXIq4JSYtokF8jc+gax2nFP61WMyejz2dgN7vxSNcqtJRvV4ml8zyZ1ArA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfcda4d-6178-4804-f9ef-08ded9468e4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:03:39.2992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9HI0PXA+f7iWx4h1788o0F6bZ/NIkWd9RTqHLFkAvNdnCUarel6oRH2IKP+b1DqR7eM1xH+v8xkRcbqFVNtd2vKQKbcddezjwPnAZVUj6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On 2026-07-03 at 16:28:48 GMT, Sebastian Brzezinka wrote:
> intel_stepping only needs the chipset tables and the small tool stub
> support used by those helpers, not the full libigt.so stack.
> 
> Switch to linking against lib_igt_chipset, lib_igt_tools_stub and
> libpciaccess.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 01400f53e..8eb346321 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -36,7 +36,6 @@ tools_progs = [
>  	'intel_pm_rpm',
>  	'intel_reg_checker',
>  	'intel_residency',
> -	'intel_stepping',
>  	'intel_tiling_detect',
>  	'intel_vbt_decode',
>  	'intel_watermark',
> @@ -70,6 +69,12 @@ executable('intel_gpu_frequency', 'intel_gpu_frequency.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_stepping', 'intel_stepping.c',
> +	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub,
> +	                    pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 

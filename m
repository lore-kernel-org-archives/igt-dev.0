Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A3D606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 05:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z/As6Lin
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C5A10E06F;
	Wed, 21 Oct 2026 04:59:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3129710E06F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 04:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792558744; x=1824094744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p9h4GMD5zINCzhmEOOQMPvIUhuh6B6ZS/cbqoMvV1rU=;
 b=Z/As6LinWW5IXGe8f76pZdLanuVc+1FCdWQ4ane6yHHCw19gqMxeaYr7
 0kiJm5YjPuKcXE2Rl6YdtzniD8sumIieNzNgkRX/zue5XeTrnlm6+JBs/
 +ikzJRC1WwIAtZ821OxeEJdnKpbViX9Xvhe1wCqZOJ6TmtNngWHmrQUU5
 NGirDqAXugrahFGKN+Xr7MoQN7rTBTbtSFILlsdrECa8iAglPKQ4ZaTDQ
 6Y6ZT0U7WqEmzHYa7Bm5Nx9Pg/pulQPyI3hMGWaRiUYx1iJb4vzbIkhbb
 sy32TGg8HrRGAMKwjxRgW0XrceoNDQwlafqB++FZn5DqIFL8osP4/Ly6I Q==;
X-CSE-ConnectionGUID: EBbjzGV5Qpqb262ZfO8bHw==
X-CSE-MsgGUID: 8lnOIX7bRVSNfZbzvhoouA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1172724"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1172724"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:59:04 -0700
X-CSE-ConnectionGUID: 6UlqjesZRzmYORUe3iiJjQ==
X-CSE-MsgGUID: LssO55fcTSeM5TtnkF7fHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3093945"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:59:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 21:59:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 21:59:03 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 21:59:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNvZSYpD1o4+2wD+RV+6yk/H+cRRxemFVyD6IdUoth52e/Zr76qKaZHeoki3BEWT8fDD5x1FMVca8vx8fM9MrViZJJ/lY9JmrzZAoBkJ12h7kn7cNDQ/cMQYvUxV5YvVGyTIS3TQLDK2+f/gzYXFJSAjgtzYqhOb2BsQ0y64v9CkMX0rObZIqAsI3CkU4I7srK8CYS8DfEN+gE/lZ7mkukEgMJ2he9hNLnFIEFpcbYC8GYkHQ/1Lx730Q3xAy7USEYQRVmrxilxJv+ujQgm9/2wQl8Z2TXEoYpRzveUj5kyUQwxJvKViBQuHr+m94w6EikY/ipU3rtzVeYxrnLmxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWTvwx1wkvhvWzw1qzaSBBB3tqy9rjkzAwo+TJzab8c=;
 b=c0WZtLM9iBuVqfptLWU44UzpyciDi4tBIz+CocKu4tGJ89t6rg0Tm18lQVDJ73az5W0Otbpu2IFhqzWWoYrfIUo1E+GIZj1koDN3dOCBIqGePVS+anyNM6nY6iFWHCiBXjcl/Zm5VGA/HdJWpRSDkKvpdqT1GRo1T/V8lmFqgWPXxrDooB18CiRmpBoofGygfIw+eZfoOiCDCzE+/Y+OKK8o1E+WeTlrfzScxpeFwneYp638P6uMip6o/W/ZCUhxkft8yhw5gEgHYyTEiXXfRBPWStXScv1Ev3ZPdJdL6Pfu7TDNQ2UJ6PIdC77lrrXr/WAcKaMI68FpkkBwMWQIcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7947.namprd11.prod.outlook.com (2603:10b6:930:7a::11)
 by DM6PR11MB4596.namprd11.prod.outlook.com (2603:10b6:5:2a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Wed, 21 Oct
 2026 04:59:01 +0000
Received: from CY8PR11MB7947.namprd11.prod.outlook.com
 ([fe80::3d48:69d9:4c1d:1af1]) by CY8PR11MB7947.namprd11.prod.outlook.com
 ([fe80::3d48:69d9:4c1d:1af1%5]) with mapi id 15.21.0522.016; Wed, 21 Oct 2026
 04:59:01 +0000
Message-ID: <11421d19-81d3-4c51-91bd-a064c08ee6b4@intel.com>
Date: Wed, 21 Oct 2026 10:28:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_wedged: ignore expected GuC error in
 dmesg
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nishit.sharma@intel.com>, <shuicheng.lin@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20261021044910.253131-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261021044910.253131-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::13) To CY8PR11MB7947.namprd11.prod.outlook.com
 (2603:10b6:930:7a::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7947:EE_|DM6PR11MB4596:EE_
X-MS-Office365-Filtering-Correlation-Id: 18379abd-84be-4b40-c1b4-08df2f300586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: AZiSzQkErJR/ZA2+XDHK2BB2F6MnRdQVHgmxHaOp8DpdQlGq51cuiRhLa44HSKgWMC4rdapwjgnkOBpkUBDq7M4WCx1yUjhd+pYIwwB3wedUJfU2EZuGz6Lgu0iSJVl7KTQFJl22dZ+mviNv5/oCYF0nxRvi4IfZ3n3UDD05Mq05pTRJ9Mn9C3B59GDhWx9pfMAUiJFCrccHh4oWcBSCyUQr++aiC0jlevSc99eSf6AcfKX8gjhHlB7xPbm6HXmEXYf22DOVWqAQc4yTYAbBU4ufYpagOaWEnU98PSJWrmWMGSZLVqsZjrqFBIQO1ilnI75Igm3tT9Pi26LLwS3PrC1U77xJNGDChRNnJjJ4/ocb6p1Mgv8Mog3qJ0PRrlYOK9mo6KGFEiPPOtGqT4B50lS0Jd86YC9u8MxpsBZcecJo+wUX97SnLDzrGB/LLJc1KiptQ56g3Us0eZDbOnn54EtUU1fbo9WwVVC23sK/51tfwdj1BZSGuN0C24pRpYHQvO/+vd4C5KOyygblkuEMeJ8jCfdZFffCUrmRVEu4eV5MkCgEe1OwHIJJkUduJzP6rvnXX40IEPSr/qcLFFMYAmjezq4IlxVuu9GPL/SoSPQo+5ScnAI13k+RrrYcGq2cn6TwJZxv/lePc5pbjSBmZ460Grtk334cCXBnSaZYHqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7947.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXVtYytUSkNvcDV1ZXQ3T3N0cXFIWXNmZVlCVHdQS2MyZEdoWXNVOG9qUTBw?=
 =?utf-8?B?S0svbzUrUmtGZ2FUeTZ5WU9ETm53QnIrcE51NGcxMEhNWnpEUW9LOTAxWUMx?=
 =?utf-8?B?NVJJSWVaWkw2Y3hoRCs1QjdxS2NYS3NGRHRMUHltb0JTMDhQSTRvZFlBRDFn?=
 =?utf-8?B?a2pOWGNya2tGclJweCsxWWphY042dDl2SnJxRjR4QkVsYjNEL08xQ0IxMDR6?=
 =?utf-8?B?cklzVWRCTGFwdEcrVld2VHB0bGpZOWpXUEF4NDdDM0RtdGt4d1Y5dTNCbkt1?=
 =?utf-8?B?RkpmRzVxbnNNTzd0ZUpEWU5jQUFUWnBlYWdEQ1FYY3VhTVpiUEFPazhjTzNW?=
 =?utf-8?B?ek1IMnNLTHljM2RQRi90aENtWG5FNHZlbXpzSXBPL2Y5czlUNVFNM1h1V3p0?=
 =?utf-8?B?bm0wUGVTZWp6bGdNbEg1MGkrS1lYVGlVOGI4R05ZMVd6Ky8wSkFldEJReFJs?=
 =?utf-8?B?V0I2emgwNVczSG4rZ1M4dVEvU1B6MkIyZ05WYkZqajVpTkYxQUR6ZmJScjVx?=
 =?utf-8?B?OFFxeGJyTGs0RWtWOTdldWlPZ1k5NkJ0cEowaWpiSmcvUGpRaWxiOE5BY3VV?=
 =?utf-8?B?U0F3UHdHTjFmRTFnU1RDYkRHK09BMkZDK1g0UUczczVxcmw0eWdyVmdvdlNq?=
 =?utf-8?B?b3dUcnhOY2pNc0s4Q2VESU9tb2xTR3V0cWpveS95T2lPTGllMkRYOTJNR0Vq?=
 =?utf-8?B?eHJnRGtPenhQOHpQSjNYb01BUkZIeTdoU0Rkdkp2WDhiZTgzT3V5eEFoUk1S?=
 =?utf-8?B?WkNhMEFFcFlTeGRucldiWTRsaHZLVWhPRXBnZXZUeStUbHJDU3ZYRi9yd1c3?=
 =?utf-8?B?cGd4RmV3NHJpTitFMGRMdDU1SnlQVzFyaFA3bGZmL0JPQnc2Q0ZlMWp6b2tp?=
 =?utf-8?B?NWdPaVNpdzFuUCtSK3VMMmVXcnRYbkFpSVI1TjlGcGpER3Y3aFdJREtXV1dl?=
 =?utf-8?B?SWpWOGhnNjhUcEdvcFh5SWNNUUVEa0g5YmJGK0poMkQzbEorMWROSFByblla?=
 =?utf-8?B?MFJQTXVla0VHVnN6QUlKbkZNQXhpNWQzdVZvK2daRXlYNnY4M0lrY1VicFRv?=
 =?utf-8?B?NzRabXJKVzlBbXhIcUNzMnlTYjIwR0VmRWtha2Nxa2REK1FVRExVQkFYa2Zp?=
 =?utf-8?B?S2xZMU9MLzh4cE8xbFZhUWlFYkpkNG85ZkpTTHhGN2JTaThsZHNobmMrb2E4?=
 =?utf-8?B?OWxSbkd2T29SSHoxalZTYVZXTGYrRFNGREFRYkhDVFdxNktJV2tvSUNQbmFh?=
 =?utf-8?B?LzNBL3FCYmd3YjQ4elBxMGVGOWxhNUpITVVzdnZLdk9LMEExNkZhUEtwQ0o1?=
 =?utf-8?B?b3J2a1ArcEVOcVlvOWZoeUxLM2x5S0RmeGttak1abTBZZjhoczFncWZvYWFV?=
 =?utf-8?B?TEhUdmhWQU9MNHZSNWlaMVRGYi9tZjBWUjNWZGNMc0EvNnNSa2tOVlp3MERU?=
 =?utf-8?B?RCt0VytiRkwvTlY3aTBoMmt3K3l4QmZUUTltY252WGE3S21TSVhqUlJRY21Z?=
 =?utf-8?B?MFZyUmIvelFiR2xQR0p0VU03RythMGN3T2lNWkdhY0IveldCM1doTUJSYjBy?=
 =?utf-8?B?Zlhxd1hYNDJkK0dvZ0tPeWpaWlM5aTFpa0ZjSVh0T3JwN3VkZUM3SGhVSHBx?=
 =?utf-8?B?bEpVeDZvaUo3RnBzbDBpZy9DN3VRbGtKNXZXUHNKUjh2V3J4cG4rRnFqZkVq?=
 =?utf-8?B?SXFtRklaQS9mVW1Eb1F3dXA2SVdyM01qSDZLV05tM0JkWSt3anY5Ry9MUUgy?=
 =?utf-8?B?b3M4WE5aUTBaSStQNkV5N1ZybHNnblVYQlQ5R3F1aDMvZXpZdVlXb3QwMU1N?=
 =?utf-8?B?K1lUMTBnRVJQeStZelRIbXlpM3pzQnFvMXI2b3c0M0V0L21HV0t4cnhRdnJ0?=
 =?utf-8?B?cWs2VzZWN0lQZndNMkNhZFd0Nlc3QndUeE9RU2xqcE1zUzZ6UUh3Qy9zbUVJ?=
 =?utf-8?B?NXRWRjk4N09FbTI5WHoxQUtjUzNnRDI1b2t5d0FzcS9LQVRCRXlWS2tZUXJn?=
 =?utf-8?B?VVNyUDdXKzNhSy80NTRiL3ZqTTRROE9MNTd2eUI3dWsxd255eGwvUHRlVlhm?=
 =?utf-8?B?cUUzL3hwbGQzNVA0VTFuZkpnQzJiQVFNdjl1RktQTy9YVkhaMkFsTWVKL05E?=
 =?utf-8?B?aXhQMTZ3RHRra3BjcDhZem5iK2FVRTdaS1FzTmIwNDY1Q2t2ck9pQjlIVE5s?=
 =?utf-8?B?MTVhRU1ZTTc2RzZQeE5iMk4rdGZwbTZSaEJseG9PaFFSRHBmcXdXcHI4Ti9F?=
 =?utf-8?B?N0ZIMkpsMGhEWjVRbXY4akdJQ1NpRXRWaUlycFFxcEc4WVJPQ05ScHJhd0hU?=
 =?utf-8?B?NldGVENzZjVaQm84OWhKbldPenBON1dWY2FSYWJWL0U5YmdUMWtWQT09?=
X-Exchange-RoutingPolicyChecked: I8IUzJmKtl1h6MtsjWz3IixGSSSfUEcRTVEOvtJ1yWuekEDrimHwFw65sDxHOlBH7wScMhytZbg/0HmEzZUJ0bqSpSZjAWpMvrBHwYoyYgzti7XHvYTAipXQJcral/he1h8zNtKED11j73vO7iUboqp0M9E4L1HJF4c92RXd1/trjFojoUH0iS1kKG+byr8/leFrmywgH2NQ9hOU/8/lTP3SmjfGilJm5wENQ3EGvlhJV+FGf6ubxmJakiCnw9heVQsy/Oqahe3bj5QtBSWsjALw8RaW7sJqwVB3VZzEDgq0ZGNDYWO49wQrh2pdfF6YIMl2FCQeZomkbyoHSOIxRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18379abd-84be-4b40-c1b4-08df2f300586
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7947.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 04:59:01.0516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYl1JJpQqVEVSvS1YU/w7ryGVE/2vJWAGNugrbWwVfIfz+A8BLZQFr7u/gt1WoP+tNzjJlTG5B/za/RvnT6b+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4596
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 21-10-2026 10:19, Mallesh Koujalagi wrote:
> Ignore the expected GuC uncorrectable local error message seen
> during wedge tests.
>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Please confirm if any logs are missing in this path for local errors 
before merge.

This patch looks good to me.
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
> v2:
> - Remove '!' and short the string. (Kamil)
> ---
>   tests/intel/xe_wedged.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index fe8ea6969..ba7efbe1d 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -55,6 +55,7 @@ static void ignore_wedged_in_dmesg(void)
>   				    "|EngineInstance: [0-9]+"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable"
>   				    "|SIGID=203");
>   }
>   

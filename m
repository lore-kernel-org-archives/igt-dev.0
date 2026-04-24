Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF80F589DF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 02:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CA710E0AC;
	Fri, 24 Apr 2026 02:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a99kcXX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9138110E0AC
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 02:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776999383; x=1808535383;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=gyom4stXVUofuRT+k/xr/CghDFOwzxL3qiFtEPRzF4I=;
 b=a99kcXX0o86XFTBHsyT9RPf79wgLyWhmKs88GjTXxWJvhloKHkkWhuhk
 d+BXuf2FeMo4qWwac0KgUjU+kMnYBjNc9dNG0ubVRnCrusBaoQ9dqvGHC
 WblavfiTW/784ATQ/Ox5qpR4XV0evg/ibvBr74+tacrQu9xkmVElgF89D
 IX2MalYWcTsCQLhPOvuNfbDLkd4zaYvU33G9ZvNZslbGoeXsuRurJnofc
 OgH+zW0CT4vqaiv7W7QrVkc8e4hSObNOYk8H4yXqP8P6u/lDhL7+xLwyo
 yUlYVhhlFMsvt3BG5BEulZsJL2Ya5i1WyWfJ/ifh75N9liSI/dGapvOao A==;
X-CSE-ConnectionGUID: CIQQo7ygSdyezLe1LPTctg==
X-CSE-MsgGUID: U2oGS1/xSAme0JOzabk2Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65511089"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208,217";a="65511089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 19:56:22 -0700
X-CSE-ConnectionGUID: ViCaHX1GRQeMYBhrABNEVA==
X-CSE-MsgGUID: cwYLjPwLQ4iG6ALqCY097Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
 d="scan'208,217";a="237184584"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 19:56:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 19:56:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 19:56:21 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 19:56:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hh9+CKeJimmRwAzEoEyNUkFIDUIT/tZEZ41nRETe3U3yHqLv0+sVS1WZGC4fST8kYWcQIMu/VUXQNie7Le9uyPL4F4j/HU4BoFwSbq2xKltaycCIvEWNmS50NRrQ5h5lXz7nS6xfEjt0gSM1aGYXK+Xq+jRHcRLCebCnrkvNR6Vjo6Ooht1vjg4gcun3DHtjfn9YEe1tgPuf4+oQxSuHs8q+scQNToDOGad4M2qfn2XHr19wJsIdplIO1sHhS1YXlvywy7VjUxLYV4Hl8xca9TcIWWW/H5f5SYDzaRKhuTwwwgtqot8f5ZjVqlRICIv6EeGir4iSTHifdYWpRM6ugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roWMIN7gRmGpSPQOpsq/FSh9q8t8/h5zew7jgIdbO40=;
 b=nETcw87FLGC3sZZQsy+3PwOhVXzoF0CUqYPzSuVZNkcsu0ndwpweaw6pKKWB+3NrpwXzrtG3EXkHQAxMGsLLMM4Nn4oy58dwWC3Lvj9nUYDm6BaE/Ayi0tRgs6eBvTgicHcVW6ZshDhkzXDbUtGpB+hfygD1PNHa7ucaZSzplCBVwA8evcoAm0dkJSuk6Ttdm0vfThfK4GojobXhT61Vky54ySvZf4GF2Zh9c6eC8cWgqFSqOg75bugE38Lcho+R4ecv7EmC5MuwqcfiyFIOW/N1mHG7F+reRv7m+C3OdHBPhXFypo+J9fMGZkKnGaQIyMUmgShU5YMoAqdWWDydoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DS0PR11MB7189.namprd11.prod.outlook.com (2603:10b6:8:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Fri, 24 Apr
 2026 02:56:18 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%7]) with mapi id 15.20.9846.019; Fri, 24 Apr 2026
 02:56:18 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "Karas, Krzysztof" <krzysztof.karas@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Santa,
 Carlos" <carlos.santa@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test under
 workqueue cpumask cycling
Thread-Topic: [PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test under
 workqueue cpumask cycling
Thread-Index: AQHc0r5AO9P/bLADS0SKgTbCNn3jILXsbT8AgAEYHf8=
Date: Fri, 24 Apr 2026 02:56:18 +0000
Message-ID: <CH0PR11MB5427D7F665697D3C33201563982B2@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260423005118.2033963-1-s.sebinraj@intel.com>
 <ct77flhq73xronnb3ede5f3xosu66ixmmrtptonvge3tcjvr7f@p6mroacxpoqy>
In-Reply-To: <ct77flhq73xronnb3ede5f3xosu66ixmmrtptonvge3tcjvr7f@p6mroacxpoqy>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DS0PR11MB7189:EE_
x-ms-office365-filtering-correlation-id: 8277ad7e-3daa-422a-ec0a-08dea1ad0ef8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: tkTaKcGqSF7FMb4ucpzSgX8OjUvmwOp5aoIpSvKEJczbTSbY4QAjZecD+y+cXCXWhEjAuAFewL/DBawbxfLHeREm34aRe0mLKWQemAMe7pMVbYMFUzEiRHEpRX6cMGT/PhrHd/FjPgco6Alb/fVUX7obHj5wCPc5TFutnDSdKe/TQAcXIqyQ+ab8MWRv9Kt4ZX21AfG+uoa/SIFA1K67BnlHCFAq7OTeO3y93XTk2GJnXyZzOLEYQWqMxD1k+Jmvc+BjRr8bLKJdWblmav4EQgrP1KGf4/74d8EuVU80ygWyJEiJhXIeVeAEaUDyYKqLxpDb5OawPoC/VRkQFuVBaj1r0WeE23RZB7s4XY4pyqS3fREyUkRqUnyUUezW6833Ezg++yBHDcAlWruezOKKB33/6dozrrrnuAiaLrnIY8jmyJLA82OpDQbd+f2GBcCf7IA8wD85gBiiR/zRopoxpEdLEj1husXVQA7zOdUOVfN3JRm3XYheWXEOnPD5rqUF71Qur+MTVjFm2dEh0YGZBpdBC+Fmq65JsQVLfgltt6f+dEAF8Q77WNitXYRysZSC/6oeQyxvXrPL/TO6swTCyGsDATNUdTbUSp+NGFN+R59biBMfyb9M3YgxS87rBAvMFXVwLjHWnLDH+N3or6wa/0glY62ItIoyy2CQLaZpAiHvRLRL1m+liwB7I3L9AFGasvLSCujQw0jyJfQRLg3os86Vz3ulUbMtMt4fe/MMWnLgaB6cokB1RwRwgBVQ8LhvtmbFAFh/PdshbUTo+PAb+FtXCUZ/A4cyI5c0JbAUmC4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?ZQdGrhZcBLkIAMY1rhDipVDX/4JdTTOPsybg79eABYmNPvqP+BzoCXck?=
 =?Windows-1252?Q?+Y9cLw+RZosd5NAegVOXCVcRKW5WRfWC+O6FfAA5jzFrzimsZD3bBMUJ?=
 =?Windows-1252?Q?1PQgYY7pv2+1LM2gJtzLd+YAwwYTiGIht3xsCzoUckeuRdb7NoGhx3Iz?=
 =?Windows-1252?Q?tHQ5kL7rww4Hi/bkOOYzoCkeRwEaea6fxKNy5O/6xYghNjr+a3g0vJH3?=
 =?Windows-1252?Q?KwwxJu2qxMIdLVi/6lljAm9YsO6XmDR3CpM73Ukcqu8GG0MdPWg1oD81?=
 =?Windows-1252?Q?HVNhkjVsXp3IT/27DHYroy7xvNECWfIuY8VoeVuZTGDzbkaFVjppR+6j?=
 =?Windows-1252?Q?5SkPz27zvTIRii8xSBR7xgnY4acGi/NKVt5zWpllvW9b3Loc41CNrY20?=
 =?Windows-1252?Q?oQZ8V0getMpEY4h1w5nlq2snzD0w6mwNZP0DZqLsUIrp04vT58eJBoaE?=
 =?Windows-1252?Q?IKxtCXyRzb2H/bqVI1fZU5sTv6VJz2tO/l57C4c3uYIa/abuL6Yuy2Q2?=
 =?Windows-1252?Q?2zCR0mNdIgDRPGw9G2YiPOMyNGzPoEDzHxsrlbZe+VDP5Eq+DtFDPM+5?=
 =?Windows-1252?Q?JUts1X/ApYDNbFHwfq55hd8BKdJt42Mm/PzCQTd9mjjI3Mgg7W/BxTKh?=
 =?Windows-1252?Q?xGEvvQgatW0xcq2O+t23rYjbc2YOiN+RgIVGoGpY+U6VQEt9Ck69mbaU?=
 =?Windows-1252?Q?hhS3h6juhimxXOyprpE48jMZEby7cQAvpkbY5IUCMk+xrhoLsfM8dVci?=
 =?Windows-1252?Q?bVf0pOU7oYyS/oDJ2exGxLFVMhoSz99jAoCIpFJeR2/CS+biOBHwEld6?=
 =?Windows-1252?Q?rK2NvkoQ+i11FchbYYSjaPqfqUY2y7GrNOyAPX/DEQBqKn5vPAikMkF3?=
 =?Windows-1252?Q?39rYvnWv7ggbAnjMeSO/L0yOWLH1HkX5U0Vt5ZjRPiqtItSrcvs/G9TX?=
 =?Windows-1252?Q?HxpO1o5T8q3tgXrhNNOb82out05w86GSY3AuNF2sFyuWSCRnnimPUb0w?=
 =?Windows-1252?Q?RuGbziiS1NQBL4v6412jUceSMxMqsLzg6IXDXPxM8LBJg/8K07he84XL?=
 =?Windows-1252?Q?6nm0nXdGMEo7W9ssA8FG68N0PtAMCJidf0xph4ha4Ak9hd0sbsKXS22U?=
 =?Windows-1252?Q?FF23mhGtCuAs3ztUSV3SWY2jXGEkBhBrnC8Xp6s3XvfR8y+uroaBKySZ?=
 =?Windows-1252?Q?djQtX3bQb6kEV41q7S8JMBlKPjJ1rZbjp3epsI97m7pcpoCT1cG8fEKo?=
 =?Windows-1252?Q?sFGM1JwpSYc/kaTW4LPjat1lBViJmfnw2g+TD3DmjR2aaZEwH1J57sOG?=
 =?Windows-1252?Q?EsS3jyrHZEllXj+p+egQpbfj7naTYpKQ7PlQtg065pVEXcjl5aEKfo9E?=
 =?Windows-1252?Q?yMZBwShDpKHmBrmQud0LrN0g9or0EQwtKY/Gt2v8J2SQt/PCe+sf5uDf?=
 =?Windows-1252?Q?hf8den7FRCF0W0waCMyBOhYkhbQKGHzKGvHDKjXrJySNPMULt+Sro6QM?=
 =?Windows-1252?Q?q4axmisAMBZTEbi2B0V3s39wxZBpFaVmiMs+xfkx4IuvC5fQb4LGtNc0?=
 =?Windows-1252?Q?pyd1ZNHrUEQQz4AnJYqkf8cVKbrOw3ub+a+m5iyBtDS2rN1hr1MI2uBs?=
 =?Windows-1252?Q?1PoswXAKTgH90AFerWMxnXb/PqKRuYpYtyMZMY3Is4OgUVZwdVH3fsh3?=
 =?Windows-1252?Q?+6EOjQ3Tq602z5WspwQd1IP59UZQv3GoggnlLdHCQZEEVHCXHl/IevQn?=
 =?Windows-1252?Q?gzldGf8dh4+91UiSnGzF3RKZoxxgQTxXyBX+9RWq2Cw0fB+qu9o0vGLa?=
 =?Windows-1252?Q?fu5d+tzbPHkgu/clswT83reTMm6V97ld7EK6cvkIlr23swrM?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427D7F665697D3C33201563982B2CH0PR11MB5427namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pH449pS5W+nByf9s3PgynOWE9Ltttkcg3LrplULHb2U5buE37wqDmNtl08LpmqWNLaZI3Ba98E9jy/tnLL+LSSHtwTE/1qZInGk89f5Tw+YNVK5f9pMwhXPOKeqnzOlnFVhIfRmcw5ei39BShmtr5d6mJfNT4wTgfWM50NSI/of/7ChtUfJ4ApEa1fOYznkGbohXJqg5w2pUbfT4qBEA5I6glhyS6iXbnXHeAmeH3p1YkTjb5Pn1QkgvPrbtJVCIGDG9rGKBi9Rktv1hlkYsmKPhDlTnrz2VcUpQf53SBYiic5qf24HfBFV9SfdQHW4lV4FB0cNV4ErLF0yQqiy53w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8277ad7e-3daa-422a-ec0a-08dea1ad0ef8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 02:56:18.5234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 73qBFaYAn+CexF6vgL5VTEsfY03J8/IRvppwkgCxPuvO1vuk/rptcj1BlaATQf1tpt5lM3JbUFLb1+43vymaEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7189
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

--_000_CH0PR11MB5427D7F665697D3C33201563982B2CH0PR11MB5427namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Karas,

Thanks for the review, I will correct these changes w.r.t comment styling i=
n v3.


With Regards,
Sebin


________________________________
From: Karas, Krzysztof <krzysztof.karas@intel.com>
Sent: Thursday, April 23, 2026 3:40 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Santa, C=
arlos <carlos.santa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; B=
adrappan, Jeevaka <jeevaka.badrappan@intel.com>; B S, Karthik <karthik.b.s@=
intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>; Kempczynski, Zbig=
niew <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test unde=
r workqueue cpumask cycling

Hi S Sebinraj,

[...]

I noticed some inconsistency in you commenting style in this
patch.

Here you used /* */ for multiline comment,
> +
> +/*
> + * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
> + * fence takes longer than this to signal, the workqueue is considered s=
tuck
> + * and the test fails =97 this is the direct symptom of the
> + * Xe hang caused by the kernel workqueue pool_workqueue pending_pwqs bu=
g.
> + */

[...]

here you did not put dot at the end,
> +/* sysfs node that controls the unbound workqueue CPU affinity mask */
> +#define WQ_CPUMASK_PATH              "/sys/devices/virtual/workqueue/cpu=
mask"
> +

[...]

here you used /** */ for multiline comment,
> +/**
> + * stress_fence_deadline - compute an absolute CLOCK_MONOTONIC deadline
> + * 5 seconds from now, used as the syncobj_wait timeout under WQ_STRESS.
> + */
> +static int64_t stress_fence_deadline(void)
> +{
> +     struct timespec ts;
> +
> +     clock_gettime(CLOCK_MONOTONIC, &ts);
> +     return (int64_t)ts.tv_sec * NSEC_PER_SEC + (int64_t)ts.tv_nsec +
> +             WQ_FENCE_TIMEOUT_NS;
> +}
> +

[...]

here you did not include newline at the beginning,
> +             /* Start the cpumask stressor in the parent so that any une=
xpected
> +              * write failure propagates through igt_stop_helper() and f=
ails
> +              * the test - running GPU stress without active cpumask cyc=
ling
> +              * would make this test meaningless.
> +              */
> +             cpumask_proc.use_SIGKILL =3D true;
> +             igt_fork_helper(&cpumask_proc)
> +                     cpumask_stressor_loop();
> +

[...]

here you started the sentence without capitalization.
> +             /* restore cpumask from parent too */
> +             igt_stop_helper(&cpumask_proc);
> +             cfd =3D open(WQ_CPUMASK_PATH, O_WRONLY);

>I know this is nitpicking, but if you would be sending >another
>version, then please stick with one comment style for >multiline
>and one for single line comments. However, this is a non >blocker
>and I like how explicit you are in your code:

Thanks for the comments, I will update the code accordingly,

Thanks,
Sebin

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

--
Best Regards,
Krzysztof

--_000_CH0PR11MB5427D7F665697D3C33201563982B2CH0PR11MB5427namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Karas,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the review, I will correct these changes w.r.t comment styling i=
n v3.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
With Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sebin</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Karas, Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, April 23, 2026 3:40 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Santa, Carlos &lt;carlos.santa@intel.com&gt;; Brost, Matthew &lt;=
matthew.brost@intel.com&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel=
.com&gt;; B S, Karthik &lt;karthik.b.s@intel.com&gt;; Konieczny, Kamil
 &lt;kamil.konieczny@intel.com&gt;; Kempczynski, Zbigniew &lt;zbigniew.kemp=
czynski@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v2] tests/xe_exec: Add VM rebind stre=
ss test under workqueue cpumask cycling
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Hi S Sebinraj,<br>
<br>
[...]<br>
<br>
I noticed some inconsistency in you commenting style in this<br>
patch.<br>
<br>
Here you used /* */ for multiline comment,<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Maximum fence wait time when WQ_STRESS is active. If any bind/unbi=
nd<br>
&gt; + * fence takes longer than this to signal, the workqueue is considere=
d stuck<br>
&gt; + * and the test fails =97 this is the direct symptom of the<br>
&gt; + * Xe hang caused by the kernel workqueue pool_workqueue pending_pwqs=
 bug.<br>
&gt; + */<br>
<br>
[...]<br>
<br>
here you did not put dot at the end,<br>
&gt; +/* sysfs node that controls the unbound workqueue CPU affinity mask *=
/<br>
&gt; +#define WQ_CPUMASK_PATH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/devices/virtual/workqueue/cpuma=
sk&quot;<br>
&gt; +<br>
<br>
[...]<br>
<br>
here you used /** */ for multiline comment,<br>
&gt; +/**<br>
&gt; + * stress_fence_deadline - compute an absolute CLOCK_MONOTONIC deadli=
ne<br>
&gt; + * 5 seconds from now, used as the syncobj_wait timeout under WQ_STRE=
SS.<br>
&gt; + */<br>
&gt; +static int64_t stress_fence_deadline(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct timespec ts;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clock_gettime(CLOCK_MONOTONIC, &amp;ts);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return (int64_t)ts.tv_sec * NSEC_PER_SEC + (=
int64_t)ts.tv_nsec +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; WQ_FENCE_TIMEOUT_NS;<br>
&gt; +}<br>
&gt; +<br>
<br>
[...]<br>
<br>
here you did not include newline at the beginning,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Start the cpumask stressor in the parent so that any unexpected<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * write failure propagates through igt_stop_helper() and fails<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * the test - running GPU stress without active cpumask cycling<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * would make this test meaningless.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cpumask_proc.use_SIGKILL =3D true;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_fork_helper(&amp;cpumask_proc)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpumask_stressor_loop()=
;<br>
&gt; +<br>
<br>
[...]<br>
<br>
here you started the sentence without capitalization.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* restore cpumask from parent too */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_stop_helper(&amp;cpumask_proc);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cfd =3D open(WQ_CPUMASK_PATH, O_WRONLY);<br>
<br>
&gt;I know this is nitpicking, but if you would be sending &gt;another<br>
&gt;version, then please stick with one comment style for &gt;multiline<br>
&gt;and one for single line comments. However, this is a non &gt;blocker<br=
>
&gt;and I like how explicit you are in your code:<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for the comments, I will update the code accordingly,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Sebin</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
Reviewed-by: Krzysztof Karas &lt;krzysztof.karas@intel.com&gt;<br>
<br>
--<br>
Best Regards,<br>
Krzysztof<br>
</div>
</body>
</html>

--_000_CH0PR11MB5427D7F665697D3C33201563982B2CH0PR11MB5427namp_--

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2D2CD4F57
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 10:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B15E10EC0B;
	Tue, 19 May 2026 10:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Psi7St+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8718210EC05
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 10:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779186532; x=1810722532;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:cc:references:in-reply-to:mime-version;
 bh=F649H0PEEKBHdDsEa+Sg2ZeTm9DcQsjFmh6x57GyoCw=;
 b=Psi7St+R77Ervz/C9FPk/4UpFr7G9SelO6UZsMZ/ozfPtE10hwnPYYv6
 dc8sRWQLJS+VJ4UgP+bb2LBBUGVepDeoH9DQ+moKkmb5yuXxuacfSratE
 iFOk6CzofehKX/GigjKl5JbM02+SrBQp9vB8ILkbceCIpcBOMrueQkg5j
 DjPICcF0UNNyuvBRqWmgqYjpoT6+COjyEcIrMZelIKnB7GWKeFaprv6oY
 1RIZEwAHuld1Al09WP4n+pkv6amQsp6w8JGShde2GgIRWIgLVA6xS29aI
 MwaWuqOy7eWYygNAu4pEBdcIFJI46scXIkQDU/E2Lup8TI6OO6hD/zfwZ Q==;
X-CSE-ConnectionGUID: nvJE0EiQTWCE07w/o01jMA==
X-CSE-MsgGUID: 4stp0vlBRu6MBO04+ESuPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80024140"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="80024140"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 03:28:51 -0700
X-CSE-ConnectionGUID: lbKO44lmSxivCFpnEpq2Dw==
X-CSE-MsgGUID: wAN2D/e5RQ6VLG9eh6naQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="241562184"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 03:28:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 03:28:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 03:28:50 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 03:28:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhIiQD0pq3PROosOG6nkl1m5DMw4h8gcduhVJOvnn1HtZmZebbrcZ/rj13TP80NEV44fZ9WbvxDt9QX6TYCvi+VkJtzs/WjqOSRLxAGmMngvOxceFjkv6DBItD3Q+cYWlEAEXnhBBoXgoaQna/1+g6ioXYsmYYwc1Mizofp+t6qJXoqT9gsui3dufZFumB1nXNQJ8owcORjSnu+RI6uQnmedTmHaLMESKrmHKn8aKd/ABRrChlNppUuNiU4uzWVnWJp2v2mQyKOgshn5BqeF267e9r6WLgqkjSuue4Go61wQr8+PhGdUzu0GZ47LIdO5TL1ox4VZXhhrP6eZi9RnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+Uws4jzslIAga2oieh68tQP6O6o4RLJT6Lw5uhfrj8=;
 b=caRFRKygW80vHR4CqP6K0QKp9+xovcAgoZjrZeBKIdAfR3x1gDR6bIHPT4tmZythztgrbNCAKzk9CQrfTILhjchf6so10HAUU/dXbY7BxLSprGLLgQ16MDksoD4l8SMpJdY8EoTPYzC/gnzaaKsVDRRD9ydHpK8eiWhIUg2bdXE26KI5/ZA0VH06iED1NMHlSTC5So0LK6e5iLs0iv0uxW2x4yyyuKar8W99+CfjaMhCxWgqzULTRQxDEfVC+qHTBmK1+hRlFu++IezIhnjuQZHFmXeMdumgMMiOkPKb2ADmnju/tamNIkKX4Bn3hRSgaZHRGSF17YgbJuO8IWUoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8314.namprd11.prod.outlook.com (2603:10b6:610:170::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 10:28:41 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9846.025; Tue, 19 May 2026
 10:28:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 May 2026 12:28:43 +0200
Message-ID: <DIMKZHGZRZ16.1Y3J2XE0YP08E@intel.com>
Subject: Re: [PATCH] tools/igt_power: Fix crash on Xe devices by
 initializing xe_device cache
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <ashutosh.dixit@intel.com>
X-Mailer: aerc 0.21.0
References: <20260518123224.7398-1-sebastian.brzezinka@intel.com>
 <u675mrahh45rru46tylndfexvahhnc54te6rducdxyci27fro7@5e2lfrh77ywu>
In-Reply-To: <u675mrahh45rru46tylndfexvahhnc54te6rducdxyci27fro7@5e2lfrh77ywu>
X-ClientProxiedBy: DUZP191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::15) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 32dc6e1e-1b11-4aaa-203d-08deb591658d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|4143699003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: AHITRXlfQ+U9urTZjGOI11OD9ER+LJJ7+P+4+Eqt4otLL2IssVb/PBWsuKYmpAN/PpyqwvyfLje0SENztgCcl9toV8XvZaSa2yYQJsXOeD2wDukxJRHe5avL3NBFHW09KFYYxHGzz7p4FZVTyefsvoEDAZAuq5/20a1X+5kBfEJ4JgxX12l9B6WUiXFc7MvqORQyIWERAIV9QKXL7zLv+ZjOFy1Et69IIm6o1KkYmG7gr9Re3ifLtcVqIrbRceBT7VWNynj2lXlYFJXezPbLzDVB0Koku8a4mrsotNKM++Ou/VU/GrK8sTOuq11cP/DzTv4xlifh/gNxpsQ6MYril9Q384WwnVRANyKK65F35Mr30Ravme+2Bi+EQCOywtXKhdli4c+2H8qm1HOhCWP6G04uGxbb2jeVd3CC6bnZS3BwsSKSqRM1dgA6G4STVh7zRM7ucwkT6Y99TnjxtLoy0qm7kzkwAvL63DLueo1Uwb7L5oVrXHp/qenDKOLwv2fhzFi0RFf9Femt4IQjdNfKHgpg2AChq3+mYMtrwq+MNX6cYiKzWXwYoIZYWBqNkqSMIHsNfSSkYSi7tb9ElenuPGJVG5YIgARKjUcB70V//ajYEijp1n2u9rytaXQLMBP019ChW/gEMN9jZ0yRt19b5tEgQSr/diLJX05AM3iSJ5Y/rJe1vJuPjHDxr2lCnqDd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(4143699003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzcwalZNbUtPUUp6MEdlNFl5dkhaVkJUU0dIMlVYeXM4eVRVVWxYckNRdG50?=
 =?utf-8?B?MEpRTzdSY1VRSENVYnRwQlRUdGZXWjlrTW1DcExwaEsrVHNYSlpJM0FqSkRM?=
 =?utf-8?B?eDM5SXZjZk1Vcnh1RjdicVY1d3lQTnlIcDZuTitlaE40WUd2SFpncWk5WXVR?=
 =?utf-8?B?RVRwOEx2MFZHUnhjMUFaWllzQ25kY1c0dXkrem1wQUZjRkZQMlNQV2psd2FB?=
 =?utf-8?B?R2dSMFJpUkh0elU5SWliNURXSzB3K2NwVG1jWnNLTFZDWU9FOEpTa0dVTGNq?=
 =?utf-8?B?VExjQWRxUUhJbkJzNGwyY2ZLMmJiOWNZQ3AwSTR0dUNJSCttNUFkWCtvRlNv?=
 =?utf-8?B?TU1KMzVnU3F0MkcvbWV1OVhqa1R0Q1Zhd1FEZEliM0xJbnZZN09QNFVyK1FM?=
 =?utf-8?B?ZTRHdlVTOUk5dEFsU2dwalh2UmxxamYvZnRZWWg3MUlCVitPVGVSTnF5YmpB?=
 =?utf-8?B?RjQzQUp4K2E2L1g0Q3hmWVRRaW9UQ3JtM0FndWlIR1VIZGdVNXF4eTBZRHgv?=
 =?utf-8?B?SzMyQnJ3dVdOcHBRaGF0a3pvMFJSSjhjcTJVTlpNMnMva09zUUhrcE43RnBz?=
 =?utf-8?B?M1NUN3M1bExOKzZFZUZ5K1QxbkxYZ0UzNkhQeGg4OVMwMGJYTGxxWmVYQlBo?=
 =?utf-8?B?N1hSZFk3TmlMYUVVVzNjSkIzY2lxeFZmRmpuV2JWZ3laQnBDNXRzdDVVSnpm?=
 =?utf-8?B?UkMzLy9NTUJET2x5TVIrMUQ1VFRzazdBck1iSjd0S2RFU2VkcnBHRnBYYWpp?=
 =?utf-8?B?a3NWN3V4WEFuMDU3RjVGZEQzTHFzMDExRmJmOWswb2FBVkdQRjJzTmdISDZO?=
 =?utf-8?B?TFZYclhPWHdDaloySWE0cmptVzJZSGNLbWJyL3A1RmR6Ykd1ems3ZjhyQ0dB?=
 =?utf-8?B?MThwUHRHaUxjUTJKNEY5RkJ2eDNFcEJUeDI1a25PNjlGZjB3WSs1d3VNRVFH?=
 =?utf-8?B?VDRXRjBEaDdaS09KQ0ZwVVl4QmNDd3JseCs0WVJWN2Z1VEhTNFgwckhpQytW?=
 =?utf-8?B?MXNwcnFxZ0o4SzVvNklwUmhVZmxpajlWQW11QVRZTkJvZmFEdStUbXZhaVZG?=
 =?utf-8?B?bko2UTdnNmZKRGVYVDJ4SzlxMG1jTnZnM1QzMXJ2M0thVGN1d2pQUmluMkdu?=
 =?utf-8?B?WlFWREVlRHVzNU80bVZtOHRDd1NFMnNNRlQycTZtMVpPb1VYWjM4VVBxQlJH?=
 =?utf-8?B?NXJ0YVFtaSs0UUVlbVhjN0xlNTJrNjVnYVVNTjk2Z0FIeGRSTHdjK2drem13?=
 =?utf-8?B?SU1lM2JZbGU1Q2FDOHFqY2FJK0xPVnNOUGphK0IxL3NhZWVYZ2ZJUDlkaHFE?=
 =?utf-8?B?bEtJaG90VjJtbmMzbndwN0k3aWN1NUZiMGVJdm5MNEYyM2d4WWp6dFg1Mmp6?=
 =?utf-8?B?ak9rcCs0QU9UeEUwQ2dqQTk1Z0dIdzFMcHorb2ZiRnRIdnhabXFZUDhOYjBt?=
 =?utf-8?B?cU5pRldoVDBCZ0p5cmJzbHdRNDdmc3BrdGFCNFg0d2hINlhTY3lSOEN4TFh4?=
 =?utf-8?B?TnprelBLMnlyTWJmUDluemxjeE1QbGNSRzVwK3c5a3dYSGt5K21OdndxOGJ4?=
 =?utf-8?B?bWJiWnhLTnJhbWpoNm5IaDZLYlBxdm81MjR4RVNmRHh6cnFrMm1kTHNEdjVz?=
 =?utf-8?B?MnZMRlRsS3NrcjRrTzVFbVB4UTduY3ZpNWMycHRNcm5vWVhBWmJCSDdIUVdz?=
 =?utf-8?B?UTh2bGloamJNVktFdncwWnR4OHpoMVF6elc3VXdMdFRCdldJV09pUlZrcHZK?=
 =?utf-8?B?eHh1NEkwcHh2U1BPV1lLQjhORFBQbE9ES01UdGNkeGFQNkRKbnNwNTR4TFk2?=
 =?utf-8?B?cUJaSW1GZWFHRW5mWjk2QkRQbDh5UmNwOXdSVXVHaFhZajNlZG8wZnhaU3ZJ?=
 =?utf-8?B?dTRINGhaN3g0TEp0bnFuSE5sVnZSdFFMVWhnbjVDTUR4THBmNEFxTktpWCtm?=
 =?utf-8?B?WURZN0hucUpQME96ZnlkUzltY3JMV1NoNktTSTllR2ZYOVRwdC82M1o1ZVJH?=
 =?utf-8?B?eWJzUDhsY2Y2Q0ZJMFQwbElTYWs5bDg2QlNIcWpLZzBqYjFydzBkMGlpWUVL?=
 =?utf-8?B?YkRpNnVqRGdvVXlEMFYrdXcvVU5qYkdsQTlmYmIwV2ZSazVkdzByVGNvT3VD?=
 =?utf-8?B?ellTTS9DTzhKVHROUlF0dHAyejFVRE5MTGpaV3RDbDdPbHVVRWNId2NJWW5v?=
 =?utf-8?B?VHQ0Ti8yWTNpamxJZittT0NPR0tNdld4SXovN2RiQldIeVRJa3FLV0JITDdU?=
 =?utf-8?B?R2ZSZ2dSQllyei9mQjNhdnY5cHBuQ0ZFV2krY09qNTJ3eHZuYkRzeVJOcUJC?=
 =?utf-8?B?NlBPOUs0UHpwMU9RNFhwOVJjOFNRcGx3eGNub1pGcE1mblB1Qjk5OGE0SDgz?=
 =?utf-8?Q?AHwI41wqdGmjULnU=3D?=
X-Exchange-RoutingPolicyChecked: bBNECyv2gMsflMVv1m5R3pUiTA3HRgd8jju+A1dE6EQCVpZO5pvPZgbKZCtaqjIjr2v9XPmlvmrJBOBbLOM5zgZ4wMNb8/3l1L1GPKo8a+Zh8OZEkneuFHFptbp3GhFh1HNic4NGYWONH05xWcjHAmRpYlzM0l6DFLdl5jiK8iDV+I8MkZ7+DvWRcc3+xwF7TjMTGV+I3/MHtzHPHGaPNMNcj4vb+HL2nlvlu86cMem8S/KJbNXrswncGPxMyH5KHYIDb+0Y7IUgsVNuNbt/2OIAfM7ATJ2WzhAeyHmt7gORvOCbjRZ/vf6HUogHBu9ltEuIyo8ZnBgflNtZmgFofQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dc6e1e-1b11-4aaa-203d-08deb591658d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 10:28:41.3430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljtNP03KVl4WC13QtXdz7zp3ofh+FL6DfYvHLaAkHwswqR7DWbpBQwtRam6bWIz4brEXMTVb4hEdTGBN8palNv2MHF6os/U9QROTyzfSVXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8314
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

Hi Krzysztof,

On Tue May 19, 2026 at 12:23 PM CEST, Krzysztof Karas wrote:
> Hi Sebastian,
>
> [...]
>
>> @@ -38,12 +39,15 @@ static bool prepare(struct measurement *m)
>>  		int ret, fd =3D -1;
>> =20
>>  		if (m->drm_device) {
>> -			fd =3D open(m->drm_device, O_RDONLY);
>> +			fd =3D open(m->drm_device, O_RDWR);
>>  			if (fd < 0) {
>>  				fprintf(stderr, "Unable to open drm device %s (%d)\n",
>>  					m->drm_device, -errno);
>>  				return false;
>>  			}
>> +
>> +			if (is_xe_device(fd))
>> +				xe_device_get(fd);
>>  		}
>> =20
>>  		ret =3D igt_power_open(fd, &m->power, m->rapl_domain);
>> @@ -54,12 +58,20 @@ static bool prepare(struct measurement *m)
>>  			else
>>  				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
>>  					m->rapl_domain, ret);
>> -			close(fd);
>> +			if (fd >=3D 0) {
>> +				if (is_xe_device(fd))
>> +					xe_device_put(fd);
>> +				close(fd);
>> +			}
>> =20
>>  			return false;
>>  		}
>> =20
>> -		close(fd);
>> +		if (fd >=3D 0) {
>> +			if (is_xe_device(fd))
>> +				xe_device_put(fd);
>> +			close(fd);
>> +		}
>>  	}
>> =20
>>  	return true;
>> --=20
>> 2.53.0
>>=20
> These changes follow a known Xe get/put pattern, so I do not
> have anything against them:
>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
>
> On a side note: did you notice any similar places where this
> could be missing? I do not think more changes should be added
> to this patch, but maybe there are more bugs like this and you
> already know how to fix them :)
I did not really check for similar cases, it=E2=80=99s issue reported by us=
er
so this patch is intended as quick fix. Thx for review.

--=20
Best regards,
Sebastian


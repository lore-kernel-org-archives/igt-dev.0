Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5647FEFB7EF
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 04:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB23610E270;
	Tue, 24 Feb 2026 04:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkMTeU7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D46910E270
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 04:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771907107; x=1803443107;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fjFcnK2968SyPgoEVbIME4c94NQWE9NwEqqU5B+fYqg=;
 b=TkMTeU7FkJrC9Fwmr+41JUkv788jYP7eRy6ovzM88aWVcAuQqh0TjWW2
 pEkkfEdZLwS90WZvNi9MQw7N+3bTIrpArfD/E0pvn0TYdMXju6z8MdWxk
 zIidvmuh2QeHvBfG1di2TCTV4TYE3TZqymneJTQvkJrLDYWjpKyLjJvsh
 NHCEm5dra815o80yvWdrLOgh0PzFIQiXxpTBJmxFjTIyqsTfclRIU28Eg
 J4cgBzcpQBXUwnyRT/IvUwKuZ9uAJj+pv6TG7DhYTAkf8Q+pc1eSswnPC
 VL++2IFa+hUSAmDnYKNp5dsrEzEknFW7WZe4thFzabS2iOgeZPNBRjgUI Q==;
X-CSE-ConnectionGUID: h6JdZX6MTY+kTopvH0xqyA==
X-CSE-MsgGUID: Ugr+BED9RHC2j1r60ZAEIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="71946081"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="71946081"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 20:25:06 -0800
X-CSE-ConnectionGUID: /EZwV9ZeRiaFT5c6+YGs4Q==
X-CSE-MsgGUID: 4rOBh3+YQqeH2PukyBkTzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214874297"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 20:25:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 20:25:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 20:25:05 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 20:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9XIg45CgigAqyCo7DaYVgat/3As4rpjCeyg+rAv7SFqPq8ZXnWkhOU91+Uv5xARwrs9qImNk5wQuDX6kuRLhloveK7JFP+UggQyaZfcJAZYbXOOzouVK8zLJjlHJiYhf9rRp6nELzw0cmub271Uz/DzC8iy2jOHNSVOQgBsV0An7iqmlq57rV7YPmpmAdhCEgG3cc55E+bhWGrEEeHs3xvkZdYxeQaQV09tLFGLXfjRSZDE/Ce3rXCOW+mjhVmNuJDg3u8YeLE39ezGQw9os5pQiFQ46lwhP6yyudP1iNOU9JjWPrQFqoYS5KBlv0g+GPkRFZ/UzLzqAepFfOXGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZXLAJ2yGA9AlEIiqZeQDI1zElQJ955XjwfMU717EbQ=;
 b=b3I1ufHyRgUzvsOt7mc2LQnLyhttWPdXeNYcf8UPfAIZYuNixokhM8pECYkJXIfOZIfYwBzjaIFWvXJErs6eY1+ujf7WwKPwrn7qNQpQJkM3JT77LX0FkGwyS43c1RpCWypQZWVEVvM+IeHLMxwgK3MGa+clm6WUR4m3UVoPCggEC+rKxG/tQUBftO4uX/2hZ/puwAftjalXtIp8trxdt8bPEZpv2QWQjtnA2D5YlGuorzNpzVJBprSyV9mZGuN0N7+O5hIoGJ6AuAr2G1yIFzbH+SAsVlJzdaJzqq/zej1peLypCMV5SWZTTY3J488GtLqkwzcMdR0xPPS84Vnuow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH7PR11MB6835.namprd11.prod.outlook.com (2603:10b6:510:1ee::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Tue, 24 Feb
 2026 04:25:03 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 04:25:02 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/3] tests/intel/xe_exec_store: Validate PCIe6 relax
 ordering
Thread-Topic: [PATCH i-g-t 1/3] tests/intel/xe_exec_store: Validate PCIe6
 relax ordering
Thread-Index: AQHcokuiqdrM9PGpZkqVHuLRYhYGr7WRRRzg
Date: Tue, 24 Feb 2026 04:25:02 +0000
Message-ID: <CH3PR11MB8434DBB5F60C1C603005505B8D74A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260220093041.1911492-1-nishit.sharma@intel.com>
 <20260220093041.1911492-2-nishit.sharma@intel.com>
In-Reply-To: <20260220093041.1911492-2-nishit.sharma@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH7PR11MB6835:EE_
x-ms-office365-filtering-correlation-id: 1b4ce1aa-03b6-4a77-d4a2-08de735cae12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?e4lQ8J81clKigi9PItCM9RKkyew4HPJPMPzSc++UNV5sgRWeX3rMVMXf+9Br?=
 =?us-ascii?Q?60ghlWsnldIDsyYjw8xheifBXGpzEFa4c+o2wcW5Zc4OWPFJ8MweTbavHjpP?=
 =?us-ascii?Q?eNv3OgoiaBrgZ4AjcQ1EmKlGtt73LoZcpniiU2ym92wYLUKLhGdtuPwFLwPR?=
 =?us-ascii?Q?sJhrNasxt2fiKaizdl4wrFfJWeDYozUsKWoeph1PK6U4OEZb1p5q4O7kP4s9?=
 =?us-ascii?Q?q8OOX1SL4t1e7PNjyt+wRT9qkUxs9wH1ZjI/uzsvMl+r9RWPiWdjw4TevszE?=
 =?us-ascii?Q?A519dg0TgkSrdCkcjfO8QdnX8KOcpMtgWskBZCKtZHodDlWkCB5zXGzurZE2?=
 =?us-ascii?Q?yYB5QmeellRIOeflOP2gj48MHETecaj78UWKFouL3N02Tw6njGp5Naz+7XAh?=
 =?us-ascii?Q?h/ZCql0fpfRGtbpa3EmaRKOtkR+NiI1AW57ggZKz1WKTkq23tKZFDGxMk9TI?=
 =?us-ascii?Q?Tzd5XBFaJHacJxnYCstTCn1ZD9yQqUFFkwrHYt/VYeSVadGPBy5Lzk+uLuMw?=
 =?us-ascii?Q?7v7UJHj4YCDLp/G3hHJ0vvtjJNDbimcctTDJafYpeoOoLZGjEpjmvrzq3lWK?=
 =?us-ascii?Q?AP0lj40pnDUTbDcDCVRITf7LkoFWTzkTqSxogLTqbJk6zP4OEA78T7Fxp9L2?=
 =?us-ascii?Q?JhuGaX81ukHBRMji1KKCH/amjaBWWrSC+lkLAfjM4D4dzRyrqEGiwEAbhyVp?=
 =?us-ascii?Q?MhrO97ZhVNgRFN2tkDe6lGFvseOgTnFVhjEMAvXIRQQXsgCajschKOBh71wB?=
 =?us-ascii?Q?acLjoGMzIP8u+MckJHCGiWttXbzJgfHqlU9ERH81XoVRZeBjEFTd9op/+xLi?=
 =?us-ascii?Q?V0Z1Ayd0YBuIgR0sUlAUzcvK20v5zAOqqC+dp9e4c0NTgGzISaVxJhDpnZ9x?=
 =?us-ascii?Q?4R4ZBFDKp9Ch5YNqr75drZXSC3SAnBKNCNSS0MzoPm+oCx5yxQGI0I+TalAj?=
 =?us-ascii?Q?BHt7tVWpo/V1DmLumS3rq6IGG1oXVLHIa4UkHM/8R9FjcJhvUDxhiYtixwe7?=
 =?us-ascii?Q?jL1PoJPR56s7QI8VGe/ElzR43i4d2eKLF4SdWyGMglCChvoXVx9lgWx+l6y3?=
 =?us-ascii?Q?RJ1WowxdzyL3HmZ+6dK6lhuBgEr+2f0emkICL0JU0gfhTD4cTlfulYKuqpcn?=
 =?us-ascii?Q?JZUjNu/T5fskzCWtGCa3oTELuocU1duMiTZ2EOBREFVw0EwvyNXccknzY4Fs?=
 =?us-ascii?Q?X9H1FPbnVjKrCn+7kOPMmxmTgJPROGMtyEDTMNjzos6+d0Gsu4+t6E9G5Vi+?=
 =?us-ascii?Q?waXc2u0TMsZfh8L2A1ms+xnEbvt5xeuhXUMdnV5FtK/vfWK2f0tci5pOPAMD?=
 =?us-ascii?Q?lZjqeHLwj2VFgFuM+lBqnLnWOZQFirwx4uy9orB5Dl8Ssa9nyi0skYnfhqvs?=
 =?us-ascii?Q?7X3Ybpq3olRji7RpX1q6PzxtAI3rKS+K7gXcXWfPuy/xWPE39t3NRIpnYO48?=
 =?us-ascii?Q?5/qgf3EsZhO49m4dYdaHchvLnOxMUPbJIM7oj31fhWHgux08jro/zXWXMktq?=
 =?us-ascii?Q?w0LK5G/zFBRHdP3aTRlQEk+nDQ6XCRUcKa8jW4sOsQYwTocBbyTNZMLLbEWH?=
 =?us-ascii?Q?/FunrFbj3xbmIfbV+ZSpsG9dlp8XPxv+uRmbYfz33iOVdXBM8eleXBsCx0Qf?=
 =?us-ascii?Q?33pGzx0JE6cvSyGNjEMHalQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/hNksG4ejTswmV87W0/l3Y2OKyURVE2742tBY33hN2oW4Jg3qvplvEDp0yLr?=
 =?us-ascii?Q?aQojxGbcy/18+Ne3h2ZTUTRgttljj0Kom8DkPP8mJV7ikujcpWs8pbjEWHKM?=
 =?us-ascii?Q?Ak0hbu1LW6ubBJD1e1CBupPKvf1veoafIWrGcmrXzpeqUJU2ls6nNr9B/iiS?=
 =?us-ascii?Q?Qt7eVjNDfHndwnLeq5Uk5I/yjCFGOyvQllSVywhTP9QkVOUmVLIx4Pdn5oMH?=
 =?us-ascii?Q?F/EW3TFtWuQynyktYN5hZECSvZWR51HBEpdbOeEscC0rmtNRbR4OqvHmWkc6?=
 =?us-ascii?Q?TTWFWQ3YCiqQnkv0JYr4M60/ITQmtm6FHedRnFkGDZ4dRcwNcqMQGPtcsXoB?=
 =?us-ascii?Q?HPxvU4EmCk9QDBC1oFOgMWeAw8vSU/JVIfANNv3GkKCxWX2Zw3fH9GXS83eA?=
 =?us-ascii?Q?OI0RWZaInWwprk3qozuF4O2M1U4q/RBDlXoWPnnvHSb4dTX7doJPtqQVUDOx?=
 =?us-ascii?Q?dxCjYjVsPm2cLRXZjWeMKCJTXHUPlgdvv8WIFbqF9hBGMTr58fpgtbcU0sLG?=
 =?us-ascii?Q?G09x9JO6xZq6YUBTfc0k6WTEi6S/N21emOGxfeqyoE1PNNXDn3jl5D0+ha5Q?=
 =?us-ascii?Q?kAp3zTP5ax45AuyHer+s7A+BW+getxO2xX3j8a4Bb3yiDv0yQMhNkLV5wduo?=
 =?us-ascii?Q?0uPAIspPcKJLhMc2fnE+MC9mliU7+mG+fGPYYbM6VFnvTG3v6IU2AKSQAZy2?=
 =?us-ascii?Q?oZ8YZ8yIrF+HhDdI3w6NCWACVkzoifZZNQxqbXvKyov+iJxQDk9uSqWFWazw?=
 =?us-ascii?Q?3KsCpqJamyIGqHwEoOxZs3u11RDU35UooUMS4eajamyBr5fH1Y4vznbv27jV?=
 =?us-ascii?Q?Fg2vSrs/1fXIorId+oFb9rYqVl3fjvZzCwSmKjVm/X6KtWa4NncZkJMpDxu0?=
 =?us-ascii?Q?nFrJhBiJztiIHpR4A/2ktryzpOmtL0EfCERnYvzTuLZw31LA3i4MvsvLuMGu?=
 =?us-ascii?Q?KowZcrdAy8ejU6rKwkTEDAO/CwF9YbRe4fELVyTX9oRM/2R3qhxd0lAsqwJZ?=
 =?us-ascii?Q?Y5PVdvm2RSlyed7f2jrvIoeSWMZJ9kAxxihFvaiRW5ME8jb66Hf6Vd5EBlL0?=
 =?us-ascii?Q?hKI7FUBklcCChLYdu9T+cFhFILIo51QnFDP6xkV5ykNxBKryWtJlRtr+uErs?=
 =?us-ascii?Q?FfFckotO0vdHDk68ExcQV+aZ5hWqvpTfoG+6yaRVMgUJqM9lslTxTVQFTmgB?=
 =?us-ascii?Q?lGqBw3lYBVN3dHcRdfs8Bc9Fm/1mvx0A+87BvkJ0Hz99apLLmj3qNGR2CS12?=
 =?us-ascii?Q?i8Esx2Djtl//A+/5NxabzF5yEE4Z0u1c/LteFb1FeimYTh7mbFHWwVz0hsvN?=
 =?us-ascii?Q?oOa3qQXQgwzwd9dlfAi3pKEKGV6QnfUf1cLr2MNbdwPti6lS+mOvgHVeIj5g?=
 =?us-ascii?Q?fnffLY4iq01XG8GHC4CLtyGMCrVejEOfdYm2QSOp5hOTiAP/o7VY9oqtm8Be?=
 =?us-ascii?Q?/Nznf45357DNMcsrdgrJ+BeMzG8WJ6MpPla33IqOlXJ9QL/r6u791CrPShv0?=
 =?us-ascii?Q?atJL3sQETeIX+IO5L09tSexDzB2M0679hKWvqh+osT3z0tXEmp+XzP48oEx9?=
 =?us-ascii?Q?KkAheEr+rUzp8Soz5p6VoF6zRPdYi95cuVbKgBbsVZUmQMxSgKeU4q3pSkdl?=
 =?us-ascii?Q?woJMx5PBiE+cqrdGzbERk49IyKnQ9mOy6SHDkRb5ROg4EjvhA71e+o6jkrl6?=
 =?us-ascii?Q?UicPN6JwW4HR5dvx7RNCv27Z3viGjioB2nMVvtt0tDgRMXxfVCWwIyUB5XU8?=
 =?us-ascii?Q?0+MU6S3eJKBObgXP+DTrcTZanVlv631RKk2fHFqC1PQUXuhKkjQBRRCwYOnh?=
x-ms-exchange-antispam-messagedata-1: Gaze1McpMeeQjcsm/LLgk9R5zQyXzkFGsMA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4ce1aa-03b6-4a77-d4a2-08de735cae12
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 04:25:02.7657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3O+f6PfmDymbxtu2sn41xz7ZVIZzqmARuJ17yM/mJV7mcnoZ1b8pDtvJpBy0lABgnU7hsohwyhrs2H+5zo2W5zXiZsF4bmTRA3/alQkTASE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6835
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



> -----Original Message-----
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: 20 February 2026 03:01 PM
> To: igt-dev@lists.freedesktop.org; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 1/3] tests/intel/xe_exec_store: Validate PCIe6 rela=
x
> ordering
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> To improve GPU BW, certain copy engine write instructions to system
> memory is using relaxed pcie transaction which can lead to out of order w=
rite
> to system memory.
> The recommendation is to use MI_MEM_FENCE for such instructions like
> MEM_COPY and MEM_SET to serialize the memory writes.
>=20
> This test validates MEM_FENCE with MEM_COPY instruction and also
> validates out of order mem writes which are not guaranteed 100% of the
> time.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 125
> ++++++++++++++++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c in=
dex
> 6935fa8aa..989d9e6b9 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -412,6 +412,113 @@ static void long_shader(int fd, struct
> drm_xe_engine_class_instance *hwe,
>  	free(buf);
>  }
>=20
> +/**
> + * SUBTEST: mem-write-ordering-check
> + * Description: Verify that copy engines writes to sys mem is ordered
> + * Test category: functionality test
> + *
> + */
First and second patch can be combined together as this change getting repl=
aced in the next patch to update the copy limit.
> +static void mem_transection_ordering(int fd, size_t bo_size, bool
> +fence) {
NIT: name change from transection to transaction.
> +	struct drm_xe_engine_class_instance inst =3D {
> +		.engine_class =3D DRM_XE_ENGINE_CLASS_COPY,
> +	};
> +	struct drm_xe_sync sync[2] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, }
> +	};
> +
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 2,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +
> +	int count =3D 3; // src, bounce, dest, batch
What is bounce here?
> +	int i, b =3D 0;
> +	uint64_t offset[count];
> +	uint32_t exec_queues, vm, syncobjs;
> +	uint32_t bo[count], *bo_map[count];
> +	uint64_t ahnd;
> +	uint32_t *batch_map;
> +	int src_idx =3D 0, dst_idx =3D 1;
> +
> +	bo_size =3D xe_bb_size(fd, bo_size);
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
> +	exec_queues =3D xe_exec_queue_create(fd, vm, &inst, 0);
> +	syncobjs =3D syncobj_create(fd, 0);
> +	sync[0].handle =3D syncobj_create(fd, 0);
> +
> +	for (i =3D 0; i < count; i++) {
> +		bo[i] =3D xe_bo_create_caching(fd, vm, bo_size,
> system_memory(fd), 0,
> +
> DRM_XE_GEM_CPU_CACHING_WC);
> +		bo_map[i] =3D xe_bo_map(fd, bo[i], bo_size);
> +		offset[i] =3D intel_allocator_alloc_with_strategy(ahnd, bo[i],
> +								bo_size, 0,
> +
> 	ALLOC_STRATEGY_NONE);
> +		xe_vm_bind_async(fd, vm, 0, bo[i], 0, offset[i], bo_size, sync,
> 1);
> +	}
> +
> +	batch_map =3D xe_bo_map(fd, bo[i - 1], bo_size);
> +	exec.address =3D offset[i - 1];
> +
> +	// Fill source buffer with a pattern
> +	for (i =3D 0; i < bo_size; i++)
> +		((uint8_t *)bo_map[src_idx])[i] =3D i % bo_size;
> +
> +	batch_map[b++] =3D MEM_COPY_CMD;
> +	batch_map[b++] =3D bo_size - 1;// src # of bytes
> +	batch_map[b++] =3D 0; //src height
> +	batch_map[b++] =3D -1; // src pitch
> +	batch_map[b++] =3D -1; // dist pitch
> +	batch_map[b++] =3D offset[src_idx];
> +	batch_map[b++] =3D offset[src_idx]  >> 32;
> +	batch_map[b++] =3D offset[dst_idx];
> +	batch_map[b++] =3D offset[dst_idx]  >> 32;
> +	batch_map[b++] =3D intel_get_uc_mocs_index(fd) << 25 |
> intel_get_uc_mocs_index(fd);
> +	if (fence)
> +		batch_map[b++] =3D MI_MEM_FENCE | MI_WRITE_FENCE;
> +
> +	batch_map[b++] =3D MI_BATCH_BUFFER_END;
> +	sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].handle =3D syncobjs;
> +	exec.exec_queue_id =3D exec_queues;
> +	xe_exec(fd, &exec);
> +	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
> +
> +	if (fence) {
> +		igt_assert(memcmp(bo_map[src_idx], bo_map[dst_idx],
> bo_size) =3D=3D 0);
> +	} else {
> +		bool detected_out_of_order =3D false;
> +
> +		for (i =3D bo_size - 1; i >=3D 0; i--) {
> +			if (((uint8_t *)bo_map[src_idx])[i] !=3D ((uint8_t
> *)bo_map[dst_idx])[i]) {
> +				detected_out_of_order =3D true;
> +				break;
> +			}
> +		}
> +
> +		if (detected_out_of_order)
> +			igt_info("Tested detected out of order write at idx
> %d\n", i);
> +		else
> +			igt_info("Tested didn't detect out of order writes\n");
> +	}
NIT: update Tested to test.
> +
> +	for (i =3D 0; i < count; i++) {
> +		munmap(bo_map[i], bo_size);
> +		gem_close(fd, bo[i]);
> +	}
> +
> +	munmap(batch_map, bo_size);
> +	put_ahnd(ahnd);
> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, syncobjs);
> +	xe_exec_queue_destroy(fd, exec_queues);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  int igt_main()
>  {
>  	struct drm_xe_engine_class_instance *hwe; @@ -483,6 +590,24 @@
> int igt_main()
>  		igt_collection_destroy(set);
>  	}
>=20
Add description here instead of in the third patch as the third patch is ad=
ded to utilise all mem regions for all tests.
> +	igt_subtest_with_dynamic("mem-write-ordering-check") {
> +		struct {
> +			size_t size;
> +			const char *label;
> +		} sizes[] =3D {
> +			{ SZ_1M,  "1M" },
> +			{ SZ_2M,  "2M" },
> +			{ SZ_8M,  "8M" },
> +		};
> +
> +		for (size_t i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> +			igt_dynamic_f("size-%s", sizes[i].label) {
> +				mem_transection_ordering(fd, sizes[i].size,
> true);
> +				mem_transection_ordering(fd, sizes[i].size,
> false);
> +			}
> +		}
> +	}
> +
>  	igt_fixture() {
>  		xe_device_put(fd);
>  		close(fd);
> --
> 2.34.1


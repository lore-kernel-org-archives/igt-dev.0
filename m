Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E3ED72345
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 08:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C7D10EA6A;
	Fri, 23 Jan 2026 08:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VY7M+/ov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DB410EA6A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769157137; x=1800693137;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o9MMHrr8TGGUTyzoJE62+a1Si+waL+MIqEGcToQDvIs=;
 b=VY7M+/ovZ0xStzwlB62W2ESN9uFnDNRL+lLZH4duLNULNwNvonpEffpJ
 fqk389m8raXUHhMImRbMMv7RBQwaivc9K4Sh0ghomZXLr5hKYC1mB547x
 4kMoHi1HoGditrRiJZlICp6KuWsTc0CsEj6XNoSTtK3FucYYnZJsTdYHG
 x1J8j8klpWBJB63IBOLMNHCFTjvc4ftCs1an+fuBEBV58fpXWp8KygBLj
 Uw3xME3P3JQVjKZFiZGS6TYJ3ckiFrqec7gdTgjFKmGK6heTAai+bS4GU
 W2c7pg+rquKnVyy4ToQPGq8t1diXYIZldK20MMS0ESo272Uo2pd2R0mxw Q==;
X-CSE-ConnectionGUID: My3Y+KSaSsupbPIPf5McGA==
X-CSE-MsgGUID: E7X564XDRTKjkTvBelI07g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70324430"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70324430"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 00:32:16 -0800
X-CSE-ConnectionGUID: YJJs/JEqStW+psuOYMaLxA==
X-CSE-MsgGUID: xyoANM+CRWeDyKMFEC1fRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="238228842"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 00:32:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 00:32:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 00:32:13 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 00:32:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDn3pMfALm7o+YGEgjkK15o0P2uZ1qB6LPQCdOxfZLjv2iUvd8TGxUPJgCG6UWBrYYoCJkxQKG5WoPduI2zu9ZardNo2uP/uLddxtvqwzbsh2iFqQX4Ode9Zb8ziv1nzXZ+TLWIQtq5UZFdTYxI9wPsjTqfFRjzoQs6xIwZ1dnYcrLCJ1qFIWHD64Nnvq3XOk0tivlAHJXTVrBdCwBvExo/by7xgjBD0BlgDKUOaDlFSONH5/xz2WRGcHpIUwtl+gDe27CDXMgxawHbwlh66Bpd6AeicIl6Zl798tk/Pd4a30s0GTOia/yRzlrRENl0lQJFSXS14ftbvUQhZqtUxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlGrlALHaast7k9AlsT9PfP2O1FXjSRCpXewj84792s=;
 b=NdKuCvK4o3TmWvunwy2p53L8KD39c4M5GOMMqP3EOZh8UAKrw8xHQSYvqAyq76F9oDGcS/lO9JDsjXpfcTaJITZ8SCdJ0pMjzBOzdqDET/PP7KDgTE6dTiOOl3sLVjTsrvbmUfF0IutcC6fRGcmanJ/lNwj5MivDQBswcuN8dwJuV7zA5Szvnv2a7YEw63sWomNJFEM4CkxIxPhuklAwyB6fO6QT5Hqu19Auh7AuBPmHCy8JvQOS1n3EUQE/iqQaWn+dz6UGVuA2Y1AC6mAnorPigD4dxAdPqJnAD0RnaTRiPha/9ctA+zA963w/BrOcaSM4U2CIw5llKcnQS0JveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 08:32:11 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 08:32:11 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_flip_scaled_crc: Move require checks at
 the beginning of the subtest
Thread-Topic: [PATCH i-g-t] tests/kms_flip_scaled_crc: Move require checks at
 the beginning of the subtest
Thread-Index: AQHcipZ34jmsxT8qP0O9zZzuj7s7cbVfcD7A
Date: Fri, 23 Jan 2026 08:32:11 +0000
Message-ID: <DM4PR11MB631214C80115A0D3D73046859094A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260121052158.491159-1-karthik.b.s@intel.com>
In-Reply-To: <20260121052158.491159-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB6548:EE_
x-ms-office365-filtering-correlation-id: 33cd0fd0-1ea5-4b07-93cc-08de5a59e75b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?l9fY5TFzTEYWLlx2L7M8clUzWdNBpKHwRDowM+7BR6wYUdN4ET5BIWqEC4dh?=
 =?us-ascii?Q?54DdpIXhou3Ci2B4lpD7JztMfEVfvueto5dyJqSVW67AiNEKhGav+/qWaLPA?=
 =?us-ascii?Q?zJcXkmEz79scXESyn/kzCsX6l4Kh0k7OHcuH7+pV5z5cTMQzwBCFaffb2deh?=
 =?us-ascii?Q?Rk9qV4rAxueOqe9zWd1Nn7ppNDuJInKKPfKcd28FcLa+4kjNJPhwYrNJN0fL?=
 =?us-ascii?Q?AiAMF03NrYk8oX1Ep0ahu9K+fWJJh6mYJm1/5ev9KeqTHdDhVaH30+1UY5Nr?=
 =?us-ascii?Q?ESxADGMTQu/b+wj1ZWR0We9MyDKJUS27mMvcVckcLAtYsv3CFxy2dhCtxkCN?=
 =?us-ascii?Q?7DV7b4Cz6MqyCdGLdpCYgVQ9ReyVGPCDQojudA2MBdtA3OaKuxktgv0vFsJb?=
 =?us-ascii?Q?7PXxLkKUcnGZCjwbswpknjf8bXu/rRLZ27hw8RbDni8tUarZ32EpXDZCutfp?=
 =?us-ascii?Q?jZCUE/veIy4LNcABVoSFyQGCtmat1y6/8H6lfCKuHmcU4X16GI3BS+dvZl3E?=
 =?us-ascii?Q?SEGhpuQ6PqEQAV1KzPXRZASybXBLMrecD7eQFm7L/7N2Z5WArZzLm2IlDIZi?=
 =?us-ascii?Q?s4mgwM4PsqioqPhLk2zaa1X2oHeY/4+KZMilRz2DvqApAoSj/HumGcFGnI3T?=
 =?us-ascii?Q?VgsPUiaYRwaPKUN9uHrTkfGSU67Hkg4/jDq9QxnXkvioVi7xVIOFYJIpeqhe?=
 =?us-ascii?Q?ReNOjblpZKs4sNYAIphMXcKYgAspx0A+o+0DS8XfQ5FFbRoY8caemZ7XaJ20?=
 =?us-ascii?Q?hTYGVKlacnQooTPtyTNEu9E/ZwEHCrG4WwiznBenLCvndtg+IxFzRYgyVX7g?=
 =?us-ascii?Q?s71XbywlUCFlzIVVn/j7NyhqU15k5bVKuMTD6CkpoI6pHGh5yvZ6JENNsUbV?=
 =?us-ascii?Q?HRKDXdKEei3GsIM0iDcN2z9l+gdbqBDtBAdjwFszFLo5RKfgR9jYL8KOSOVn?=
 =?us-ascii?Q?CEghyXxiuD4mLUn9OE8MdJw8sLHfb7gK7/kpuCYhSpiMCu30LBr861teXAcD?=
 =?us-ascii?Q?qf5elVeowTlFh1vPWGJuv8LfcGkd0WIV8iLEI8z42c7zs+Ik211/zTJeDhdc?=
 =?us-ascii?Q?QzCLx/e4NuUQyIgx3F2g8XAr0XU35BMniNuj7QASEqObw8H35Wu+ZS0PiSnx?=
 =?us-ascii?Q?xr7f7EnUDISco4GpIqvqC1j44YWHrHY1ImK5TWlNqBK0Adx2hm9JT5xjldwa?=
 =?us-ascii?Q?vqcZFSJUOeuIzTEaIX1A4RflbtxzWfEvzCmGtdJhoan9UawJXD+elRM54bYe?=
 =?us-ascii?Q?PU3YDMqugXxwLiri4ImNbTXyO+4Rvtjwof/Kz7jk434pSIDuK65wyL97tIjR?=
 =?us-ascii?Q?hmivh92JuDQFBg/liZ+3WA2XAm1eYDDUuIdnHpjNwlF/0vNPo/w0Pwnk8m9a?=
 =?us-ascii?Q?yFmFT0vn3k9RZCalhZyLt1XVAxn/hqDBz2aSCQdMwpKrRE2oB25urYSXnDZG?=
 =?us-ascii?Q?VqzZjR9dKUDYCHgcnnHTbcnXYl3BPQJKGDJYxpDgAwmgEgqJhA3KcmleVnZX?=
 =?us-ascii?Q?New6mZEJYQ3tS5STwfXhJxOe3P3acogaH5PlFVZCqKA7A2oWxKcJ+dp7RNNR?=
 =?us-ascii?Q?Rh1fzNdF65iqi3XFaAo+SoDD87bbjnjGyHZ8qh0LqOjO5EDPW11X099wn7+C?=
 =?us-ascii?Q?KLi8jHOYVIbd1/IRruy4X6Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZjLRtdfmMLhUM3qcpqkI7fcpqfgl8REKqBXojQAzv0ePf3+/1i35fknXnaLW?=
 =?us-ascii?Q?5nzC5XZB1wVzObgo7LSyPLNDVzmoCzPYteS1U9iRAJeHOADtgyMvi5NaDHwz?=
 =?us-ascii?Q?TN3KbtwAcy3DgB09xBUvl6RPlBS6Lk2yDOs3s87+gYoqIGvEtkeskuKHjZh1?=
 =?us-ascii?Q?GFo6kqFU7IgwsPdnOwVZ9klI1W/icyQ6SXm0iMzWLxhtP0t/lcGhwyGl7Zpz?=
 =?us-ascii?Q?vEmt5zRJUAgj/g9uc97/m9M44SSiQY/lwfsXo7I9h47g3yvl85YmqVom3Qzh?=
 =?us-ascii?Q?VrLxo9Yy/Wd6KPoC5dASsp7+tYhq9727MeA/n/gCIEurU5h1wnRsY+TWyn86?=
 =?us-ascii?Q?Jw4oJUhXVHjMmtKpJOyL8uTLnrA093y8gaH5PhaJlE4o9AvL0BVb16Fmo9Vk?=
 =?us-ascii?Q?rTo1KIRQKoT/YNUSva+ek35mYdfN3UZ4En57bP29PKnm06eQGqOh6vou89r9?=
 =?us-ascii?Q?IEm8GcZkyePjxgw3b2je94lqnseoswlbROzRMo/3nRBqrLWcXf5EBnTgpYrf?=
 =?us-ascii?Q?rjgAuo6594WbpWhJVERO27FLZp06NMCa6P5Ybv4Mgcvf0wTMo7Ya8hbu6Se2?=
 =?us-ascii?Q?hqXDXj7ufU/8ff27DOaxxPC36nH5tvPn3pW7vvYwdvU72tHJB1kdNnq/7nLU?=
 =?us-ascii?Q?w7pDzcRqUFgMyGOlCwsG6xuRlu2iX3oA7guKAOPEpn+nNtE7PMlVYuTuNubR?=
 =?us-ascii?Q?Onb+rWJos/xXZMphhruqvbHMP3C0v5/11o8in1hRPKtt0j/7M5YC/PbHkSLL?=
 =?us-ascii?Q?dqiOQdmRvCAiM8/0UTNPQjaFUxZnlklRMN1MFGUYG1YCESs8cJhXYBZ3UCWX?=
 =?us-ascii?Q?pjmOsBt9PFHTDQjNE9KuFBjpIEHUtiy5aE+nB8mcQyepfNh9KsU2haRW3eMO?=
 =?us-ascii?Q?oXHK5zN75ld/+u62HylYD6TInUfeRPgFiUXZB44S5sqD4u/ysnDL4AIJCL64?=
 =?us-ascii?Q?/x4NpnIOx79tzi1NI4Q6HiQhfYWgMuuZRVUnr2EhOwObvmsWJym9k8tlBJdW?=
 =?us-ascii?Q?KMwm9NqWa4eOxTN+kaVDrXOTHuN+VTryx8byHZ07mr0YsOaFABwg8TLsOZhq?=
 =?us-ascii?Q?WXbqbhFNmHaNXnrpoHJBPC1nzUnKw7RJnVm91+6AiFTIGYbCEVRed2uf/UKZ?=
 =?us-ascii?Q?xcnxONC2+xW0RtWgjCMGTSxsp/88cyUEBIkolIn/iwB05/SN+dvacN0a127w?=
 =?us-ascii?Q?2cYCnVgLZp90kRVnju8aHIQcST7477zY9EVFNsbPbgbN+lh7SWRmRESLzWxX?=
 =?us-ascii?Q?T8Xek7ESnggtnq/TRll0c6f/Lhe6nWUxWPliFNVCejbRo6o24RNvmS1ElbXE?=
 =?us-ascii?Q?qbE4JMBsZIMDwkg0DZu6Yy7FqY+GcIV3HS3KG12DDWgFlQANT5bQTgXGuqDF?=
 =?us-ascii?Q?b8Y8K8vc/5frOSrdkEgOkdf+APC005siTioYOQ2tHpqxEcdkmRdcAxs1eSqi?=
 =?us-ascii?Q?mY5gawmkGlxZByf0OfR6cBhvnrEmZtFCe8Yfbr6rXNIAqTrNLQQobeEZVl+b?=
 =?us-ascii?Q?ecOmqQuumt4CxhAeYc3tAXAUZVEDM9D2lR0HqMZmAwwG4c9IRaKcgLx1ZdYM?=
 =?us-ascii?Q?hioVycc2XghuC2Z8ozgLt4+ZhUoeWV+qGYc92QGrf06FaRwuqjlM59YQKejW?=
 =?us-ascii?Q?pz4x+i32JfabLkwPYPi8HiGiZveP5lTcNtoY7pV4bX0I8vmE2dg9zt6bmFay?=
 =?us-ascii?Q?u7eodfaAtzkvHlIzgd1m5zM+Fde+w4AQRFWhYMZhO7Bs/q5q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cd0fd0-1ea5-4b07-93cc-08de5a59e75b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 08:32:11.3141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHuYDclstKbhl465sJZAEYqDhf0WB10AudtywWLsacYo5Uq1G7NIhRX66vxJN7iMPEH4xa3CpMEEHE/+g1rP5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Wednesday, January 21, 2026 10:52 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Heikkila, Juha-pekka <juha-
> pekka.heikkila@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t] tests/kms_flip_scaled_crc: Move require checks at =
the
> beginning of the subtest
>=20
> Previously, setup_fb() contained the igt_require() for format + modifier,
> causing the dynamic test to be intialized only to skip eventually if the
> combination is unsupported.
> This patch moves format/modifier checks to the per-subtest level.
>=20
> Additionally, linear framebuffers combined with REFLECT_X rotation are no=
t
> supported on Intel platforms prior to gen35. To make this explicit and re=
duce
> CI run time, the test now performs an early skip for this combination, cl=
early
> stating the reason in the skip message.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel/kms_flip_scaled_crc.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/kms_flip_scaled_crc.c
> b/tests/intel/kms_flip_scaled_crc.c
> index 954b46b5f..91e5793f4 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -670,9 +670,6 @@ const struct {
>  static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
>  		     uint32_t height, uint64_t format, uint64_t modifier)  {
> -	igt_require(igt_display_has_format_mod(&data->display, format,
> -					       modifier));
> -
>  	igt_create_color_fb(data->drm_fd, width, height,
>  			    format, modifier, 0, 1, 0, newfb);  } @@ -901,6
> +898,18 @@ int igt_main()
>  	for (int index =3D 0; index < ARRAY_SIZE(flip_scenario_test); index++) =
{
>  		igt_describe(flip_scenario_test[index].describe);
>  		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
> +
> 	igt_require(igt_display_has_format_mod(&data.display,
> +
> flip_scenario_test[index].firstformat,
> +
> flip_scenario_test[index].firstmodifier));
> +
> 	igt_require(igt_display_has_format_mod(&data.display,
> +
> flip_scenario_test[index].secondformat,
> +
> flip_scenario_test[index].secondmodifier));
> +
> +			if(flip_scenario_test[index].secondmodifier =3D=3D
> DRM_FORMAT_MOD_LINEAR &&
> +			   flip_scenario_test[index].secondrotation &
> IGT_REFLECT_X)
> +				igt_require_f(data.gen >=3D 35,
> +					      "Linear fb with REFLECT_X
> unsupported");
> +
>  			free_fbs(&data);
>  			for_each_pipe(&data.display, pipe) {
>  				bool found =3D false;
> --
> 2.43.0


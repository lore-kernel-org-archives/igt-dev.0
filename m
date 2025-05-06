Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B788C3ABBF
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 14:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F6D10E695;
	Tue,  6 May 2025 14:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu7v3FDi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CD610E34E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 14:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746540225; x=1778076225;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LIx8PGECJFM3BRLgzdE79U2vILVf0TlDNaybZBO4nAg=;
 b=iu7v3FDiut7Rl7r0Yy5M11YE9TWV5VFS+8Ljo/xp5918Gs8jux/5b1x7
 Xj6YddzXszXnPgNw0Lpv6zRPnVCsssD6XOY+MOS4yorO/6ySjCnppvaHn
 dcmcWCwGeg2dcgsk4EckoceODki0PGoijO1Bs74YIhw69fINqD2pw4Jcf
 1xX1BIz4GfsMiRxeekTSjEA9IlmgckF/ygZnQS1GJo08ThteixpKx2JYE
 CoKo/Hlw2tmlHpg6zcSoXl5dK1iChEdIz4ObaJiKKIy5LyYPt6lBnqHPu
 rlgjdB+RsfYlf3Q0mujavEj7mVZH3FojQzypvSUrw4wGowkqybQGU33OY g==;
X-CSE-ConnectionGUID: vdRJ7Z/yQ8uGG1gGE/7iNQ==
X-CSE-MsgGUID: 6Vll+h+0RmmgegXAmflc6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58840404"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="58840404"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 07:03:44 -0700
X-CSE-ConnectionGUID: xGdegs1CSlu41x+vqsmBFQ==
X-CSE-MsgGUID: dKD0ANHlTIWSUkrLA/+g4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="135336597"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 07:03:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 07:03:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 07:03:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 07:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yno33BbaU7nakdmXlfMXWc/rH4EbIe/vm7CTt38Nik2ZHL4FGPOqp38LhKRtsw0y0CIH0Ezj4HaCB5pn00mgn0JSlklFb/BVl3i9/WiuMkfYtcHbmJ886GxjbMncDaFMyNbrMwA2rLnvSnvZ09IdGSzDSE69SCmXOp1M3XOc+XPddb3JSpmGA5GXQldsfcqC/z1GIjyhkYE47aNz7v6p07VwpUtr67GB4TNaQnIvynf7azuhQGi+DHWH3eCXE8lbowlRdvv7QZX9TvVQia+kr5CXo4oyB49GN/Nv8h71xZUghNE6EXvJ5QPaetVqVPCE7rybtiBHPh/RdpmlMjz8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybOtSxWr0Cb5At0MtmWEZWpZPi+WJppAJz3sNZu3Cl8=;
 b=powVFCk11hAgJ+Zc2lKHV57/s7krmSyEMHwmzIO0e/Zk0K09v3F0EtHriGyFL6RRKXBEDhVb2iJ6wIEQqWUKX4LJxgFY/Q5lOC5KpL6sqne/s79fiyn92RorjuUZLwif8miR7Tg3cxFG3iX4UZJ0TOPWBXpPjqdZixMJ7CvOHPPBuSikM+u4Q5QvJORdHnOpUVxT5l6pqcOzBwoKuz4NTIdMp8vVyQCruW2eS4C+2OVk5NxHKgUQfC2UPN9XwF8qeUTeBiXHm9ssoasfi/RVdoA8ApvP8fyEyKBXDO5qO6KJol4rfBkKC62AaBohndtFZpeg3MFJk6TyASxApr6b9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 6 May
 2025 14:03:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Tue, 6 May 2025
 14:03:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2 0/2] tests/intel/xe_fault_injection: Suppress Guc
 CT dumps during fault injection
Thread-Topic: [PATCH i-g-t v2 0/2] tests/intel/xe_fault_injection: Suppress
 Guc CT dumps during fault injection
Thread-Index: AQHbvo2GZQbrJITV4kihhQUa1UtXPLPFoWvQ
Date: Tue, 6 May 2025 14:03:18 +0000
Message-ID: <CH0PR11MB5444013151BFCA13EC5F67FFE589A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250506140351.29612-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250506140351.29612-1-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6195:EE_
x-ms-office365-filtering-correlation-id: ab82a87a-011a-462a-f3e0-08dd8ca6c0c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?e1oUYqgCR8J0UyVDl0YTpfijrdL+HamOOkCTBK1PAV9ebrcp58WuV4x97xjQ?=
 =?us-ascii?Q?XLqWXAy6/9PSy71mfkexqQVv3UgD+8KLhyhOLF0wdI2dGCydQY96wP002vzj?=
 =?us-ascii?Q?q6gjvF8aCqE1XuAiyKd3F/oZ3w7Tb8DlZ07NRnb3tikuidokuaoVDbTqNNua?=
 =?us-ascii?Q?DrnagLKS8ve0aIDDc3VkIWj6Y7+hm5s92extnuvoT1+geU7Szc/LPhbrZwEl?=
 =?us-ascii?Q?yzvbEN/8Dg9hDVI8JIfwTr52/9WOIY5Hnu+pr04DhCsbFp3BTyq7RFUEq/A1?=
 =?us-ascii?Q?96nJNLY0ghwTww2bgaa2SIScjRgyyJ5Oev5Va3AaKzrY3ML1Iffd4ljaP7BN?=
 =?us-ascii?Q?90u0iSR8/X/LxH71zNSHgEj8vTzLuw0AVf4OIhD4yDUBmATKF/7rzJNuWn+4?=
 =?us-ascii?Q?/CB9uXp720w6nQ/wr/foQbh215Pfg0e1XGkU4yh+hYgHSfrtLpKI5/VPMkhc?=
 =?us-ascii?Q?a8gIhmp/vrdBvUJ1UjhEetzkUU8RqAToEiTWq8I80h5RM7prKrfekHLWtrQq?=
 =?us-ascii?Q?XhiehQ9FIoATgHpheAkYBZIpmdEftUy8ad5hsysVLoNbs7AlI1GoFT7YDVr2?=
 =?us-ascii?Q?HG71W4ZrvF6T98S1NAw7fpRI5JDuBKF/IJrPI1/L1wWrYjv4khl6lb24aXbY?=
 =?us-ascii?Q?F3AfItS8ZDsiGe2tuJchnY8awiDBCnsC371TUxhwTJVHm8EnKTJvrIEQDJGC?=
 =?us-ascii?Q?X1zJ5EUImx2tramn/nFWiKS7eLvqzRrntZVi2ck+nSCRatgN80oxgKoZCCiY?=
 =?us-ascii?Q?u6uVv1cTEWlyni1ugCe35nRGdpTqgH+iUSoQ/g7SqSD6r8DvQo/Sfux0kihC?=
 =?us-ascii?Q?fSGIRNOFMHo6vp4e/7BikcBiZ8teJySHYuQaCRB9vuLU6gUBebxXs1b+RbmB?=
 =?us-ascii?Q?whd00Cer4GteBG+v8c0uOa7ktjalLJkvIgL2YHk64JS4OQzoUWv0TlOzIuId?=
 =?us-ascii?Q?CykqVQbIHjzgCmoApj5/ae2udwtm+NNzIbEEWzJx5WrXhUvhayKSCfU+ZBRm?=
 =?us-ascii?Q?8BxPS+sdt+59i+p3NHgkp2vr/JLaTYtHarV0LtQ55v0Esabs9c8YPpkfMWvH?=
 =?us-ascii?Q?OvEJOmI0DWIYWdQwLS+zwoxsz4yA8cMEEu7tnT5aV/gfEA0t8XZG17ztsNQC?=
 =?us-ascii?Q?6wxdpSkNhvCwGlsZrUsH7zZ6GL3JDE9AKY0KXsuT72AKAGpo3kkQIjwqhQr5?=
 =?us-ascii?Q?vCwzEcRtJWkagf0EWHi00de2nc/A1EVQgJyiYQ1+agH7G22shmOl7H56Jq41?=
 =?us-ascii?Q?swrLpvNP77K/WvxoVEpz69YMVXZS9YfDRbZ2HAMgWznVBWXOG5jBHnaWXHUg?=
 =?us-ascii?Q?QrXGzB/2NzrgKMOo6crkq+EbNjHSj1yFiQSYZbipE9OyDHKT57Va9bF90BhB?=
 =?us-ascii?Q?xZYMbsE+cXtaHfBFswECUFhSgyqF4Q1QIjExaOTVbvcxpQsASXKbfR+XMI9R?=
 =?us-ascii?Q?TEn9GpZxmzjjTaQKjSjFkgT67qp+9BTb58xBLa+PsJpv4fJ8rJQaRAIQWUDb?=
 =?us-ascii?Q?A+1Ch8vLcafwtiY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qp+4a8rVrP0HJKSJs7ExgA4OhfyGY81pj49sG++nRz7mkQj3QEEDnHL7Yol8?=
 =?us-ascii?Q?2FTGNLT/CNHNAfojZVDAxc/sfekOe7WTezdEvNmPnoBiVqMiP54Rut3jvc2T?=
 =?us-ascii?Q?qA0Pc3y63enrHuCG0Q18/aCvtN73NA4/LDCSyQluM5wVT859yUQNTRZJBiGT?=
 =?us-ascii?Q?pdSO4wSTTD8qEsbmFLl3jY7VlRS4W/KWGJvYtZ1141d8IuY7J5cf3J7XqvsO?=
 =?us-ascii?Q?PeFvqSOs/JGP6gQn/Y6REKoxk2ssNz0PiKl0YKthAGjmTgapkJPqRdT1R2b0?=
 =?us-ascii?Q?TwqQTVf06kSD5wWMqupo3Eh96nXFqvQplECj9P7d0j5vgAhLxji///3sJy0C?=
 =?us-ascii?Q?VotOeCBjcxmyGURgkm72k2q5eK5y7OTGvRUB96SnF8qj3owVq5XKq/SlnN/m?=
 =?us-ascii?Q?WVzFv8r5uaqk43x1Yt9punaO10fWm6lypo2duWcgTs4RveW6HqhUYdiLaLzq?=
 =?us-ascii?Q?BArY1Y5O5UYxHfyk0X/9+/RjzlMNki4nGdrIHFEL5LbIKjQ9DbpMwy6a8hPF?=
 =?us-ascii?Q?Tkr5Ii0+35Ga1+UVkUUh89zkVV89KhdzwLXGqa7Exorfkc96k9hEi+MRy6Y9?=
 =?us-ascii?Q?4YRVsP5oXia3ARiwXfwg248BgNLhej5pSgIeOelw7j6FT7UIz+00IS6vM6Xi?=
 =?us-ascii?Q?aVEMiYtK7b5p41Amg1Ly885emrK7AQG2jOTYjp2nARiUv9b+lSokVv8WpRkZ?=
 =?us-ascii?Q?vLRYc0ySVZrpRkPySXbMGfz99/R8dAK9OxLTr+uuJIz3OKxDYrhMcRTedKaL?=
 =?us-ascii?Q?5XMuHWvCM/3PwvlKYb/TKAZhYu7Man0JLhQsaBjRj1nL22J6Ox28Wr4tzkJf?=
 =?us-ascii?Q?Q2qrIMMP3Cq4SND7YnWWYpfzIyUKmiRQwHbXADLcj1It/XHtf5ANn5HW/Wjg?=
 =?us-ascii?Q?q1SRZ2KWX7D9rXxCWxELevVxiEWDa1zRekhfMpHRmyofLTqH/l60WHCCLgFt?=
 =?us-ascii?Q?PlFRPyy92VG8WeJsN9U2MhaEthDiweG+srTcUX96woLTh2nKoWOu2lTytU3P?=
 =?us-ascii?Q?b13wYinV1w116dI0TKBXsEtIeleOwWIiQ4OKNhK6aYoqxwNgkTOgK8AcC82C?=
 =?us-ascii?Q?g4uAjcwpKQy1dXGQZm+74an6ECC/y6oZlnH1RIg1H5+znctAXQd/Rk+el48K?=
 =?us-ascii?Q?YWG4rfGxCIYBtZfZplryjNZSuc7KS1XfUqGa6jjP11hERoY7VKweoz6cGoZ4?=
 =?us-ascii?Q?x94zU4j8w4tpDtyHqSFDogMfIIFftUyWa0R82Z+BIoTSY2Wk1TLJQCL0a88z?=
 =?us-ascii?Q?gLk9Gejzo1tSEZlPWpvFr4hsKWYPqOvl9s+FvyWuGop4Y000a3Gp2tkgOGCT?=
 =?us-ascii?Q?sbnQOvT4AIYwD6tRHAauDaABUnsBnedR8oVihYW7oCaO857YbF9xZWPzhRmn?=
 =?us-ascii?Q?5iyx2CmR2e9KyCyGUXYv8FYeYSiv3p7Tm0Qn+tMZhOclIqPc8Gf7xQ5QZV+o?=
 =?us-ascii?Q?UcGTpE9SZDEJaWzwEOwCW7upQvN4N9X8JANC/BbA4Mlc+SNoQUrGdEt4evV8?=
 =?us-ascii?Q?mNc1jR+GL0flFkxxQ1gZC0bEEs1qR9B3X4raXy29qMcuEobdAU81FP2dHstV?=
 =?us-ascii?Q?ai0MJKz4xj9iwyqrwSjftI4zVULxiaJPeyRJgVCE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab82a87a-011a-462a-f3e0-08dd8ca6c0c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 14:03:18.2888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6LivpVM2HCUFDOankIy3X4om4PE8dRObfVMMct8R+onlMf6p+r83Lg3lwrTjH4n589n+g2biOO9Eeoxu4hTSaitBamiwK7rxlQm7ocgmmA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6195
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

This patch series is
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

-----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Satyan=
arayana K V P
> Sent: Tuesday, May 6, 2025 7:04 AM
> To: igt-dev@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH i-g-t v2 0/2] tests/intel/xe_fault_injection: Suppress Gu=
c CT dumps during fault injection
>=20
> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> functions, the CI test systems are going out of space and crashing. To
> avoid this issue, a new helper function is created and when fault is inje=
cted
> into this xe_should_fail_ct_dead_capture() helper function, ct dead captu=
re is
> avoided which suppresses ct dumps in the log.
>=20
> Inject fault into xe_should_fail_ct_dead_capture() function along with
> xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct dumps.
>=20
> Also, added some more guc fault messages in the dmesg ignore list.
>=20
> Test-with: 20250429134649.4747-1-satyanarayana.k.v.p@intel.com
>=20
> Satyanarayana K V P (2):
>   tests/intel/xe_fault_injection: Suppress Guc CT dumps during fault
>     injection
>   tests/intel/xe_fault_injection: Ignore faults for *guc*
>=20
>  tests/intel/xe_fault_injection.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> --=20
> 2.43.0
>=20
>=20

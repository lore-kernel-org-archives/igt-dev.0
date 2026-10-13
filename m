Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2EACC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB67D10E927;
	Tue, 13 Oct 2026 19:03:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A674A10E927
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918157; x=1823454157;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xwH3uzSc5gBZQVWYxIbBlH7/PyDTMELmGMGmevxWldk=;
 b=GUXXIK8UnmACSCg6KIp9kGclIq+ejQ0yDHeNep5Od5gzI1Gp0sKnyQdL
 5fhRIe9voSyaVjb8PKNO+9s47mBKYn+kYCURhnXcVWUi1nQuBMmk5BREC
 gRQciBocGh8Cw6fbmin1fRFm8uiy+L82R//dG+AWKbj2B0Xi4/kATumwZ
 v/gEN1CHT0wkpvANElXZbpmfDx7g0hvYfC2y0u/V3rVfU+eZwT/v1oVil
 LjhA/i/CJ0sl88Hghii/kXLXAJKvRvcA7l19Q7ClR7HZTEIVSEWvCdwKg
 GYWNbhWcX0gbQfKKsNGbvJUxWrbVAyQkLuzEUVQyGv3CK6UbbcG0KznOV A==;
X-CSE-ConnectionGUID: RJN1KsieTcms0dfvfbjOAQ==
X-CSE-MsgGUID: NVuPjftwRaudQ7mjHU72Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="553227"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="553227"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:02:36 -0700
X-CSE-ConnectionGUID: +5lkFj1FRvaszvi094SyJw==
X-CSE-MsgGUID: CBxXOvjRRtiHvayXb2iCvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1598809"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:02:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:02:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 12:02:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:02:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5JqTcFYnU3jjbJ9yhjlQPZUYALJbqjNTxAZ7LO2HsrahOgOmXE14a5vxRqk/qscVNurbGo2/KAwzgp1cgYjnyVqZWrYm87xZmYyFiog55WmFYxR1J4KxoPxTdGiSeHL3f0LOTsmq4n7iBaPch1YuA2sFU7RKZciryhA2rUdSZTVTtKmMV3GMFnSrJinls054l5rCG5VIKABnRlUNIc7qdGasSspc6+INAZx3lLvwJNhItUIE6CPy9e5EeElQ9S7o9GKh+Df/06E6BEjKciscOhFYfrAO/mvTRVZ1inSkvsvDO/iP8KXC/SlyusokC0AIzyLbZSEbRdMf7XhXB1WRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7zl/mcz8CUHtvG5SYCbGtGSH0qYsudTYPzvsUmUHls=;
 b=EUrZrflyEWaIgJ/LI2QZGvUICz0tfd4yeeqL4Y8sCJX9ZL7iEznT1sGHnxB8WBfd4gBKyTZ3Gs8zmajjokbfJNXWxkR5k1JU/4i3sm0YewUYNwTq0vFfq07ovuGXgYbxIHz7aKIbpnBTzusyTwyyzdxG0xBR12cgF4K499U5Q6RN8uQcaltGtlHrs8g0GtSD50nQvh8uV1FNS0/DY8NUs7PVSAC9DGLCMu/iVXtP4tVfwAfNCFFw6TPVzHMPuNw1rbhO0pHU4biIxwjs0sKMGxAA8pyNyTOM/tWkYd5PPEcbn4LiRhtdfX3tOqOfPSmpZJ+pUKEx/X4rIE99htpNbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 19:02:27 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 19:02:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>, "Summers,
 Stuart" <stuart.summers@intel.com>, "Randhawa, Jagmeet"
 <jagmeet.randhawa@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [i-g-t] tests/intel/xe_vm: cover single-op binds reserving unused
 pgtable ops
Thread-Topic: [i-g-t] tests/intel/xe_vm: cover single-op binds reserving
 unused pgtable ops
Thread-Index: AQHdRtmZEyQP0eGCN0GOiokf1SYToLb7/FZA
Date: Tue, 13 Oct 2026 19:02:26 +0000
Message-ID: <CH0PR11MB5395CD34DF7F0EE901E23A5FE59E2@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20260917191857.7733-1-jagmeet.randhawa@intel.com>
In-Reply-To: <20260917191857.7733-1-jagmeet.randhawa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|CYYPR11MB8431:EE_
x-ms-office365-filtering-correlation-id: d48013b9-27f4-47b7-789a-08df295c85d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|23010399003|38070700021|56012099006|11063799006|261009220027099003|261009221227099003|261009223327099003|261009221727099003|261009223027099003|22082099003|18002099003|10067099003;
x-microsoft-antispam-message-info: qlzbIVnYPssQW4Hmm3/W6cHk/CUKNMsf1itcnswIWkpH8xpmr07Epx7OkOt1MtsdBUQ+fzLqa299LO+uRxthrErCJUEivjqU+Vv9DVE5/13HV5DsTCUIyqg5UcmP7S19B1ZdC/tnz6kRip6yViT2U5rp4I8UmR9nCfgFfUPDKRdtdIbIuzlZtdip/3ta9N1J0MRw3/SF4NZNSFhOqTDulMgYlHhkf7Wz3oMzQ3nGPIhuQzvi04i0nlFG5N9WtccRHYp6pSWtSEWAU1//+Fo39mKf3So4BeKCJZLe3twrDUCdMKRtFEct25kF8rsewKbOkePyDrrpvVaqAhrQRoky/eO6EL/v5SBDBAvJR46uskvP5XeWIaJhuWy9hV+4Z8xSvMKm4ODeLw+onhs9S3KxhLECejzP+AVeUy79TP9komAs9dBR1DneVreVQ8HgskdVe7aRRlxoZt1CTcKJ1r8fZY1BcVda72ADSuKN3PoHg/c3czaOkuucY0CuV9r3cPJ42HKadMphgVh4u8+Ut4vkjrv0fGwj6Cfy6bXdiipo2mMliXHQNgzKJmafpVt1lSwetxX+DG1yFTvewzq6iRm8iz1V9QEezsfI5T1LgKI9Eyme18JVsDsHxSkvXcA+62bMACRqYZpAV69euwMgm5+PVeWqcywEisaybVbiGore73V3I9JqNxgAMsCy9s6rWZ+Z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(261009220027099003)(261009221227099003)(261009223327099003)(261009221727099003)(261009223027099003)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P3Rhol8TdK96t5kmeK1J+TNP1Y3Vfvg03/c6KtwXbLxJS4w6Sq32hbVG1hbQ?=
 =?us-ascii?Q?xkDoCRT3aALTcXF96PCizZqVbYLlSoqERFdt/SPmWhIIMHtf0H2M1Srpv5OH?=
 =?us-ascii?Q?1GhNP1fuvGOtVcaizKsIzvPkjbDNytqTeWbVb/uGJKY5G9ZvqvgI7de2e8Qq?=
 =?us-ascii?Q?AqSQ1989mCo1QAm3mo3pJiYiafeTIaoJiuWyIGZsVIao2RRNBPFE1x37sHCv?=
 =?us-ascii?Q?cpxE16pOM3AQpqjdFyv6XqIInkUI0CvXcb9tAQqBjfUIUxnlzzY1M4Ef2zur?=
 =?us-ascii?Q?S9KbwVKTowhg77DiIYQVCi1cQD6bKUJ00c+hqjPSFSsbDZkkAQGWgVYjNMIk?=
 =?us-ascii?Q?goiAkBj8U0S00D7xvflDKxoSaQ9ejcpxInL+NhpQrAumcFkONP/eqEZBoS2O?=
 =?us-ascii?Q?2T8Ru7PiN2/Hk9SYRszdwND+XTIlpxw3kcj4CZe//u5l1Mm5/ghL2pC6elGs?=
 =?us-ascii?Q?vBto5FDtPho6WfwaJnYpcIONie9SceW1I0nfXBHYyoEumkHiX4dDFTc08EzC?=
 =?us-ascii?Q?oYO6BCG6PUbHGRdY6IQHmMheXSSmkawViSzuI4nvEBXlgsDt3JhJxFVrBpaI?=
 =?us-ascii?Q?dmHaoZOMTEwWBiajYIhc3p3AFE5kz3oDomUXUdZzKlgBpYHaiLh6ppL9c7PT?=
 =?us-ascii?Q?Lj69gV7dAGnVu5wetZn1SZI9lsJHR97MVxB5LmWTqvXyNJon/pyYlXSUQ9rv?=
 =?us-ascii?Q?U8ULIBf6FCU6XfUDEZLt5LMU6xhpVcCsCQh/7B5wV14rVQZn7Yk7f4OJiGo9?=
 =?us-ascii?Q?DzOFrsPY3tjPfw/ZOHZSGBxgv5KO+p7lduzfCQ3QSMhmXV665G2UlUfyeeu0?=
 =?us-ascii?Q?KBmG4UeYJvyFcfdSi+UxFSpjLJ13OhrOtwTmFcw6Pn/UayJBycoXZVj/ymn7?=
 =?us-ascii?Q?A5Nif3vqhO9hb35q5kBj2KgxF9PqWNuLCmxkwpoNcI9paPWvICGZ4MHmoOT3?=
 =?us-ascii?Q?ZjfOZxaqHc8h76ulmPzRNHy8xZS/yjIS5SwXmtVtxXxcv2JByNmL6B/2++qq?=
 =?us-ascii?Q?VX4XV/82GFa7+dw37ICxG/AcWr2wKj1s2Xe3hNo/khUOzH3EmlAiSCjsoHNy?=
 =?us-ascii?Q?Rwhjp1z3WWB/Mb9WrfqR4fI9lModXWUtCxMzKY1/HqcUo5LO2mTXswz7UwSU?=
 =?us-ascii?Q?UsPL1CaboapbrS6JJzIc+pJ4u65xDeDz7oZOf4LvMkiFNDG/hcP/AjB4YT8J?=
 =?us-ascii?Q?0RlGu3Kh5iL2FfyqQD2yvCMo5doTj4DW4t/PoI79n6AFmv6N74B4x35V92MZ?=
 =?us-ascii?Q?9p0oy9Nk1LQK4HH30a6QS7RJuoigkS66JGmVVOLyAx9rH8qG4hhy43HqfeuC?=
 =?us-ascii?Q?+lxQ0A0zv8MxE9QkyAl3zsqc+SXdoXl0397uaXpJmA2FNIZg9WwZnz9qLrUu?=
 =?us-ascii?Q?bU2vY1vre76yUf8oACN2jXGXT0GO8SNyqOK8/NYm+ZojyrqqbvSR923XD274?=
 =?us-ascii?Q?+oZjI54XmUkScJmHbS8vkPeFiYD4TYwqFr8Vi3Xup4BeoQFxo6aFam1VtMDr?=
 =?us-ascii?Q?08zUeOAKPj3DgHmZ+7LAoplZXTfkd3o24NcREmsXc9KVrfCaq1uckv96xZQt?=
 =?us-ascii?Q?D1cLMG4wt5POp8WwzcL29UluTv4HZTi81XBacxSaFgAXxXyDlqdhA8DIKj9y?=
 =?us-ascii?Q?L4R9BcHaCfop4Zk9jZS5JXhNoywIL6wr+QwCViX7DyKkDX3XxZlnkG4aJxWC?=
 =?us-ascii?Q?mYDQeJEVHBxBbID9Tnd7oZybIO5qinZ83wf3Lro3Zt8gINO0qVbzGKUcKVVe?=
 =?us-ascii?Q?z+vqx8llTVD60v3OzPCdkmEJeb3LtWE9zuj6iWOodVlwFNZP08ndP+kdS0RM?=
x-ms-exchange-antispam-messagedata-1: 7OlhTrWnUrlJtw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FVDu4BqPJ0V6/7k7q9zkY/nUCIWAXDZgMCvoMY5x/JCJPKesixe8irFSZ1BIQLVxkHbsJZN6V3VXe3MD6NSGJsOuOrEqpQyjle3izOz/sKmB2amFcaJNUAQ4824U1f3JH1L3IT+ZyH1an6AMQFY4EeBTGXkuVkviiYZvWao+99umOky/J5HRlPCx8XwXmXICK8S/479DlWlWjGLXSCb8t2LxWVo4AidRhd7jh3nMkLpRZ7H5ikakKNQ+dUkp94tGornXfQjGxpG+IjwFjQZV4pvtv5OAAgpUww6WJpH8CcG5wJAKtaYpjCU9Mmb+5bd4n7o1twzko4Iy+fYcHWe3Kw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48013b9-27f4-47b7-789a-08df295c85d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 19:02:26.9181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGYkdrvaAqVnu/BVNpTaDvu+Rkfp4as4DZZJ0O0pBc41qtNvL5P0fqZOsBlYsrmTbla7HUKZmwo/9UfxeA3bop+jrVcykQHVERtwSaEkMW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jagmeet =
Randhawa
Sent: Thursday, September 17, 2026 12:19 PM
To: igt-dev@lists.freedesktop.org
Cc: peter.senna@linux.intel.com; Summers, Stuart <stuart.summers@intel.com>=
; Randhawa, Jagmeet <jagmeet.randhawa@intel.com>
Subject: [i-g-t] tests/intel/xe_vm: cover single-op binds reserving unused =
pgtable ops
>=20
> xe_vma_ops_alloc() sizes the pt_update_ops->ops array with the number of
> page table update ops reserved while parsing a VM_BIND, and allocates it
> without zeroing it. Only the ops that xe_pt_update_ops_prepare() goes on
> to populate are valid, so a kernel loop bounded by the reserved count
> instead of the populated one walks into never initialised slab memory,
> reads a garbage pointer out of it and dereferences it.
>=20
> Syzkaller hit exactly that: xe_migrate.c iterated num_ops while xe_pt.c
> iterated current_op.
>=20
> Add three subtests which reserve more ops than they populate out of a
> single (num_binds =3D=3D 1) VM_BIND, so that the mismatch is reached with=
out
> an array of binds. They cover the three independent ways
> vm_bind_ioctl_ops_parse() can count an op that op_prepare() then skips:
>=20
> - single-op-unmap-partly-bound: an UNMAP covering a bound and an unbound
>   VMA parses two UNMAP ops, and unbinding the VMA that was never bound
>   is skipped.
> - single-op-remap-unbound: a partial UNMAP of an unbound VMA parses a
>   REMAP, and unbinding the original VMA is skipped while binding the
>   remainder is not.
> - single-op-map-mirror-over-bound: a CPU_ADDR_MIRROR MAP over a bound
>   VMA parses an UNMAP plus a MAP, and binding a CPU address mirror VMA
>   is skipped.
>=20
> An unbound VMA here is one created by a non IMMEDIATE MAP in a fault
> mode VM, which defers the bind to the first GPU page fault. A fault mode
> VM is in long running mode, so the binds signal user fences rather than
> syncobjs. Every iteration first populates and frees an equally sized ops
> array so that the VM_BIND under test is likely to recycle a slab object
> still holding stale pointers rather than freshly zeroed memory, and the
> sequence is repeated so that one quiet iteration does not pass for
> coverage.
>=20
> Validated on a BMG DUT with CONFIG_KASAN=3Dy, CONFIG_UBSAN_BOOL=3Dy and
> CONFIG_SLUB_DEBUG_ON=3Dy, which poisons the freed ops array to 0x6b. On a=
n
> unfixed kernel each subtest faults within 90ms of starting:
>=20
>   UBSAN: invalid-load in drivers/gpu/drm/xe/xe_migrate.c:1836:13
>   load of value 107 is not a valid value for type '_Bool'
>   Oops: general protection fault, probably for non-canonical address
>         0xed6d696d6d6d6d6e
>   RIP: 0010:xe_vm_populate_pgtable+0xd0/0x380 [xe]
>=20
> With the kernel fix applied all three pass, while a debug print of the
> two counters confirms they still reach current_op < num_ops on every
> iteration, so the coverage is not lost once the bug is fixed.
>=20
> Link: https://lore.kernel.org/intel-xe/20260824183816.299110-2-jagmeet.ra=
ndhawa@intel.com/
> Suggested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

There doesn't seem to be anything obviously wrong about this new test, so I=
'm willing
to give it my RB.  But you should definitely get a second opinion from Pete=
r or someone
else on the IGT team before merging this in.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_vm.c | 204 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 204 insertions(+)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 1d109e783..a2181d464 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -307,6 +307,204 @@ static void test_partial_unbinds(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
> =20
> +/**
> + * SUBTEST: single-op-unmap-partly-bound
> + * Functionality: unbind
> + * Description:
> + *	Single VM_BIND UNMAP spanning a bound and an unbound VMA, so that the
> + *	unbound VMA reserves a page table update op which is never populated
> + * Test category: functionality test
> + *
> + * SUBTEST: single-op-remap-unbound
> + * Functionality: unbind
> + * Description:
> + *	Single VM_BIND UNMAP splitting an unbound VMA, so that unbinding the
> + *	original VMA reserves a page table update op which is never populated
> + * Test category: functionality test
> + *
> + * SUBTEST: single-op-map-mirror-over-bound
> + * Functionality: bind
> + * Description:
> + *	Single VM_BIND MAP with CPU_ADDR_MIRROR replacing a bound VMA in a
> + *	scratch page fault mode VM, so that the map reserves a page table
> + *	update op which is never populated
> + * Test category: functionality test
> + */
> +
> +enum single_op_case {
> +	SINGLE_OP_UNMAP_PARTLY_BOUND,
> +	SINGLE_OP_REMAP_UNBOUND,
> +	SINGLE_OP_MAP_MIRROR_OVER_BOUND,
> +};
> +
> +static const struct single_op_section {
> +	const char *name;
> +	enum single_op_case op_case;
> +} single_op_sections[] =3D {
> +	{ "unmap-partly-bound", SINGLE_OP_UNMAP_PARTLY_BOUND },
> +	{ "remap-unbound", SINGLE_OP_REMAP_UNBOUND },
> +	{ "map-mirror-over-bound", SINGLE_OP_MAP_MIRROR_OVER_BOUND },
> +	{ }
> +};
> +
> +#define SINGLE_OP_ITERATIONS	32
> +
> +/*
> + * A VM_BIND reserves one page table update op per GPUVA op it parses, a=
nd the
> + * array holding them is allocated without being zeroed. Ops that end up=
 being
> + * skipped while preparing the update are reserved but never populated, =
so only
> + * the populated prefix of the array is valid. The sequences below reser=
ve more
> + * ops than they populate out of a single (num_binds =3D=3D 1) VM_BIND:
> + *
> + * - UNMAP_PARTLY_BOUND: an UNMAP covering a bound and an unbound VMA pa=
rses
> + *   two UNMAP ops, and unbinding the VMA that was never bound is skippe=
d.
> + * - REMAP_UNBOUND: a partial UNMAP of an unbound VMA parses a REMAP, an=
d
> + *   unbinding the original VMA is skipped while binding the remainder i=
s not.
> + * - MAP_MIRROR_OVER_BOUND: a CPU_ADDR_MIRROR MAP over a bound VMA parse=
s an
> + *   UNMAP plus a MAP, and binding a CPU address mirror VMA is skipped.
> + *
> + * An unbound VMA is one created by a non IMMEDIATE MAP in a fault mode =
VM,
> + * which is deferred to the first GPU page fault instead of being bound =
by the
> + * VM_BIND itself.
> + */
> +static void
> +single_op_prime_pt_update_ops(int fd, uint32_t vm, uint32_t bo, uint64_t=
 addr,
> +			      uint64_t page, struct drm_xe_sync *sync,
> +			      uint64_t *vm_sync)
> +{
> +	/*
> +	 * Fully populate and then free a two op array, so that the VM_BIND
> +	 * under test is likely to recycle a slab object still holding stale
> +	 * pointers rather than freshly zeroed memory.
> +	 */
> +	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, page, NULL, 0,
> +			       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
> +	xe_vm_bind_async_flags(fd, vm, 0, bo, page, addr + page, page, NULL, 0,
> +			       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, 2 * page, sync, 1);
> +	xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	*vm_sync =3D 0;
> +}
> +
> +static uint32_t single_op_vm_create(int fd, enum single_op_case c)
> +{
> +	struct drm_xe_vm_create create =3D {
> +		.flags =3D DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> +	};
> +
> +	if (c =3D=3D SINGLE_OP_MAP_MIRROR_OVER_BOUND)
> +		create.flags |=3D DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> +
> +	/*
> +	 * A scratch page fault mode VM is only accepted on platforms needing
> +	 * scratch, and CPU address mirroring additionally needs GPUSVM.
> +	 */
> +	igt_require_f(!igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create),
> +		      "VM create with flags 0x%x not supported\n", create.flags);
> +
> +	return create.vm_id;
> +}
> +
> +static void test_single_op_pt_update_ops(int fd, enum single_op_case c)
> +{
> +	uint64_t page =3D xe_get_default_alignment(fd);
> +	uint64_t prime_addr =3D 0x100000000ull;
> +	uint64_t addr =3D 0x200000000ull;
> +	/* A fault mode VM is in long running mode, which only takes ufences. *=
/
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value =3D USER_FENCE_VALUE,
> +	};
> +	uint32_t vm =3D single_op_vm_create(fd, c);
> +	uint64_t vm_sync =3D 0;
> +	uint32_t bo;
> +	int i;
> +
> +	/*
> +	 * The remainder of a split must not be aligned to the maximum PTE size=
,
> +	 * otherwise binding it is skipped as well and no op is populated at al=
l.
> +	 */
> +	igt_assert(!IS_ALIGNED(addr + page, SZ_1G));
> +
> +	bo =3D xe_bo_create(fd, vm, 2 * page, vram_if_possible(fd, 0), 0);
> +	sync.addr =3D to_user_pointer(&vm_sync);
> +
> +	if (c =3D=3D SINGLE_OP_MAP_MIRROR_OVER_BOUND) {
> +		int ret =3D __xe_vm_bind(fd, vm, 0, 0, 0, addr, page,
> +				       DRM_XE_VM_BIND_OP_MAP,
> +				       DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +				       NULL, 0, 0, DEFAULT_PAT_INDEX, 0);
> +
> +		igt_require_f(!ret, "CPU address mirroring not supported: %d\n",
> +			      ret);
> +		xe_vm_unbind_async(fd, vm, 0, 0, addr, page, &sync, 1);
> +		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +		vm_sync =3D 0;
> +	}
> +
> +	for (i =3D 0; i < SINGLE_OP_ITERATIONS; ++i) {
> +		uint64_t left_addr =3D 0, left_size =3D 0;
> +
> +		single_op_prime_pt_update_ops(fd, vm, bo, prime_addr, page,
> +					      &sync, &vm_sync);
> +
> +		/* Printed before the bind, which may take the DUT down with it. */
> +		igt_info("iteration %d: issuing single op bind sequence\n", i);
> +
> +		switch (c) {
> +		case SINGLE_OP_UNMAP_PARTLY_BOUND:
> +			xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, page,
> +					       NULL, 0,
> +					       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
> +			xe_vm_bind_async(fd, vm, 0, bo, page, addr + page, page,
> +					 NULL, 0);
> +			xe_vm_unbind_async(fd, vm, 0, 0, addr, 2 * page,
> +					   &sync, 1);
> +			break;
> +		case SINGLE_OP_REMAP_UNBOUND:
> +			xe_vm_bind_async(fd, vm, 0, bo, 0, addr, 2 * page,
> +					 NULL, 0);
> +			xe_vm_unbind_async(fd, vm, 0, 0, addr, page, &sync, 1);
> +			left_addr =3D addr + page;
> +			left_size =3D page;
> +			break;
> +		case SINGLE_OP_MAP_MIRROR_OVER_BOUND:
> +			xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, page,
> +					       NULL, 0,
> +					       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
> +			__xe_vm_bind_assert(fd, vm, 0, 0, 0, addr, page,
> +					    DRM_XE_VM_BIND_OP_MAP,
> +					    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +					    &sync, 1, 0, 0);
> +			left_addr =3D addr;
> +			left_size =3D page;
> +			break;
> +		}
> +
> +		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> +			       NSEC_PER_SEC);
> +		vm_sync =3D 0;
> +
> +		if (left_size) {
> +			xe_vm_unbind_async(fd, vm, 0, 0, left_addr, left_size,
> +					   &sync, 1);
> +			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> +				       NSEC_PER_SEC);
> +			vm_sync =3D 0;
> +		}
> +	}
> +
> +	/* The VM must still be usable, a kill would fail the bind below. */
> +	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, page, &sync, 1,
> +			       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: unbind-all-%d-vmas
>   * Functionality: unbind
> @@ -3226,6 +3424,12 @@ int igt_main()
>  	igt_subtest("partial-unbinds")
>  		test_partial_unbinds(fd);
> =20
> +	for (const struct single_op_section *s =3D single_op_sections;
> +	     s->name; s++) {
> +		igt_subtest_f("single-op-%s", s->name)
> +			test_single_op_pt_update_ops(fd, s->op_case);
> +	}
> +
>  	igt_subtest("unbind-all-2-vmas")
>  		unbind_all(fd, 2);
> =20
> --=20
> 2.43.0
>=20
>=20

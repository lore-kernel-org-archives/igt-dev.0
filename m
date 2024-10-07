Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8922CFB450
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 18:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE4C10E3F8;
	Mon,  7 Oct 2024 18:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3XgnaZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B32C10E3F8
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 18:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728324838; x=1759860838;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JY2Q6RnLYbothhTb7lPeqXe3DsUu5H0ASKFtASfT+ZQ=;
 b=c3XgnaZRLJMNKBUT8kRsqRaTy3vckBKI1rbx2UVfGaCbEQV/CXTgBsWn
 Cro7RXYjmNynty6mLQ9gxmRv/tLl/ORjE12c0Wf3547D4OqaKKEkJ2v7H
 g7ZfdESOWWFFIe3JTqpqjiSTWZ4InfunSd8+bn9uhfuD2foGZGGg47YD6
 UbAxvN3Kh5Ky0A88uaSQClugM5ITW173tbjlg5iMoTJESCQ7wDL/XmwzP
 nvL0yaPk72d4wJ/RGo2zwIIrPGHKiHq2Hzmjes54pbOytiWHPokvpDHZa
 PxPlJ3XMNPJomeUGKIip1Iy5J7PpUxnBUEgl4lWNJcfkWl+r3OhstoEi6 g==;
X-CSE-ConnectionGUID: KErOsEMFSu2ZcW68lm80Yg==
X-CSE-MsgGUID: IVzoDj3pSBinQyKqfDMfaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="26948455"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="26948455"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 11:13:58 -0700
X-CSE-ConnectionGUID: 1/tHMiIPR32FSntbB8H9xQ==
X-CSE-MsgGUID: KcIi1IdDTnmSj9YYkykU1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="75394413"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 11:13:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 11:13:57 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 11:13:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 11:13:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 11:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWdeZiijZw0v2l6FdiFxPyTsv3RA/tJAQ/4DFSsdh8kfAfi3iuiATyzimahBKPzxH3cf8hrcHGY1MvIsh0I7y7i03tAtUD+VcsvAVPItbDrAF8H7j1tjjxjhvbXfYQyFbr3GXPQ1Xd3gw0SniBWaaF9a/zwA+wGrVW6PqI3SbeKKPOrlE2C7NaBB032naaexr+BpTx3V7mQPyabICOkjeRCgQj3f8RyaHiRThgRLaTVncnXg2AYIqhDWOkEhwK3aOjK14EWtyyq1NdqlMqiJvQYdr87365zfN0aCllLv72RBPX+opV2OdglOIrFwNi5vpl94/RI+drQ9jyRIzkRxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6F7pFJTdPLP5vma5V5DVsC55JhTYHZDvKz/RDQLNX0=;
 b=xLKz1fD3bAB9k4Z1iaUgVfvoX6+knK6halxwA0ZR2JOYl4OVsOXFLkIH1HbNLrjhBgZ+UBOdzZAs88B+DDWk8QbgQHX9c8dTvrN/WZsabs0J+1BNdWANSxgKx2JJBpASjuADGQ38o8XSCs95YTmsNvZhZ8ygwiJ/tgNKWBxA2PFP32fGgPCf0jU1cSIB7UMbOvOwcczFPqae5MgWE/ZV1ymrCC0t3Mf2bZFja8ky9Z21qDRhZdbx/sQt26fxUma22fAiniBX3W3lliAOBtEolOZbj1BkLqS/MruWtFAlIPX+uSGNS2gkxOyVO/JozX4baqRazz8vV1ypSoqpkyjEAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 18:13:53 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 18:13:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/xe_wedged: Avoid racy cleanup
Thread-Topic: [PATCH i-g-t v2] tests/intel/xe_wedged: Avoid racy cleanup
Thread-Index: AQHbGOEUb/wVim5mukKAKYSzjphL+bJ7kXBg
Date: Mon, 7 Oct 2024 18:13:53 +0000
Message-ID: <BL1PR11MB5445E350D373A194F2E7E9CBE57D2@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241007174747.2031623-1-matthew.d.roper@intel.com>
In-Reply-To: <20241007174747.2031623-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|CY8PR11MB6818:EE_
x-ms-office365-filtering-correlation-id: 41f3d96c-ca77-4b49-9ccf-08dce6fbcd11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?INlvAKjVCygWxvULCAzYR7WbbbGwBxqfyIIKs9ShUngSFkkk6Fhn2RHB3VxA?=
 =?us-ascii?Q?pUxEJHGEg9ceE8Gdx1zp4codlEvgw3rA0nQ1w5ytBpbNOWWkjVTbICJQd4eR?=
 =?us-ascii?Q?Ct9Qx1FXzBAx9oiXAVXR0VvZSLQMhFkA9dM2RRu4Tbq19xn50TE7uVzWxqri?=
 =?us-ascii?Q?DG/IU5DCv7qiAu45A/wVudHKru9WXypHI0aQJalv1vwIew6X2erCHqSHAVfk?=
 =?us-ascii?Q?dBnXsYAB55fH9utdBrqjfLOxaVXxTHYvWhW24vIT3wU5sg+5OzCuD1OWSGOw?=
 =?us-ascii?Q?bIsyGunXE3oG+WtRW+CVgFC5g3vO1HuCDFU8wbqEROi/xu8XhSr5q47TsDS1?=
 =?us-ascii?Q?Y0uAyNKokqF5mg4L5m3tTuUSASEtrg7xbMXp2+MBjKAOVrluD/gykoaIrwvI?=
 =?us-ascii?Q?7IvVC4NKPc+zY8DT/tH50pZosvf3srtgQ/QDnJblZWUyhU7ZqUE//2injP2B?=
 =?us-ascii?Q?LqJzdCT9trN2cLfsCUo5wWidudLJTH1IQz8rsqVZwM8sToL7KbJgQSgKoINR?=
 =?us-ascii?Q?NYTrTCPjMLJ435ktPegx7dANyK5PWi0PbN45wxHBu43lMFALI9Jf9oj6rrPG?=
 =?us-ascii?Q?u+/3NdT4/UawiT4/5ahqHHrU7mbVRn/2PO00doZS1sAaPKhbywPMs19qlJLE?=
 =?us-ascii?Q?1puwspTV0fMOadBz/yQVEY7O2vrOOp4avcMpMJCKtOa4cWpziCZDS5FEfGyA?=
 =?us-ascii?Q?MQgPTUduVGN/BxLOwp2rVzyTb9pQBwpAVxo4nlDCVa388tTINp8y2KTC+V9h?=
 =?us-ascii?Q?gf/wLvBxGHQDdF6lTkXV3K3Jqtcex3xYjyPzUBPk7t8/mOHsDnS2vzFIsKCH?=
 =?us-ascii?Q?2xj42+3JgXS4KaanyVW2JtGW2PUVt8tgy4ffu53aPumluSuawkIG43wasUd/?=
 =?us-ascii?Q?NncslL5jJLxTSCkx3S4I0Fz6hFrUEfOfeZRcS1W7unH87/X/nsDHPiLxlDU0?=
 =?us-ascii?Q?bX14YBAtO591Rj7pDAy4qXifsScSrg4VJsZk/+gnWGhLHqO3o1zn7kXV7BaB?=
 =?us-ascii?Q?N+E2ygG0zMuPnzLNuKSfWO+PyN3rFNT0RvPjRJff3LdcdjdHax7VOZ+b05vj?=
 =?us-ascii?Q?FPlqtm5hf/2QPILOmtKQLIl+QVNcQYXxJz5ZQlpyzBCNbkE1Lp6W4kSumdom?=
 =?us-ascii?Q?Y3snIiYgE0+u0KIe2cCWEfRFq15BSc61hYJHdA5YzFZYA40X/vPAOYr62vUY?=
 =?us-ascii?Q?QE6KFnyxstM/AOp66EXjNTQyXqKnFktqofHrEZRfUmtgiBObo9CznSPFMiEc?=
 =?us-ascii?Q?Z7p4+l8HwU8DpRDcx7OSW85XloTqNtV+h2piRKS/8wt0sAMC/Pb4iazLjIV0?=
 =?us-ascii?Q?Ts4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QoH5Ie/l1F1N3MV4+UmhAej3bmzKr8S88/9DxB633OP2YTOnIhVNkWgaE8Bi?=
 =?us-ascii?Q?fMQe6HlOCPOPOUDr8Kxm2Ut2cfZINlgTuYBdtlH5zrNBFnNPwT9oTBe5ks9j?=
 =?us-ascii?Q?oPl4/qomiLH7ibxPWzjGR+64dvngfPbSktWr9xQEkv2rilydecOfvYjpIyd7?=
 =?us-ascii?Q?PPGDwgDsT0dx8q7tDsRtudJcwObNBf0wdoVyjOlVSAQNy5cWHmbGGFJnwwk0?=
 =?us-ascii?Q?ycuVTDPjVCpjiDXrANY/q2bPazX18XNrx/zTH7nc02G0xN/7sc7j/t//Ks2h?=
 =?us-ascii?Q?6S8DPQBLYjNThjIYbI+/QAACSf502j17nCkaiciptjOmPyFITw/vf9Hgr12X?=
 =?us-ascii?Q?KnvgPuOX6t7PERtECdESIui/WMgPJYhOnZHPBAuEOzgi+yoL6MtiWpPF1gK0?=
 =?us-ascii?Q?FP8tu37Lu3EpXBK15ZrkzFkb3bBw/D66ZCjF9WkY3L/CiTkFb5YKKTlwTRcx?=
 =?us-ascii?Q?tKcseqISZbwiIv4q1MVWPEFfFDzu9/8NGw8IAKXIvwFKEnnd8aDwRDDF/IRO?=
 =?us-ascii?Q?s/D0k/6YyvP+RAPSyIJhVFT44e1CXmU4PZzaZrNZmQHIdcJrW21xFiGjLud3?=
 =?us-ascii?Q?PqqhJrPdAICRAj7yca80+iMQbpxBmxtm2DH7EdW0f6IAt8ASyfjMRqkt3eMu?=
 =?us-ascii?Q?XOEc/GLU+jLQip1soyKWUWP/rbjeNEwyX8F7EFA2QhnAoOyHqUIPpt0WYs5b?=
 =?us-ascii?Q?cgn9gCS28ypuZyGpjZz2leiTpbyHVrnJUsB1r+Qi8w4yMVs63L3lMHP/u/0M?=
 =?us-ascii?Q?n/FF9glbSkMYciQSusHz+lWfwNSWeruUpPvUfVxf5PqraUZOgeLKTU3Ta80b?=
 =?us-ascii?Q?RSGNbJss2xRmlB3Bh7XAA7/NtR/M+tBE+x+KZ5wHfYWS4mVHBH0bJC6mrGx6?=
 =?us-ascii?Q?lwRIRLVA6QnilsUfv3EMIQwZcGHvtzzh+FLTIgx/sT4o1gJLx34iN2lsg0hp?=
 =?us-ascii?Q?z4hlbOE9bOA8CeuqbDPPRH1K8lKS0IZFmAHD4mU18TKxnYKuBsWw/aWAseT+?=
 =?us-ascii?Q?iVDLArueR5uMdvxltPeHlK0VeS4pPXmdn5zQXpx3kLajyumFj1nusYzCUJJ/?=
 =?us-ascii?Q?LBOFNlRitJDQXeyp/J7gqtKCzL+vvAVuFVxheS3NJRkxyJigirf4jBtC6IqS?=
 =?us-ascii?Q?MWgFOf0Fa58FkGN2ohNFKHlPL3oyU2xvTgrWT+koxld7IHntCzvg44EArHs5?=
 =?us-ascii?Q?ayiAqcNCqfVojNz5HoBAJLAEVDS9EXitecWFQyaw1fNuHwPXPmCi7mIuiDkU?=
 =?us-ascii?Q?2V/NZYm0QTjUXQPljjGz6ltK2nmcx6MjEeYFyDZOYzephIEHKLIWYiHG72EW?=
 =?us-ascii?Q?/nT0OFmO8vtDY05eJweqwAHelaEaw7TteZWo1+AGzzN6bToKUD8uGtPnogMd?=
 =?us-ascii?Q?c6B4YV7yENH+1NFL0lFJ3mu+SRbYfp0vnpJWXcIPUe6FlI6KUPHY1R5C7W8N?=
 =?us-ascii?Q?SvUZDzr2a3Kw5IdhptkLkgl6IWhgdTbYlpnPLym1J/4Laq946I+1KXUSJbBH?=
 =?us-ascii?Q?ccVVawTNFp1OaqN4fTUdAzXvsrk0c0lyiQjQ2jQ2Z2EGSpuci8mViVpwf8DZ?=
 =?us-ascii?Q?3weAIzS4AP5n3+TlI2HryqKsHVuJLIp2uY3iu/6Z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f3d96c-ca77-4b49-9ccf-08dce6fbcd11
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 18:13:53.1378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: na0pEnH+dNXDYABpPljSJ25rxRllXDlDq3f/889ImtHIOqr3Wa12xrqjQUOgedAUFWWxVJ5Nr3CYcHojOtYPvM6aThQl5jEikVr/MW+4H5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6818
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matt Rop=
er
Sent: Monday, October 7, 2024 10:48 AM
To: igt-dev@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Vivi, Rodrigo <rodrigo.vi=
vi@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_wedged: Avoid racy cleanup
>=20
> The wedged-at-any-timeout subtest uses wedged_mode=3D2 and triggers an
> engine hang via IGT spinner, which means the hardware can become wedged
> at any time after the spinner batch is submitted to the kernel.  Any
> further ioctl submissions from the test are effectively racing with the
> GPU and might succeed if they run before the GPU/driver notices the
> hang, or might fail with -ECANCELED if the hang has already been
> detected.  This is also true for the cleanup at the end of the
> simple_hang() function (i.e., execqueue destruction, gem close, etc.).
> The IGT wrappers for those cleanup ioctls will terminate the test if
> they fail, causing a bogus test failure.
>=20
> As soon as the spinner batch is submitted to the kernel, we can't
> guarantee that we have time to sneak in any more ioctls, so just drop
> the cleanup actions; they aren't really needed.  In a similar vein, we
> technically shouldn't assume that a 1 second wait will guarantee that
> we've reached wedged status (it almost certainly will, but arbitrary
> delays of "this is probably long enough" are never good).  Instead, do a
> syncobj_wait on the spinner; that might complete normally or might
> return ECANCELED, either of which is a signal that we can move on with
> the rest of the test.
>=20
> v2:
>  - Rebase to reconcile conflict with rebind refactor.
>=20
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2780
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2747
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  tests/intel/xe_wedged.c | 44 +++++++++++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 13 deletions(-)
>=20
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index ba790aa8d..88e5d47f2 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -142,7 +142,7 @@ simple_exec(int fd, struct drm_xe_engine_class_instan=
ce *eci)
>  }
> =20
>  static void
> -simple_hang(int fd)
> +simple_hang(int fd, struct drm_xe_sync *sync)
>  {
>  	struct drm_xe_engine_class_instance *eci =3D &xe_engine(fd, 0)->instanc=
e;
>  	uint32_t vm;
> @@ -163,6 +163,11 @@ simple_hang(int fd)
>  	struct xe_spin_opts spin_opts =3D { .preempt =3D false };
>  	int err;
> =20
> +	if (sync) {
> +		exec_hang.syncs =3D to_user_pointer(sync);
> +		exec_hang.num_syncs =3D 1;
> +	}
> +
>  	vm =3D xe_vm_create(fd, 0, 0);
>  	bo_size =3D xe_bb_size(fd, sizeof(*data));
>  	bo =3D xe_bo_create(fd, vm, bo_size,
> @@ -180,11 +185,6 @@ simple_hang(int fd)
>  	do {
>  		err =3D  igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec_hang);
>  	} while (err && errno =3D=3D ENOMEM);
> -
> -	xe_exec_queue_destroy(fd, hang_exec_queue);
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -	xe_vm_destroy(fd, vm);
>  }
> =20
>  /**
> @@ -226,19 +226,37 @@ igt_main
>  	}
> =20
>  	igt_subtest_f("wedged-at-any-timeout") {
> +		struct drm_xe_sync hang_sync =3D {
> +			.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> +			.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		};
> +		int err;
> +
>  		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
>  		ignore_wedged_in_dmesg();
> =20
> +		hang_sync.handle =3D syncobj_create(fd, 0);
> +
>  		igt_debugfs_write(fd, "wedged_mode", "2");
> -		simple_hang(fd);
> +		simple_hang(fd, &hang_sync);
> +
>  		/*
> -		 * Any ioctl after the first timeout on wedged_mode=3D2 is blocked
> -		 * so we cannot relly on sync objects. Let's wait a bit for
> -		 * things to settle before we confirm device as wedged and
> -		 * rebind.
> +		 * Wait for the hang to be detected.  If the hang has already
> +		 * taken place, this will return ECANCELED and we can just move
> +		 * on immediately.
>  		 */
> -		sleep(1);
> +		err =3D syncobj_wait_err(fd, &hang_sync.handle, 1, INT64_MAX, 0);
> +		if (err)
> +			igt_assert_eq(err, -ECANCELED);
> +
> +		/* Other ioctls should also be returning ECANCELED now */
>  		igt_assert_neq(simple_ioctl(fd), 0);
> +		igt_assert_eq(errno, ECANCELED);
> +
> +		/*
> +		 * Rebind the device and ensure proper operation is restored
> +		 * for all engines.
> +		 */
>  		fd =3D xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  		xe_for_each_engine(fd, hwe)
> @@ -252,7 +270,7 @@ igt_main
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  		igt_debugfs_write(fd, "wedged_mode", "1");
>  		ignore_wedged_in_dmesg();
> -		simple_hang(fd);
> +		simple_hang(fd, NULL);

I'm guessing we don't need a sync here because we're expecting the hang to
not have an effect on the next ioctl in wedged_mode 1.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  		igt_assert_eq(simple_ioctl(fd), 0);
>  	}
> =20
> --=20
> 2.46.2
>=20
>=20

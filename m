Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD0EC48BC4
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 07:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2174910EB14;
	Fri, 23 Feb 2024 07:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DndOFvHg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0BB10EB14
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708674939; x=1740210939;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cER2BT8bgEMl2zkLXUPfKCG47AQeAytk8g9mSFEpbBA=;
 b=DndOFvHglFp2sAcdlGuEHSJKBzRdt3bTBfkx1MTOz2GyK1i6SWKJ+Ab0
 s1kejU4pax+TUc0/8WdpvEJCnMqHGzLJvlUUEon+356TQRg/N8pGqnBO+
 ++HhPX0wn0jkOiXBjy2aI/p+NAal626dkVKckUI4jQOyWPfp6DgaLq2Qt
 lo9urJerdo4apboLQuoppfPTwumEqdXfEjmMPteTCwcy91vkMiOl96Hb7
 +exVZs361z1enUVaz000oXurf0Rqrs+c1Om9Wcg5ojyT2KbhUjln/ucsn
 ujOVQROJPPV+767PJ8gCJGeX6ial4btCj0pflwAe+EOM2MA3A0LbP0jgC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13540021"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="13540021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 23:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10525679"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 23:55:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 23:55:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 23:55:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 23:55:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 23:55:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evDeibxXtyVageC5De7XYvl7fY1xuTOS1DXqjrQrrOMD9pP53Vgi+d3DCLAFjRWyqKWSXitcvrASazABuBeJo72LObnLLypq8r37Ny/sXfPwjqYGjM6OXrT3+JczeEniSzzalaN5mfQDw4JQJlCYwTJ2+zanMB207FQXA2/BmQvjwu+FzoSFAnN+93LfZo+zewr0leZuXngSEykW4NhF+3GLRDxT9j9kC7yble4Nr/2BEcAMt7iz3VKkCNDs37lI3HsK/4UpeiZnnciPN/LxtWvLvu7l9K5CaLJ2D2yJkZNg8vZaFZgHwSejYWp5/cnmoojI4S1qM6DlbpxhbPpe4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUOG21V9EWOFwn1BcQILV/fPdOgVqpTegKUFvqSzXYs=;
 b=dZm6eYAEw54uxonpC2+9HmP6IMopX1vwkNTD7Hde2bO41KkJmkhcpX/zX+jEQZKOY2C84F6iYXFywEhvhB7PQxD7BN+qFHiHdnkadDCCv2XhGYxVOJ3VIJm4P5UqfVwG3otH9FM3QHS30Jm00kyQD9TwISaFvbJdloVDb1tQQGb1uudcCxHFW5ZRzS5XhQirloz7ndv4yC568lbDumTIUzT9yy8cWP97Ya21pV630Q5CwXa/2iwS9hSm0zNayQdavIuTb3iDSEnQM11xcs7VTQ/smmbhvwfwwGi0WvNe31Zu891oRC8xL9Vnp0PthLtHaFJC4ioTZRWWsBpzopEQ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH8PR11MB7117.namprd11.prod.outlook.com (2603:10b6:510:217::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 07:55:34 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67%5]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 07:55:33 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume.
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume.
Thread-Index: AQHaZiTZH1NnzVeDHUWnTr9NBXXtbLEXjbGg
Date: Fri, 23 Feb 2024 07:55:33 +0000
Message-ID: <CH3PR11MB84347F7CED524B4D9C7219ED8D552@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240223065136.19900-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240223065136.19900-1-sai.gowtham.ch@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH8PR11MB7117:EE_
x-ms-office365-filtering-correlation-id: 6f427879-2fb8-4ffc-409e-08dc3444d069
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KTWUF/riYCsUV1+pNdn7u1B1gvmwz8iUu8omBqW2kkOTPvaPBttyx9cBfJWeLrNA8g5p7DC6RmClc+mFTHumqmb8IOcbG3RUkJsfK2qXAgLM6KwJNAj0lcOdMnwYZCX7/HbBmwpTKw0sHMqiOXriOqUuaLJnojnow8pcIZwDISDeq9in7N/p56OvyfpZ5PtQQSFIU5IZcK3JJMpvnT+AIUXuc8tjWAx6b8wrKc2i7RtZAn0KCa2Ttc1I8PGOi07pmjliifI0wk5FDLdFYu4ibY9Hlk5Mjx0bZyiscjwtqaEz50+k+e3zHTbIWUl5CemzJ1AyPTHMn4i1J9b6Py+OQ1lg6Xl1UmC1ftWasTMyBPEzGX5ql/5WZXCK+Sq780xLfnvOzk2rgmyMM4AaAJh2ny9il6II9cLpxUF2cNG+Mn4sbNmSiObQO9Q0NObzgejjuqVtyXMikrTH5KIxDo4kpOOgEb7+PpxON++A5dOJTgTUCbTl94+egr1x14jidYLygPi5wj7iPHIc4HEojlRh7IYGi96gL4IfN/CuoLuuaZ+MENuxzPgvZn9gHp0iA7KYtTAZxFLkkacV4lLLCIgd7dpVzKjk6+pV0m3hnCYzvTG2fkTVSiFZY6dPZeKLCMPg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2XhDL9004OD8SwxUpCT0LdeIDcEXEYcQfy4wANwvaBW/3a/pRB/TCv2C4mWr?=
 =?us-ascii?Q?YAxihpJ0MiCT39U3NZh/mmRDVG64dtThVU3f2rTZTQ14h7v6BQi6Qv7lUjrf?=
 =?us-ascii?Q?Vn1Hfls5R6zpOoDO4darx/a/nnIVIuwxomyZcFQiM6ytJ1Swpp3M2QpQObIu?=
 =?us-ascii?Q?WnFIIad92KWL2Gmv/2nXKGvmqrzsUyWA85gV0xO6NKQ7aFjqaZQ/ThhxAnOq?=
 =?us-ascii?Q?dG8QZDDKskbyjz6lz8CpiG/Rec99RYbRrCSwuhacx95ojhV2SEK/MWf4vx8p?=
 =?us-ascii?Q?jEwDcDi0Atclhbz3dL8zvrT4Tqim4QeioijQuxrnup3GVUf6z14SVHPH/2+D?=
 =?us-ascii?Q?r4EwXdHyGzVNv8VyyFLkLhHhjYhPtXUkgsKA/x4I4zLbSu2xw3BhovUHAcjD?=
 =?us-ascii?Q?FgctzjFr+hLF/V84kTuyOgaB2zqfd1mRsHoi9b0q6vTnx8w0E5jSHaM91Bul?=
 =?us-ascii?Q?uNAyvQtS676a79ooualbGd1uNBVy8OVkNPxl7JpRRcbo/d7fgIq1yNf7J53D?=
 =?us-ascii?Q?XaDQtgZxfuo2k1M5ptRN8NsmiaBGrY+Z0HrDp9/R3IzQYmlFtmG7RbAWteUw?=
 =?us-ascii?Q?J6JpUag3PsJnatESiZhgNk3m/aNCT9KeGHr3Zx6yg57Fvqjl8xL5KDwiKdbF?=
 =?us-ascii?Q?kRg/48qtM84dHueovEbSwiokl2uRD3xHle7CPXD9Tuh87LsHrZb5elhnPA8z?=
 =?us-ascii?Q?PPuVbu79QNZYXMPdYfLC3ZwWJ1WLkbR9jB5lpLIFFtiFzibNV7EDsabd52ct?=
 =?us-ascii?Q?zoFtHQlz/dSu+epqBspAHTLheQq5dce1dntuh5eC/LCYjVSvueAj/ViT0hdk?=
 =?us-ascii?Q?6CFyvq9MQg1O1+82Z2cy24bMCTQl99yVWoyFXqRuKoMC2tiuHoEn1LSKncb3?=
 =?us-ascii?Q?eIC6yVmJCcpIt11oinJmXBDRKQGVew6wXV18fIr9vmzbmqrBnfn5RMRq1GM3?=
 =?us-ascii?Q?vcYpyfyhJdtG5mcd85wBSZDdwB/01Ssb09IviYYqLohJEir+CHZyXlx4hl/+?=
 =?us-ascii?Q?9SoWnOWrHOhfWvBovBlWzpjcAo93BmCyJevHKWfPhNqSNLDap934Akqz2eyx?=
 =?us-ascii?Q?cQDg11oLkS8hcaG2uUPcMulsBinLQWw9b42VjRmJq9wwRY7DLCad5tYQPeku?=
 =?us-ascii?Q?LfsBwT9uhiEY0/S74qeJjgdllnVudl/ay9k1lyBeK82wjrD6zc0xhIjgrmKv?=
 =?us-ascii?Q?pMalPH6O/MMC3jrzU92KMElEkkXdyqa7x0XEuCiCAEn7thDHyrj/3qyrgIOv?=
 =?us-ascii?Q?3l7OZifxXsqPR5Gf/pkrGKpKwHUqkU9xtCdmGSYzB3TU5Km7Uu6JG7zd9Zt4?=
 =?us-ascii?Q?wVavkBrKVtQVP9Qqg4x5Eo6UArLCaXjHo0C4+I7qqmq64KzWeBcz9aUqOYde?=
 =?us-ascii?Q?Wrv/2UXIqzjz+NwU+yrZq4lEwnitcAXPSAvhjpj7hQsZPxZtuch/LdmGWtFJ?=
 =?us-ascii?Q?0L7M3c+Gnm4PVX5ZhkCxYGakdrwI0nF4kP2agxdM+L//Otyb4Ji7jSwEa6jb?=
 =?us-ascii?Q?85bWRrSJ3FCOfdEYDj7hMVXY8+grmcHYTICUju9IKmJXJhszYqTvhdaB3fmQ?=
 =?us-ascii?Q?XZvkeyNkhI7wYyiN2S0/GiCw//qfxAam81905S/KATAFHPIXo6/i5isZ3o+Q?=
 =?us-ascii?Q?BQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f427879-2fb8-4ffc-409e-08dc3444d069
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 07:55:33.8443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZUXq3lAaBBPNx1WsnK407Is+odh0RSqGQHGnAAGst1xuMVt5AgYidc9Ej1OePsg6iXR8CjdYRqJgvDND2K7cRsdy5kRQi+BI72SCNRYsmEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7117
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> sai.gowtham.ch@intel.com
> Sent: Friday, February 23, 2024 12:22 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind functi=
onality
> with suspend and resume.
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Test validates vm bind functionality, by suspend and resuming the device
> before and after binding VM to a VA.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_pm.c | 92
> +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>=20
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> a0045da0b..f9d2ce421 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -550,9 +550,96 @@ static void test_mmap(device_t device, uint32_t
> placement, uint32_t flags)
>  	close(fw_handle);
>  }
>=20
> +/**
> + * SUBTEST: vm-bind
> + * Description: Validate vm bind functionality with suspend and resume
> + * Functionality: pm
> + * Run type: FULL
> + */
> +static void vm_bind(device_t device, struct
> +drm_xe_engine_class_instance *eci) {
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +	struct data {
> +		uint32_t batch[16];
> +		uint32_t data;
> +		uint64_t addr;
> +	} *data;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	uint32_t bind_engine;
> +	uint32_t syncobj;
> +	size_t bo_size;
> +	int value =3D 0x123456;
> +	uint64_t addr =3D 0x100000;
> +	uint32_t bo =3D 0;
> +	int b =3D 0;
> +	uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr =3D addr + batch_offset;
> +	uint64_t sdi_offset =3D (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr =3D addr + sdi_offset;
> +
> +	syncobj =3D syncobj_create(device.fd_xe, 0);
> +	sync.handle =3D syncobj;
> +
> +	vm =3D xe_vm_create(device.fd_xe, 0, 0);
> +	bo_size =3D sizeof(*data);
> +	bo_size =3D xe_bb_size(device.fd_xe, bo_size);
> +
> +	bo =3D xe_bo_create(device.fd_xe, vm, bo_size,
> +			  vram_if_possible(device.fd_xe, eci->gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	exec_queue =3D xe_exec_queue_create(device.fd_xe, vm, eci, 0);
> +	bind_engine =3D xe_bind_exec_queue_create(device.fd_xe, vm, 0);
> +	xe_vm_bind_async(device.fd_xe, vm, bind_engine, bo, 0, addr,
> bo_size, &sync, 1);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> +	data =3D xe_bo_map(device.fd_xe, bo, bo_size);
> +
> +	b =3D 0;
> +	data->batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[b++] =3D sdi_addr;
> +	data->batch[b++] =3D sdi_addr >> 32;
> +	data->batch[b++] =3D value;
> +	data->batch[b++] =3D MI_BATCH_BUFFER_END;
> +	igt_assert(b <=3D ARRAY_SIZE(data->batch));
> +
> +	exec.exec_queue_id =3D exec_queue;
> +	exec.address =3D batch_addr;
> +	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_exec(device.fd_xe, &exec);
> +
> +	igt_assert(syncobj_wait(device.fd_xe, &syncobj, 1, INT64_MAX, 0,
> NULL));
> +	igt_assert_eq(data->data, value);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> +
> +	exec.exec_queue_id =3D exec_queue;
> +	exec.address =3D batch_addr;
> +	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
Are the assignments gone after suspending?
If not, reassignment would be a duplication. Can you please check it.
In the commit you mentioned "by suspend and resuming the device
> before and after binding VM to a VA".
Are you doing that over here, are you binding before suspending and resume =
and then rebinding it again? Can you look into it.
-- Priyanka

> +	xe_exec(device.fd_xe, &exec);
> +
> +	igt_assert(syncobj_wait(device.fd_xe, &syncobj, 1, INT64_MAX, 0,
> NULL));
> +	igt_assert_eq(data->data, value);
> +
> +	syncobj_destroy(device.fd_xe, syncobj);
> +	munmap(data, bo_size);
> +	gem_close(device.fd_xe, bo);
> +
> +	xe_exec_queue_destroy(device.fd_xe, exec_queue);
> +	xe_vm_destroy(device.fd_xe, vm);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine *engine;
>  	device_t device;
>  	uint32_t d3cold_allowed;
>  	int sysfs_fd;
> @@ -693,6 +780,11 @@ igt_main
>  		}
>  	}
>=20
> +	igt_subtest("vm-bind") {
> +		engine =3D xe_engine(device.fd_xe, 1);
> +		vm_bind(device, &engine->instance);
> +	}
> +
>  	igt_fixture {
>  		close(sysfs_fd);
>  		igt_pm_set_d3cold_allowed(device.pci_slot_name,
> d3cold_allowed);
> --
> 2.39.1


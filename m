Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946A9C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 09:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B94D10EF7D;
	Tue, 16 Apr 2024 09:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gxoi2mMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A9810EF7D
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713260349; x=1744796349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w8s2umDy4J660dN0aDSnwzQRan1Jr/Jv2U3+5h31Lms=;
 b=Gxoi2mMvXgvtxHQvhKUT+Men+OKPPS89kCsqDQpNtr//6m0u2YCFGczQ
 DPahYvc6DwooF+XQxLKsJ8+tE4Jt6koca10a9wPTgwMx1/H3g+1hYKOyW
 ucM4lHQ1lujn8ZotF/Npc6+RHH9NXOvrMrMPhgwJRsTNvQV2xM4+SClqe
 p5I+cBgPk54gT3+svA62AzakE7NquqWMVctOTd21cHbVe2e5SGCsfeM3h
 uxq7OdM5e4Yu0cgYaBOiOHpaAU7O8rG25eIcoMHyyp+NvHNDmg154cnb+
 UDWEGas5R6i5vwGDpEmNgUpvPvHX7VKkhVmAXkd+vHybgiofO8oQ7Qx5K Q==;
X-CSE-ConnectionGUID: 8W/FHcoXQHaysy1jivyEhg==
X-CSE-MsgGUID: JM32zlvNSNeyJxfmIERShg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="11633695"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="11633695"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:39:08 -0700
X-CSE-ConnectionGUID: DpkQNVNGSgC0DIDCtaveVA==
X-CSE-MsgGUID: ZTEFWRKjRYiRRreOaoZo2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22284375"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 02:39:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 02:39:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 02:39:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 02:39:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 02:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUHsGc6ZQbd1EO/0IcmzUYruZMb9tyJeBnhKvjq940iMn8yU9C7OdHPh+ThIk7HByEPc5LLJQi+nNJT9lc3ViGKeu3ASqWIn4uH01yFVIKrJhQwFy77D90dBlw2EdMRCkYd8jsvnSlyilRHBWAt6XI/gpliAx/4Ol5LdzUeHOuO9tfim85wDnw0zC6nxtKcBJ6fYOB6r4EWn2UrscZ7HB72WkR0yUOwfEOCfuw9V9YD/1yRy1mbvviBANX8W7v1rXgTX5IgY7L6uPg4HLEvIWq7vib10ZqUzycvKNWGpMyMMYzCsj5yPQ7oAGtF95MbwsPdcps86d1IfHuE9fWs01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAMU3IgTNx9/sHrZUxPRgqMF/f8bEX1D+Sk4l1J841g=;
 b=f9sUwMbgdQbp9GjKi1mfGpMWuQlR/znepklpB/ZlCHnmu/lzWKeduaTT5HAvyreE5QGctZdiOm9adbprRMamAFxzHpG+/Ra/3FJrgkt/z9fB3hrWNKP4KXbbFQ7OduJcrkf2tW3gYVwR7vEThMRueawAfvHAirIq4MJySvwyty1hgkyV0Lu1G6YeEmzBoYwVPQrr9gFlsOxtkE2wsu96jqMnHRpp13ITwqIJZls3flLnc9nIqADVuovvtjYMSPejftatmPNmvVQ7pxiqeB0kK9Bb5iYXXBdcHmXxWE3qIQIJgWdRszUCfGkpBJhyVe65VXbb5yHlO6TKvwHhiZLr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by MW5PR11MB5908.namprd11.prod.outlook.com (2603:10b6:303:194::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.43; Tue, 16 Apr
 2024 09:39:05 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7472.027; Tue, 16 Apr 2024
 09:39:05 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH i-g-t v3 3/4] tests/intel/xe_exec_atomic: Use new vm bind
 flag
Thread-Topic: [PATCH i-g-t v3 3/4] tests/intel/xe_exec_atomic: Use new vm bind
 flag
Thread-Index: AQHaj0Q1X8/+dF5E20a2AtQT6cWV2rFqpSOw
Date: Tue, 16 Apr 2024 09:39:05 +0000
Message-ID: <MW3PR11MB474862B13C64C522E986ACC7AE082@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240415143528.4107-1-nirmoy.das@intel.com>
 <20240415143528.4107-4-nirmoy.das@intel.com>
In-Reply-To: <20240415143528.4107-4-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|MW5PR11MB5908:EE_
x-ms-office365-filtering-correlation-id: 9573fedc-fd61-4210-2442-08dc5df90eab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tuQcVo82UnyAYGyCqVJ2DDTt+D+7agrqAykP3iT8y5Z1Hd+Ng7quk+9X309+VgX/crJF4Q56Pou8SUqInoSs+X9owTVhWdcbZdKR73/I7E4DAm6LEBaIDeCvzn4Vkzpw4GZS/0uQTTv/YeondVOmYfaTKvIOkT+ncu4HA7SPIFHz/7TR9y4M+PIurqh+DFW1hmb5aZhwEvymyNw1FyS45LjHhxY/6sPeaHzOg5O/3ZLmU1iXKSkrULa77gDa9nB2B0UpGTAeNEsGWrz6nFtQO9nqlASQEcP2UesCxhY9dTwxLcJ1VuLZCYomegeiXqibG6NNny6WfX5RUhPrOczyT1ArTbCleqjbTJpchwbjr3U9yOwYpBYwejKTu62XR85hsJz5T09PJAx+wkBd1i/PK8S2f3aeqMw1W35IQDae3jrpfp479fo5ZrZsa51QXinJ5ZUeTi1/ni6SUoBPrg9mrbEwuMI04tfslbozw/+tUPYu9rQUx/3evYI/I+WEz4yEu2CoNlt7uDETczt05KG1h49GfFVrh3vzRZw+cJUFVLJnLG/5g9gyV00XLKSR7vdvqfIM9RPzHYA+EMKFdd8gmhZALy063vxyQlU5pxekM0Y8HHZ6YqRTXka2Cxl4dwAnaZTdJb9fNMPNfsqVpW3wId+dhvHg+HjL8RxWD4Xc2O711WM0GB+Ya+6rFbdL/G0WoLJ57YUIooCKp304KRxW/pUI9E/zU8r5+KW/7WlTGtY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fPzm0uVofUXu2tSCBqkPRnect/K7US1jiWMzffru/hIAdUyhxmBTx9KSPmBi?=
 =?us-ascii?Q?5DskG4GKNpWe9QYjcRBXPFYJs9e25eB+j7V8F9N25wHI+HAvozvi711pCp3R?=
 =?us-ascii?Q?mo/b6ch62vpIoJzhzJE+zgC7ssak6lEg2crgwHPQvUBnri5TbvUoUqTgXdSg?=
 =?us-ascii?Q?mx7/d7Hno4vsmSVO6n/XXHtf53ApW+OzfxhgcT8GqW8Sgj1v3quCAVSSMS0h?=
 =?us-ascii?Q?gK/NP7uvjbVu2uRUhCudXTJRrXeX9EotNLE1pzt8tIcHjPAHxqhD3kSNnWME?=
 =?us-ascii?Q?QUOY0t0u/hjNQqbGjgxt8a1I11qpdgYBKj1Sa8Lvvj6UksUIuCdGjFClLqP/?=
 =?us-ascii?Q?7uSs+oh9MIjNVm4Z4zlsNUJHqAnhViFHWtK/qzuUrCe+hC+EBP1d0YBaRqdF?=
 =?us-ascii?Q?GouK5AlaZJ5tKDrkV5yah4kD1JEoWSJJvH8ZXC7mmoND1315qvDVMzZ5bWj/?=
 =?us-ascii?Q?AKT70gxKkAaniIkeysXDsYaIOUXOK+0qNxgsrlJpfehO3fZKHBBImXxNXeBa?=
 =?us-ascii?Q?1qYeheD8BmUiysPcQRoWX33FMpRfL3zmSy8DPf984RpbJGTYiD5UY8VNZ5Fn?=
 =?us-ascii?Q?WZOATKh1rLilXx5PWq0Yp48gOsWGagn3mo8R76re++Q+icIXy9+KGxy8mZCh?=
 =?us-ascii?Q?sfFcWyRjf1cqnWCy+WSTPsnaqTDTcqoCu7qNYhCOl1frkjNI21m6qCYhvNCp?=
 =?us-ascii?Q?89qvvQvMVQlRi9ogrsYjb1eK3zzzCTEgg1hJ9Fib8duPcYNe5mHHnpUTYKVF?=
 =?us-ascii?Q?jpC4ZmVm+XIcGJN7+X7GizaOtkJCfNgsAHB/50sgY+FxbTlbzBUJq3pT7O5R?=
 =?us-ascii?Q?35t5oFO55aaQIw4KQrOuKCa2ASQfDNzxrDc5UuiFmEQGK/IaRBPadUcoTLF7?=
 =?us-ascii?Q?5cZaJwMYTozcb7WtBIn4G7JgObfGbNL5pZ+wIEQo2g6hSRVH2FDrKejz/Xnl?=
 =?us-ascii?Q?3b2/yIQ4m88g9o1HP55doV8fW1urFxEfGoIUhk9UNxSZ/1+ybRTk7W7lkKvZ?=
 =?us-ascii?Q?hV7yNbnawZHR4cmvGEu+IN00QjXbsH3VYBnAKt7u5kQqITWueusFmYvx3hCv?=
 =?us-ascii?Q?YGi+6oGh29q03VR7wgedzOpK16z4kdT86uql+uTO9jhIqJUXqPqNnYAz8uhr?=
 =?us-ascii?Q?zucVOcXwtrGo5ZTLPpVXcCt6SSLmkzvIz3q03XizJK7JYkU1yQAETCyPh23T?=
 =?us-ascii?Q?gcwWj8zenyDyoM1y3JsRn8PIy2ihWYR3qQK/dRZGWUrhOWlCQytgAmyyFIaX?=
 =?us-ascii?Q?FY0LatemsIKmqXSc4uOddd9AVXcVm/KpAiNC3rCZmlyuZO+39SG5mePEEo0k?=
 =?us-ascii?Q?SbX34R2w71gZUeuQQPV7WjrbzxoxGIagZyNbzJk78oq8Btst/AVeOuZ1M6R6?=
 =?us-ascii?Q?oIaJ5GtUXOAsEGVDpIsecpsBvxHWCGDg0+6m0X8nmRWsgpBgJHgG+L+Awlha?=
 =?us-ascii?Q?0H1/Jzivb4AL2+PNSc42L7IObYtS/hPS5Cp3uFJgD7jZTQfLLV/Odkpw6jkr?=
 =?us-ascii?Q?1zbdvmv3WYuSxKAKZerjgSXna9N7yoAXhdP+oK5dfxXyFxgpQrylMQ3HkbeL?=
 =?us-ascii?Q?AJe32lJV9OTXY3SVZewL8zAkLqMmfnfDw0SCGA+t2oSaUxKuDRfgl8wAYlgy?=
 =?us-ascii?Q?Gw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9573fedc-fd61-4210-2442-08dc5df90eab
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 09:39:05.3495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PH/I8Cc57vS8YEyEYEUg4ni3TE72+qbsd0+IAWH2XQ1znY80weOOsLeCmSVW+EHCjI1cBiRZvTHQw7RPWj4p1L7zKl3I9NyrFREDUDHNcjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5908
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nirmoy
> Das
> Sent: Monday, April 15, 2024 8:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [PATCH i-g-t v3 3/4] tests/intel/xe_exec_atomic: Use new vm bind=
 flag
>=20
> Use new vm bind flag to probe device atomics support.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_exec_atomic.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c =
index
> d9790da78..458539335 100644
> --- a/tests/intel/xe_exec_atomic.c
> +++ b/tests/intel/xe_exec_atomic.c
> @@ -85,7 +85,8 @@ static void basic_inst(int fd, int inst_type, struct
> drm_xe_engine_class_instanc
>=20
>  	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
>  	bind_engine =3D xe_bind_exec_queue_create(fd, vm, 0);
> -	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
> +	xe_vm_bind_async_flags(fd, vm, bind_engine, bo, 0, addr, bo_size,
> +			       &sync, 1,
> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS);
>  	data =3D xe_bo_mmap_ext(fd, bo, bo_size, PROT_READ|PROT_WRITE);
>  	data->data =3D value;
>=20
> @@ -112,8 +113,11 @@ static void basic_inst(int fd, int inst_type, struct
> drm_xe_engine_class_instanc
>=20
>  static bool has_atomics(int fd, uint32_t region)  {
> -	/* System memory atomics on dGPU is not functional as of now */
> -	if (region =3D=3D system_memory(fd) && xe_has_vram(fd))
> +	struct drm_xe_query_config *config =3D xe_config(fd);
> +
> +	if (region =3D=3D system_memory(fd) &&
> +	    !(config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +	     DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM))
>  		return false;
>=20
>  	return true;
> --
> 2.42.0

LGTM,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

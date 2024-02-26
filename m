Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C23C5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 06:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F9E10E44A;
	Mon, 26 Feb 2024 06:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeCstDsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F93F10E44A
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 06:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708930222; x=1740466222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VSSLMNDMQ2lO1NFKbQcUBGtnXAnG7BURg7QFAyw3t7I=;
 b=QeCstDsSdS2P1KsUZPZ56y57PY1X6nB+5e1PkWcG/6FaFo1jJ9Iw98sJ
 SHbMnD/QAqfbB76b8x92UCF+Odm7agx/Xt2a0/rTWufXP+CD4CxEVRzLt
 mLDqaicYE5x8/KjT9ZsZ05jnAW95Y6ksZetuEiOZN12Uob6GBCOP0b5WI
 PBoQhjMrEPWwVMl7v1V0f58r+V1RxN4uQf/ERG90n/VMqP6MP7LKL3enb
 WtIRsWgxNA1znxpPDGczT4QaEmZR/3EQn6XYOLksuJ7BgjcZ4FJJEfzhn
 1AS4vCTUU0Y9q59/4VfI0KQ0GL2o+Cu3WMR6cBtXmtWM7e7VNh/7LViQ5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3059283"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3059283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 22:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11156958"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2024 22:50:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 22:50:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 25 Feb 2024 22:50:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 25 Feb 2024 22:50:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrqXy4oZF0cyULsiQqyGmfjXTviLn+UjFAc/odzSY7v71Lzpx63lvGg394wCjX9z0sBuaJ9+yifFz8ntEWY47EdwWOm265vnuwRylGZ67dI7IjhOo2FGG9BATAl3uwe16MVLYjsk3CDqyQpU8WNTU+K0dddm+Vt1+4dK8IcH2hHDed+1Jveft+Jr+lX6DmSs7Mjf/hJILNmbyWRDCf0pfaf2lFSa3Sz0mIPLm+hDNwfkTDLKpVWtWtWY1bqh67Le9IbztL4xodE1FixTFNxIWrmtm1gvdtleJ5gQrLculaMr4VbE3oWLG5mFXXhDB9o6OJOyz58sHUNJFQuzJJnjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYGvKtyb6JYUvWz12yUKrWUbPLBhLi6/2FImdUsnJM8=;
 b=bnytDwzk0rZKS06TcNaTGwkEDpa+Ync6u2HJ9XPlvDje93IPm7inOmR52H7fYoql3/ps/DVCxBuByx+SkiNARkPv0SYht+q8nYGnFJasxTGEnZWswZXhtNAdfqsIS7E/3JRVWj2GY6iun1SJPoH6HXEWHaXJ/zezPQtZE7xnw0gXs0hwvEBRDeps+/Mh4H4abpJqcgfNgA0PLiTqpKnpM5eD86a9LNVGeAoHcoTdAge8t8+cSmkwAn7vr5qjVbT1rSD6VhHyuaiXvvjBQEjViXcAk03ydyA6Cec9KTV7QmMNLP0B0CDb0e8K8poQ7UOm3BgkDfwbfm/Fnj6geFTvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Mon, 26 Feb
 2024 06:50:18 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::9d1d:68bd:1d3f:901]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::9d1d:68bd:1d3f:901%5]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 06:50:18 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume.
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume.
Thread-Index: AQHaZiTP4liE+JtmvE+HiDAebW+UvLEYZbYAgAPNbVA=
Date: Mon, 26 Feb 2024 06:50:18 +0000
Message-ID: <BL3PR11MB5747784D6611C55E7609D264D05A2@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240223065136.19900-1-sai.gowtham.ch@intel.com>
 <ZdkDhAT9FxalNTEa@intel.com>
In-Reply-To: <ZdkDhAT9FxalNTEa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|PH7PR11MB5957:EE_
x-ms-office365-filtering-correlation-id: 91aabe0d-8961-4a01-9d81-08dc369731f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xzX7FEry1hFw+P/VHHRcUHmetmrfn6iJq5bzS7Fqa3wL0qhqCrkFo2hPV/axaNDNqDnyTN7RjPqLtHP0uPaoe1IK5iYrz+NNebY3nkVx3l2VFvzlaHRLdiyK/LqVtVe+V7tLtNvFogL/OWg1/AbYZ2BcP0Z2xlf4wFk18j/hPc3qijrHnAKZD66F+2Hog5PG+TIL7tK/nGjyWV2q8XaWwC6une8vO6aglC8smr/OIEbp1kqLQM6vxd3/b87yKnwsBe86l/CcDXMjaWGPh2/dio7poJ1tK5tpZYQx3J883N9zWRoylEdFDCa51PL8mmtBmAW7ERKetoImjWbzm1e7qCPNbwuyoShx5q13OEhOWN1CjP31oKCvcpwrrTHoP6ZV0nDXEpwQ3uLf+DNHJqUY1uGveY6y7tCOSjh15Ufl3JDz9zInEUt16TKagDehM4B/JsVBgUnlpMowmffut/3kKo8cVoZfmx+G2/shZQINeAr0e9mvWURlxP7ubp89YUkWLIgS6BmboDtaSk8DZ7ZaLAwdiVoGjg6bTDjl345TForIwu4UCOp22uVs1EPhT5nf57aT5fQ6H3+x5m5EEKfllv4mLyLf7mXUPTYtqXY2wh9olRb3JbZBVDF+u4Gx7vjD4528ILe+cVYJlZDKDaibLrLXlgpR4zTeLMcxv2BCaRIelOUMMRjk0jO+0OKWvqEKMsWdYbdaZPOdhQq9u/Bi9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PVoqUpzCnax585n4NJSCB4K+5mW0Y7HUNjD8jdPCIxkgSu7yr0C5uICEXz03?=
 =?us-ascii?Q?wG+aVQw9ujGp4eNBPK6SoPGwkEqdTcW0hcZw5t0b65FgQKCT4Vjw3zO0HolF?=
 =?us-ascii?Q?jcM7cOVVGyiSr11EWw8XHQQiZcs2GoiEC5p9zY1Q+9imnncNHeWr6sMAdHXj?=
 =?us-ascii?Q?yZ+gDR1FJnyOjJcDXj3IwVCURHGdnBHJCEu1w0NhL0kjlC9U9d16oTmAvZ8s?=
 =?us-ascii?Q?TR1kRBYc9gk7NY/T4lFcOhiTo7of3grAS1otq30BYD07YaaNCnRR2piau/RM?=
 =?us-ascii?Q?aWKCWxXcDhqFFzQOA/tbTREdNyulwVT82k8ca+qLL83H+rE7KU8GbWlkqqP2?=
 =?us-ascii?Q?FvOEg2PNQfgAbMzwU/zeDStczXnbX+wE2n8T7ErEsPZ94gLuB/6fdgTgmA50?=
 =?us-ascii?Q?flWvtEmOf4sv6G2sE+a9y3GQ0RHQxc5YQwH44Qq5e82AShU+eFufNQ7yrwcr?=
 =?us-ascii?Q?Q8HnprnUs5l/x37jV/1TEiafAY0p0wUPvhx6oRgdfd1EtsdJUvx1SW0Xa6A3?=
 =?us-ascii?Q?qsT40+8n8ne/wrJUxBasgNzMLkxwMwQVqqqQXUxPTBpmFNBktjNB+lOW95zz?=
 =?us-ascii?Q?EEufgUZL2U+CznufVad/JiM0Z8Bs41Wg95xuvfH2ZK9mN4o4RG2PBMk/lpUg?=
 =?us-ascii?Q?X9qCSCBmWvRl99xtZVlK6Suj+kvUbKwpC7OVvasoRfL2z23GMG68l7pwi7DY?=
 =?us-ascii?Q?O+5FvY3cK+lzYwXSwN3Y+cxIb0494z57SN/2J7OGRduwTg+QaM6Yb3v/2jor?=
 =?us-ascii?Q?LD5D+5TkUVsu5ivQghAUjJxglvRXOwHV7WboYZLTuHgB6lKzYWe5o81/elXW?=
 =?us-ascii?Q?cCRNzmwbTYNzVzCEI78CSkian51VvcQhZ3f4VWpdRf8UYl/X2ms3Az/Mk0nF?=
 =?us-ascii?Q?qd7fjbx4vcs9LLJjnfIIhqq31W0EQZXdCMjp91GNNlPFlsLVzWgWWq4d2q2W?=
 =?us-ascii?Q?+AIJ8Ot9fqavII9AnrqcTwYhruVvDHuS0MihX5TfEE2eDawTwS0+HwyI3EBW?=
 =?us-ascii?Q?B5SOnzQ+1eUcwub8+9nj72g4+AoLC1raedMlOV4X4Sgm2y4dZTPxNGFrg9/E?=
 =?us-ascii?Q?ElBn9BcLSlO6h5sEb47inykLAwSRlulm4bAwTzEvRV52SPg/pFh/9lQl6pq3?=
 =?us-ascii?Q?npXtY0FAL01yib70ARkFQZTMAXew7oonxi+MjcMQyZD/BQzde2JrpNksZfIE?=
 =?us-ascii?Q?08q+KPO5UQCgbMVCWLkBPQoM3F6YWRKgX7fAQ19A21HkUgRBfxrld82RY9wp?=
 =?us-ascii?Q?tzklXvOojureETtoVTnhXM5wR0QsrDZJyDxaAwy9pa6d9yAszc96rYkN1IfE?=
 =?us-ascii?Q?SqvlfRXd6wvlsagdf8+Xt/ELw1cPYGHYLqkHeztK3T0vLAsrpAfQfWUmNHJO?=
 =?us-ascii?Q?ntLXL7p2V6IcqCe8C/odDr0Ul8GHq3IIeb471eS0lcRGvpljlm7sP8zNGjUb?=
 =?us-ascii?Q?l00Ea3BEd536nWFxzahuA5LYit3Y3yAThAcGv/Z7s+OaH0QH9fJnTIUqA0Rr?=
 =?us-ascii?Q?N6NQ1PnVGmFL89ASZXcJzpR7IBtvdlTm1Nn+kj/2TQc8RPGZ3yJbvdfEyCZx?=
 =?us-ascii?Q?3/qXQmZUYsx3lvMNOuyATasENRs6Kj84ftUa5te/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91aabe0d-8961-4a01-9d81-08dc369731f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 06:50:18.5484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kfIVLL4aTzaoiHSFg+PDzXok8hNjTQCEMexT8dxWEzm2vDerBF2BM+MvOgMLpJfEaVP64YTWGk38/tC8Ep/mK14R5xYtdsDIYSfPgrxbRz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
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



>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Saturday, February 24, 2024 2:14 AM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>Cc: igt-dev@lists.freedesktop.org
>Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vm bind fun=
ctionality
>with suspend and resume.
>
>On Fri, Feb 23, 2024 at 12:21:36PM +0530, sai.gowtham.ch@intel.com wrote:
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Test validates vm bind functionality, by suspend and resuming the
>> device before and after binding VM to a VA.
>>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_pm.c | 92
>> +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
>> a0045da0b..f9d2ce421 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -550,9 +550,96 @@ static void test_mmap(device_t device, uint32_t
>placement, uint32_t flags)
>>  	close(fw_handle);
>>  }
>>
>> +/**
>> + * SUBTEST: vm-bind
>> + * Description: Validate vm bind functionality with suspend and
>> +resume
>> + * Functionality: pm
>> + * Run type: FULL
>> + */
>> +static void vm_bind(device_t device, struct
>> +drm_xe_engine_class_instance *eci) {
>> +	struct drm_xe_sync sync =3D {
>> +		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
>> +	};
>> +	struct drm_xe_exec exec =3D {
>> +		.num_batch_buffer =3D 1,
>> +		.num_syncs =3D 1,
>> +		.syncs =3D to_user_pointer(&sync),
>> +	};
>> +	struct data {
>> +		uint32_t batch[16];
>> +		uint32_t data;
>> +		uint64_t addr;
>> +	} *data;
>> +	uint32_t vm;
>> +	uint32_t exec_queue;
>> +	uint32_t bind_engine;
>> +	uint32_t syncobj;
>> +	size_t bo_size;
>> +	int value =3D 0x123456;
>> +	uint64_t addr =3D 0x100000;
>> +	uint32_t bo =3D 0;
>> +	int b =3D 0;
>> +	uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
>> +	uint64_t batch_addr =3D addr + batch_offset;
>> +	uint64_t sdi_offset =3D (char *)&(data->data) - (char *)data;
>> +	uint64_t sdi_addr =3D addr + sdi_offset;
>> +
>> +	syncobj =3D syncobj_create(device.fd_xe, 0);
>> +	sync.handle =3D syncobj;
>> +
>> +	vm =3D xe_vm_create(device.fd_xe, 0, 0);
>> +	bo_size =3D sizeof(*data);
>> +	bo_size =3D xe_bb_size(device.fd_xe, bo_size);
>> +
>> +	bo =3D xe_bo_create(device.fd_xe, vm, bo_size,
>> +			  vram_if_possible(device.fd_xe, eci->gt_id),
>> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	exec_queue =3D xe_exec_queue_create(device.fd_xe, vm, eci, 0);
>> +	bind_engine =3D xe_bind_exec_queue_create(device.fd_xe, vm, 0);
>> +	xe_vm_bind_async(device.fd_xe, vm, bind_engine, bo, 0, addr, bo_size,
>&sync, 1);
>> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>SUSPEND_TEST_NONE);
>
>this is the only thing new here, a S3 right after the async vm_bind.
>for this we can only introduce a new option to test_exec and add this line=
 there,
>withouth having to recreate the function.
>
>But I also don't believe that the goal is only to test this, but a combina=
tion of
>VM_BIND operations and how they survive to the suspend states.
>
>So, we do need a new function, but to test a combination of the vm_bind
>operations against the combination of the suspend states:
>
>*  - %DRM_XE_VM_BIND_OP_MAP
> *  - %DRM_XE_VM_BIND_OP_UNMAP
> *  - %DRM_XE_VM_BIND_OP_MAP_USERPTR
> *  - %DRM_XE_VM_BIND_OP_UNMAP_ALL
> *  - %DRM_XE_VM_BIND_OP_PREFETCH
>
>vs the already defined s_states and d_states
Thanks for your comments.=20
Makes sense to me, Will do a restructure of the code and add different vm_b=
ind combinations which was missing in this patch and send
a new patch series for review.=20

-----
Gowtham
>
>> +	data =3D xe_bo_map(device.fd_xe, bo, bo_size);
>> +
>> +	b =3D 0;
>> +	data->batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
>> +	data->batch[b++] =3D sdi_addr;
>> +	data->batch[b++] =3D sdi_addr >> 32;
>> +	data->batch[b++] =3D value;
>> +	data->batch[b++] =3D MI_BATCH_BUFFER_END;
>> +	igt_assert(b <=3D ARRAY_SIZE(data->batch));
>> +
>> +	exec.exec_queue_id =3D exec_queue;
>> +	exec.address =3D batch_addr;
>> +	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
>> +	xe_exec(device.fd_xe, &exec);
>> +
>> +	igt_assert(syncobj_wait(device.fd_xe, &syncobj, 1, INT64_MAX, 0, NULL)=
);
>> +	igt_assert_eq(data->data, value);
>> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>SUSPEND_TEST_NONE);
>> +
>> +	exec.exec_queue_id =3D exec_queue;
>> +	exec.address =3D batch_addr;
>> +	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
>> +	xe_exec(device.fd_xe, &exec);
>> +
>> +	igt_assert(syncobj_wait(device.fd_xe, &syncobj, 1, INT64_MAX, 0, NULL)=
);
>> +	igt_assert_eq(data->data, value);
>> +
>> +	syncobj_destroy(device.fd_xe, syncobj);
>> +	munmap(data, bo_size);
>> +	gem_close(device.fd_xe, bo);
>> +
>> +	xe_exec_queue_destroy(device.fd_xe, exec_queue);
>> +	xe_vm_destroy(device.fd_xe, vm);
>> +}
>> +
>>  igt_main
>>  {
>>  	struct drm_xe_engine_class_instance *hwe;
>> +	struct drm_xe_engine *engine;
>>  	device_t device;
>>  	uint32_t d3cold_allowed;
>>  	int sysfs_fd;
>> @@ -693,6 +780,11 @@ igt_main
>>  		}
>>  	}
>>
>> +	igt_subtest("vm-bind") {
>> +		engine =3D xe_engine(device.fd_xe, 1);
>> +		vm_bind(device, &engine->instance);
>> +	}
>> +
>>  	igt_fixture {
>>  		close(sysfs_fd);
>>  		igt_pm_set_d3cold_allowed(device.pci_slot_name,
>d3cold_allowed);
>> --
>> 2.39.1
>>

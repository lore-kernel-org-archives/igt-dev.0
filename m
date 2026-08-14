Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25942C5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 05:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8551A10E069;
	Fri, 14 Aug 2026 05:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2vSyj0Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFA210E069
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 05:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786685069; x=1818221069;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=h0WB6IpDrYLE90tBvPNcsmAFAVGu1X9gzdODkC/W1uU=;
 b=L2vSyj0Q6IADU21p1Be7pX/CV2qDs+iaW4c6YhUs4+w12nOGIiFWb/Ck
 B+fC4j4So4thmfnl5LnUJfuqGxigXXRmdyWpGbBRR1idMj05peZig2VMD
 AdfH/ZIqcaNNWC06xmyCaIwUf0kVfgKI12aV+tgzm3TEk7ZZwQ0y7+yxU
 v1eyOnXr64ZmP23tkWTLm0SCPcS+OJdtxyvNQrrrKsu/lrY5qcJQIVrzW
 ytPgASbv7Q7Gpv5lsx4mAB4VHa3whilkUP1qAwatZCthyK83AkJNicHJZ
 ofbSpcnaV3DiUu/xc9+pQ4yF6ZRYAy50LuEWcpvRMlvbDdnO2X+TXubFd A==;
X-CSE-ConnectionGUID: 6fOp+qIdQbmuPgJYsOKy7Q==
X-CSE-MsgGUID: lS+GNieST1akJYrTNz18pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87481498"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87481498"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 22:24:28 -0700
X-CSE-ConnectionGUID: ixnJ4jOjSnCgilGhGcGnsw==
X-CSE-MsgGUID: HCmoeCQhQFKk6TuFDqz0CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="266118377"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 22:24:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 22:24:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 22:24:27 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 22:24:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7Dd2xeNkHPkV8BI7ef7NhoAW/O9Wdn4hrnCTaFGVUGNNjMiTNrc9lSIpGHCo2oclroeVT0cnV5g2rQ3WJYJ86UaqRAX6ycTZ2/upoHGC2p2pZhmuhON4cOC+7il9k4nGAbzGD9GnlNMkUM8LajF8TFZFC/I6JUzrP9vJN3AQ/h9kMlzMaoRQRNHs23yTRLQrtNB9bEqUZ8maM0ElKCgvxzm5YMaVOPU7hewlpMcNv6R1IN1H71ZK0EFE1zvFXIjV5VnXl0KFIQQj+472i2hUrAU4RAW875XQMIo/PwWmXBgxXeo66DvehiNSKGAcXckI4LtpyspwVkyfl6cx4Ap5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ep0UBM8KE5xfvFnEY7rcDtuU3gLHTR7UydjyM4VMaPM=;
 b=iUa3EfI/fXHWODwLwPWBbHcH4zMPw0I3afNjj+M8aVKgo8n8jBShAGg5uZebMmvFHUITHX70EHF1L1galoYABBPA3NqA98a1PpC8hklv1qtqYjEPJsaw78a51i4t2l9l+KXF2SshE0TBG5DZzoqT1HWwpEppzw2i/2sm+sDLUBYkX6bxpAAHWpJKCmz/525JvEkTKZtvpaVGFQdqz+V51KCK6jsYKpj3Fk1l/NSYvnOL0iXXFGZqyfJZBoIqlJNJNPk7B29ushoOZSDyDHoiN3+s/22GssPguy+FgYP+DL3t7tFzdbeSUiV4AlzeT3lvCjJ8NenzRUlYzWekuhg1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by PH8PR11MB9772.namprd11.prod.outlook.com (2603:10b6:510:3a4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 05:24:23 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7114:e8c2:4d34:2901]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7114:e8c2:4d34:2901%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 05:24:22 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dandamudi,
 Priyanka" <priyanka.dandamudi@intel.com>
Subject: RE: [PATCH i-g-t] tests/xe_waitfence: Add user-fence-no-signal subtest
Thread-Topic: [PATCH i-g-t] tests/xe_waitfence: Add user-fence-no-signal
 subtest
Thread-Index: AQHdK5KGHLgXxWWSQki+mnVKeBEnmLadApcg
Date: Fri, 14 Aug 2026 05:24:22 +0000
Message-ID: <SN7PR11MB7489097BD5AE810E3DA349AF85DA2@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20260814021241.2807767-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20260814021241.2807767-2-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|PH8PR11MB9772:EE_
x-ms-office365-filtering-correlation-id: c7dc9fde-e503-4d60-59e0-08def9c44cb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: j99igCMKpbv/yKkABMHqgRuzyhmZewEy/qbwdMN20Nn9KZZHMJm4C4ozcL9IKJPNlxyLqhgN9tFNDoaINPZJNlDcyOP54gJlFH2oyoIs6kqA+zWeXzEdib+qqmhkmeKSBn3phQAVlmEAPqMpyv/ErG2Ue5NK94fYRbmai79uOLIsgDOh68oJgvVqtIsLfeIl5hKcVRKX9Xrla3QONa+Pu6q49kUlWqlh+a/YlCDB+8mHjgS2f7uF6Iqhn6sTF0ANSnEQCB5Vy/T5EQG3dmx7X1g3l1ckddSEISg27hO2vJzCIfaivarz39LeNBaYXHxhHRY65aK/v5UYMdfr8TWVO0oI1yN9i5G1tV76yO6Javtz+iD7p2Wii3RnaOOfjVlt7ALuq9eUWdIuyLFBi05Xro08JJ5OFQ8w+n8J2pQnSWB57MJON08TzKSefbQzptwRxQjDU/yGhZcFeSQUWivfoX2hePSJTQbk+d1rT9Y0zo5w7YBY9Wau6fj3+VtjAEw+37QgigXBVjXFM6WaknG/7lETI8yyqra0pwp2f8dRR0Pewm7k0D2cJUS4J5rS3l5WyllKNmFTacO3hYHOFA7i5Yl/SG/cuXIea8iLZUYGIIyJdOFpYHQNfExL8u0RiEQL38OLuUU6rxL3HCxw8GkaQ74llQKs6si6xU9RLzfZub72B/dDGwt15wVt8HKSZomViVb6tU62kmNhWDI3E1i/Rw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QtOzOCD4BYOtJITxCYvKXIklsCj5Muy+HZOH4L2Tk/jx2ZRj5GlcwKIOJqru?=
 =?us-ascii?Q?QiAYuDI9vYIf6vMBCxj7t2jnjpE5Eu7alXBTvYIMwNPKL7GWSgmwRBBRZwyc?=
 =?us-ascii?Q?tyhL+w2ul4OlSYiDMoDvplC49BzxgUp4rLCqLAjCszOapgJmJrQ6WZGdhdvl?=
 =?us-ascii?Q?Yefpu36LmsA3uPEEYn9AibJXj5emw0xaAmkNvC2l2hJznC7nLvYXWm04QTGP?=
 =?us-ascii?Q?7e4uS4Phh63W/mbaezixEQpdXlZ+h5HPSM74QLuZAZEZGk1D1Mnn1niGkGg1?=
 =?us-ascii?Q?Yrk6smaLckqKJpfXpGn9iA5mQ/4tMNlz0zSFJx0SugFG8aWpwv/WMDLGsf/h?=
 =?us-ascii?Q?xODAK7eM47wZRRrBmBXM8lj5kQl3x7nGH8dj+5UB1DIcHYIcrz+pfWQ5PZvb?=
 =?us-ascii?Q?LdmYaHD0366y3lTjKUpf6f/hBsF9lQOUrk+ODc8J2MTHF2BvIsccim55tlb7?=
 =?us-ascii?Q?c3oH3CYgrnDOuzdOPVNLS7sHGajrfaMmcNUsDkGeQA0JUIJph81OdSO8NKfI?=
 =?us-ascii?Q?0mqA1XkfP/TVyBvdwTuyN8OfaRP9CKcksinHvPP80zsyrc4/OZPjMolkyYx7?=
 =?us-ascii?Q?6z98NbBTImwkokUFVDR44oJM5w1D3P+WIr5oZ9IcQg6rIDyWqwLumogNifvW?=
 =?us-ascii?Q?vpeT6cSNpT61tcfC9qPegt6T9SgC6mqDP0Sl/EL4slzMpDGfHaNtBq1veOEG?=
 =?us-ascii?Q?ix67QOh5RQvqSUDcQ8SYYbd9KKX1BL/c0/Oyk98GIoeIh5/rY81RAKz/0xQy?=
 =?us-ascii?Q?qqMWxGZNMWqarm8L1bkd6eUdVQzmPWjNTcnWBCkAxKwmX/pYqEDj0Di8c3Vi?=
 =?us-ascii?Q?qJJef2m+len/Lb3fLWCT/Nje9unoHbVktqLLvCVjpQYUSJupGuV4xpXSYvJa?=
 =?us-ascii?Q?pPSFW7wqcea5zfXxYzHYC1nzVsG4DyrAwMIlzQeU4k48lYJNdtsluCE8KArr?=
 =?us-ascii?Q?rnMe5Xc4SnAkU5kaTbOQVvwBp8famYlcuKxsTL+JQbApWM9qEeK/qohXt2sc?=
 =?us-ascii?Q?H1BsCklsbt0jgCpbfjXkSd4F1MDut4V5AM0Mj+GbaYnH8UaOmx5OoM8lrNNR?=
 =?us-ascii?Q?qXjUR7RkubAleHhSF6uYu1ANRObTAkL+gj7ka+xXyanslsi+6NLtdq0luk2u?=
 =?us-ascii?Q?j3cCEAOjOZ4ae/mBwmD11FZ5YnWhdPQh1ePBOcuYTgDMYzG3Zt2iUGm5hQye?=
 =?us-ascii?Q?Ahad6isPN6ykDa+sn4fmHO8YWaiwb5AUqmxwfDXARbUpD9nJpcNXIvapJsT6?=
 =?us-ascii?Q?tA3TUd3MNqIyczdyrLYfu6EhVSd/Ozq4pX03VW0c507YjHNt20KSFZ5WR1az?=
 =?us-ascii?Q?izkuqlVLVirtjvOfOWUh8AoOCKlWIDrWEq08SHfdJGx1j4btktqAmO2x/z1T?=
 =?us-ascii?Q?4KUF8oyJsMr1tjrztr4QyyXiUWKq5yWB6cS0ClgNJZpkdSnlZoi23pgKcVWW?=
 =?us-ascii?Q?Jn2Sw4W+wke5RHzt4bKQcQLBQ8RbQIe29vpLDSwnVytxLItBgthK0GaG8KkE?=
 =?us-ascii?Q?tb3qeZLFTmjUh3g6fuP2LurLi7Yf36pG7yAftEoa0MSIlt7infCOey2EJHEo?=
 =?us-ascii?Q?EamobJFpzFhCLPEo89aZ5oXqb8wFPIuZOd+0d3u6RtJfEm8qVBDH4p3Vfx28?=
 =?us-ascii?Q?gfc1RcNN6XnrQLUcMlcMOAYOPBz96nmKgHe+2VG0fKY7/MuBqaJfgqavIOxz?=
 =?us-ascii?Q?UeCgrA4okvuFTLP0tsYpXCdgGxa2/E/8Bs9a0zr5Lo1GEA16uekPzywXElO3?=
 =?us-ascii?Q?fwS0tayQZg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: i9uAjCY5v5DVuQdOXcNcQpdUtUnPOsZzJdw/i44OMmXgZ7L2MmF78ql91zYKBAwW7sgch4W5P6PGVLGHHC3NLkXnxH8D5iYlg5SLZEW6/XNSFXJQ+NW0RbMe4OkV/prQ9kSsIc7QQmKwg2ssQdVeOVwI8F5Gd+0xyGpqPBopEHHWahZPNNZpDeVZu2oTOCabJVxEr/Ev1sNAbft8lRBiboMmSPH3qRfI/TqKotruPxe3P+WokE48Jcy5xA07tIhyzLY7vF8qPm0C+zPnXrqPLoEQsyYritXncvzMqle7uZRAmVP9ksGnXwndj3UIxMYA3nhk0s+Nmp+vtiNzWIOv7Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7dc9fde-e503-4d60-59e0-08def9c44cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 05:24:22.9043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bqEgJEwl3T3J3MSWzYr9P+L1FRnmODpqFsdZCyWdNpdKrYGiFPm7dw9tvbbF0jMZL9+y465ms0IyiHzxgA2S2eCxDe2q7YsR9m9uqD6m9aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9772
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
> priyanka.dandamudi@intel.com
> Sent: 14 August 2026 07:43
> To: igt-dev@lists.freedesktop.org; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t] tests/xe_waitfence: Add user-fence-no-signal subte=
st
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Add a negative test that creates a buffer object, maps it, and calls
> __xe_wait_ufence() waiting for a value that is never written to the buffe=
r. The
> test verifies that the ioctl returns -ETIME on timeout rather than hangin=
g
> indefinitely, reproducing the hang scenario observed when a user fence is
> never signaled.
>=20
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

LGTM,
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

> ---
>  tests/intel/xe_waitfence.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c inde=
x
> ff92a13fa3..ecdce9f93b 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -138,6 +138,37 @@ waitfence(int fd, enum waittype wt)
>  	}
>  }
>=20
> +/**
> + * SUBTEST: user-fence-no-signal
> + * Functionality: waitfence
> + * Description: Create a BO, map it, and call __xe_wait_ufence waiting f=
or a
> + *              value that is never written. Expects -ETIME on timeout.
> + * Test category: negative test
> + */
> +static void
> +user_fence_no_signal(int fd)
> +{
> +	uint32_t vm, exec_queue, bo;
> +	uint64_t *ptr;
> +	int64_t timeout =3D NSEC_PER_SEC;
> +	int ret;
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	exec_queue =3D xe_exec_queue_create_class(fd, vm,
> +DRM_XE_ENGINE_CLASS_COPY);
> +
> +	bo =3D xe_bo_create(fd, vm, SZ_4K, system_memory(fd), 0);
> +	ptr =3D xe_bo_map(fd, bo, SZ_4K);
> +	igt_assert(ptr !=3D MAP_FAILED);
> +
> +	ret =3D __xe_wait_ufence(fd, ptr, 0xdeadbeef, exec_queue, &timeout);
> +	igt_assert_eq(ret, -ETIME);
> +
> +	munmap(ptr, SZ_4K);
> +	gem_close(fd, bo);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: invalid-flag
>   * Functionality: waitfence
> @@ -291,6 +322,9 @@ int igt_main()
>  	igt_subtest("engine")
>  		waitfence(fd, ENGINE);
>=20
> +	igt_subtest("user-fence-no-signal")
> +		user_fence_no_signal(fd);
> +
>  	igt_subtest("invalid-flag")
>  		invalid_flag(fd);
>=20
> --
> 2.43.0


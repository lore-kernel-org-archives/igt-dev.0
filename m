Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C213CE77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 17:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC0310E105;
	Fri,  3 Jan 2025 17:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCfunMiU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C015A10E105
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 17:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735926591; x=1767462591;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZC3Gajy5kwKcaqxyZRaFKH80mEXJNWoVZJykTW2RcCU=;
 b=mCfunMiU4tm8oCB0MM4a/dJ4gQGR6cvFBE3AYAMUbgO+KmKnvmi+5nEi
 v/ctCGZaibAktqNuEXRcMHWYyu3s/LRfh/alcsJoMtUzyozY6s3MX7k7V
 gxvejJuOZMiDSN+Wx0sIifwkYWDfCIfausGCkbYeyVSHPBmtLYjnzwvKz
 VyHIw8iff1wkMjCrX8Ak1LVYQ8ZuHPLSV2JDGx25XD1FKhGT+bBDFigAD
 XwR0j4sh9KA6tkFmzKKuq+SHb1ZdIBY6XikSaIkhNEzu5gYOyHXlUXDWI
 3v/NZUbEvxBWK9PpzPA7oP8ZrkfI55c0dVGkaaH8dTtnn7syXlvbRCavc w==;
X-CSE-ConnectionGUID: Vgt3qLdERJWNv1aYon10DQ==
X-CSE-MsgGUID: LxZzH8X6QHKNxUL/RnGNzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="53719439"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="53719439"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 09:49:51 -0800
X-CSE-ConnectionGUID: n+uCkLzITFa4QqaZyF15Qw==
X-CSE-MsgGUID: MoVw1qghSPWMkkhyxLUDQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106889201"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2025 09:49:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 3 Jan 2025 09:49:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 3 Jan 2025 09:49:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 3 Jan 2025 09:49:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAnyFw/BJ6X/SJEjhCmlL37pEKQuoGYMiApOOP3dgC176AmsLxVt4Hiab587+PHMDPCdE81itSysE/6TnTsk2MN0nipzUTC7LAtSuu+hNcQJv2JoicXek5T+5Px4a9+xXQycSKuouUOU1wXfbKvISR+kiICIePd2xSmpZl4BOehTcWEYGlGxWmU+kvEAM7X2t5x2lAEx6E3zE4lc8oQicsqG0WSyk9vzj4oGD+UEemt1wEsamr07fMNsWVtmM0N6TeniHbr7yV37HgnSM1/Y7AXVkLYzeiGvNkmkOkp3thThG12QWLZ7X2Pdmwkn1iZIo/63COPlvWDXdP5+xsbVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTxS+qxMI0V8vrgvmcIxPeP0woEyb0bVATclREeIJHA=;
 b=Q661bLuDMI6+TAXbRIrJQCQU54e+BAtDjX1Q6oF7Y6nD0c02ElWKkJG3FD89VPSFYEccFIeV2Nl2oQVkhdM6xm3jKwXrK6zR6+OhrAf53XUvTUCUK3Mzo3u6/9uJmdNTNXoyIFI96kXv7+NB8Iiq259TTrLjhPe2AByWyJGrGL5j4oeSKZ5GaEdLp98Z0DE8ZJqMQY/YxUI9A5X6tJMX0DmNdnsmhi874Gqz6uXfCMZtPcrhNv+l7LykDtxSS6KXkwDb/2uq0TOpMU0RdVcZ7qJr5eHfHebBai4rKXIGIddPoCJ/e6LX6IAaqFjgj34FnMcj+wMXwi9NTEUK5vtmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB8108.namprd11.prod.outlook.com (2603:10b6:510:257::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.16; Fri, 3 Jan
 2025 17:49:43 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 17:49:42 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v1] tests/intel: Enhance the wedged_mode sysfs support
Thread-Topic: [PATCH v1] tests/intel: Enhance the wedged_mode sysfs support
Thread-Index: AQHbXd1Dg2FMt6IRjUiBW4LjQnTewrMFTHHg
Date: Fri, 3 Jan 2025 17:49:42 +0000
Message-ID: <CH0PR11MB544496982FF2CAE336147960E5152@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250103124115.765794-1-pravalika.gurram@intel.com>
In-Reply-To: <20250103124115.765794-1-pravalika.gurram@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB8108:EE_
x-ms-office365-filtering-correlation-id: 2a3ffbd6-31bd-4f7d-d957-08dd2c1f00d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nP9aEVbhQEHOGRlT8THZXGVU4W5hF6o+ZvbA/g9hIM59RDUkTK5yDVUaH0HR?=
 =?us-ascii?Q?ELCdlWdnVeYrS/YkUUYZBecMDw+ez4x5Y4jp8EXPJF6iPtkqGvJl+Vx0adIh?=
 =?us-ascii?Q?4itgeQiVc0y3hQCewI6ytMZapTTPuYGQRuKPDf6XFLswSCQ/Odnc24vreH9Y?=
 =?us-ascii?Q?GYJn5fSBOV2m8OWqhlGyg9FcTmAl+q0DDZnpS9whdBVPPwofw9i10LZqxQrD?=
 =?us-ascii?Q?hZNAhWZ66c4EYj5oK7wc7MxpxtzVKztPd3NSbEKcjeqTDNCGQM9At5Xkrfzo?=
 =?us-ascii?Q?V3Xk4rxA/R3B3vXC80FyMk2W1TZYG3WeflJjnqiq9z+CsL0n9GAyn5crhPV5?=
 =?us-ascii?Q?iAESRcPBSsOK7aqqoGMlw0SK+rWyeianIGUQudYF1F5Vs9SHuqbaIqpC15Ot?=
 =?us-ascii?Q?ZsgetYgwJ+YAGwqmG+hM00qHHP3xYvXZZF+ecb+0AB9zNwMkUTpQVAy6oify?=
 =?us-ascii?Q?W/KQG1GhGaKmUpEOoBNIwZYr97LHPaR4PiPzwlnm1QIBUdN0P3DngjswekPv?=
 =?us-ascii?Q?b/kzMBxNeG3QydFAzDg7I2WMIKg+IJsCl5hdgfBoTirFely+MvvRAqskhb2m?=
 =?us-ascii?Q?WTzOaBP151N2cH12WNQznTzHf+NRLIW+MSTbkMWDy8M+Mw7zrfCu1y9sm/E4?=
 =?us-ascii?Q?ZFHw2SJYsK9bc8Dvs/Hb9tBWiio4M7OG1EMEgz5QuBnwl6JCxU/0R1Ia3YjW?=
 =?us-ascii?Q?Dw46YWD4OB20P/nhCQR/AW01xVK5N40fkZvmuoLgl/oVOOJ49RajS3Y0iBeO?=
 =?us-ascii?Q?Mq0+9te3BjbBsFbaLys/QlZaEgXOPgeUB+47zXirdP1qnH7/njtrOjH/qyGX?=
 =?us-ascii?Q?+wWjKEd0zTgWOrIkSzTpszYVudI2ohm3LhoHzY6t1zFOXoFBedDvssBd5QBI?=
 =?us-ascii?Q?+swRIRryUi/9XohK+94N9DaIgxkMQoMbe8qd9ERdyEd/jYnGcg19vMmBxVXW?=
 =?us-ascii?Q?pE0RrXwG4xsQG6E6i/rOga2Gp8hExZ4UybYXmaJpzAUKjSu6RLUxlrD8bsZM?=
 =?us-ascii?Q?AZ1k4otpw4aYpWCPkTpjGvJLIBepRK13bNUmYLnIiSiMeSRKzEzr+VtYcPSI?=
 =?us-ascii?Q?Q4Gb5U7EgBJB6BQrCI6kS8QL9UmASwE1rhthpFSMgX3hZGUO9Nu7o/vID+nN?=
 =?us-ascii?Q?C2NirXJ87KAvNrwoCoR7fq8242kN6GSt2jcRtGooG9vEOTJuFr6EV6DhDqu1?=
 =?us-ascii?Q?WHzny0AOujj4Dni7YixRLVaceuoQgJ+QyMGcNVSQXMMwoHVLcmXqWqDwAhOr?=
 =?us-ascii?Q?BUMlIduwNl/2CWi9S772or6iR9xzd1KWUKLsf/s6l3FBerVnlibmqBqOEN0m?=
 =?us-ascii?Q?pLe6XFe8dmYXWtobyfZrXHcwtaFr8BGjDKQgDzOMf6atIZMCFezhptIRaRi+?=
 =?us-ascii?Q?oBEiKMMgNTxEN9pjDDjPoGFaoBrjYW0Be7uywWHUoaTO/7hj2GnGoApHFU5w?=
 =?us-ascii?Q?mqjVSQapI1MvidWm9Bk+d8Jh7kNkvXUP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XSIdC+i4gn6Vga9HiyDbha12l9qwaIkxvm87aNTlso9662sOb9Ms3n1D5Z91?=
 =?us-ascii?Q?X41Smp1go+GtY/srCKZan15UjJZqKeXYPWL4aw8YMds4Qh30FxNBDyaGlHOO?=
 =?us-ascii?Q?Gr/raFR6stl+07lvem336fKsP8kMX3cJTemm/NIjbyBdoCf8CzjbgkTgvu+J?=
 =?us-ascii?Q?df6JheKj7B5fIbhfqqQphZpthx9k0uzihH0VYTe1lsK+RjdYyH5175nyohOY?=
 =?us-ascii?Q?fXZdYesF0eWATmOp1xvr/xUXogN3Pp557thxW9Yp2ZoyhpV+3vjruyjjFPNb?=
 =?us-ascii?Q?TjWQ9jej4Uu2SKVccdAKNhM1KVyi+Rj04l0wg7DxZ3ShwiKJ84sRpiO5IIlg?=
 =?us-ascii?Q?KcNism77DeBa8xF4457q+WvIAUsjZybay892oj0yphOU1xYB5ofR3F6H63L2?=
 =?us-ascii?Q?RE4odi3W1TVJK+OmRDZCjd3z3T+UWgqw+I/89ezKVWv0FiXlshy+lwxXy6+u?=
 =?us-ascii?Q?SGyv8kM4P8Dm4kxNMs+2K+9xNnEXLDke7OT4HKrxsgU3N7Tp/vJwaxEABLuo?=
 =?us-ascii?Q?kQ0CGBCio7eZJo/Ve78BzpVFsUwlvk3mXAWMrt3y0KLUSkevhB7L79NtR0mM?=
 =?us-ascii?Q?+I+UaYGk7rryo8sUXbzzVCo5WwqRl4+IDnwgGA9zXHyg5rOMT3HzfFFAXeZI?=
 =?us-ascii?Q?C8iFTbjmPgMu7UV/Bd5x83C8v8b/6ZME87t1/FlRmHsGS5JncywQgjl8clOu?=
 =?us-ascii?Q?nfSp9A/yEtQthN7u/7hqf5/iAkYztHv4luumdPwSHLnu8JKcr0gl+zjFlkYd?=
 =?us-ascii?Q?80kgMxB2oe85Tg1FsUKXBMLGMCB5hHAi1mVt7M5tYrI94syyxN0V5F4R+Nm8?=
 =?us-ascii?Q?6Y663oJJGOnmIL3xAcMnzm6esovdi+ihPFD/rOSWMyC7BrI8tBqmGa18+cyr?=
 =?us-ascii?Q?8WdA8ptbgKHLqKxl3oVkvznUW+VpVhpwGKgTs3q08S7ECF6y00qjkxmuMDTA?=
 =?us-ascii?Q?JMEdWfOvJWs6BQzNUIVpPq9yH5IeEUA/wCgBnGvbpjKhYcaqWo9Z2NIFTeKn?=
 =?us-ascii?Q?p8HA/SQo+Yj6PZae20KNhJ7EasYy7E2KZ0t7LwitxM0mB2+zWlZtYJnq1XK4?=
 =?us-ascii?Q?dq1eLRZdGGpzJbMBd4OHe3RF8xjtIOKnTZgQ2PtXP23O0fEEajp1vqstmZP0?=
 =?us-ascii?Q?g4X9ZfUKt7M0ZSaSd47VIsoWhV0lIPixoKp+gH0oFEcCIP3zQvZ47gkXSf7W?=
 =?us-ascii?Q?iuttF8R+1l7WoSXiiXJxMDzdg31aBKWlapJIMrSuxiOplg+d6lhLqfq9Mi3T?=
 =?us-ascii?Q?Tozrzp8bX/4omK3lJVc5SyXkx971pi4w9IqtbhM5s0fWEtCxr3/aKqaQsuma?=
 =?us-ascii?Q?Ak7ARtS0LJs3j8y90b5M1rYuN/fnqlKcK6qLavEycYw0s9QPrmfEG0SZEFdO?=
 =?us-ascii?Q?tCndAyLa4D+ErzZE13J3AahjNCV0rFy+Jir1ErDu/nuXiQMKR1n341X81nbd?=
 =?us-ascii?Q?lCIz7TjG/0OZl1wH4W5qLq3/v9SyRzbcmCTfeaPJsESyQcOWDFNgIdL350lR?=
 =?us-ascii?Q?vsajONKHYTUI3DRRBBsyIYjf50vCPNpObeMbvpXZd832KPJ7FAdVnWQoderb?=
 =?us-ascii?Q?fdMp6p00N3qdZejp50mVy6uXSyj1LkPyLdHCITUi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3ffbd6-31bd-4f7d-d957-08dd2c1f00d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 17:49:42.6109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdTAfOtoF8NE2cXH1df1F46WBDGJKeFYbw8coiSRHMQXQOo9ePmN8dIQZE8xnHKzvSLkYZbnJsW5eCvhi9pRneb6OALK/vy3OpvE0GA+2o0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8108
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pravalik=
a Gurram
Sent: Friday, January 3, 2025 4:41 AM
To: igt-dev@lists.freedesktop.org
Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
Subject: [PATCH v1] tests/intel: Enhance the wedged_mode sysfs support
>=20
> 1. Added support to read the wedged_mode sysfs
> 2. Handle the -ETIMEDOUT return value during
> forcewake_all sysfs open
>=20
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 2 +-
>  tests/intel/xe_wedged.c  | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index bcbb5036a..3a83868ba 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -268,7 +268,7 @@ test_forcewake(int fd)
>  {
>  	int handle =3D igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
> =20
> -	igt_assert_neq(handle, -1);
> +	igt_assert_lte(0, handle);
>  	close(handle);
>  }
> =20
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 613d571b4..d4acd5f7f 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -208,6 +208,7 @@ igt_main
>  	struct drm_xe_engine_class_instance *hwe;
>  	int fd;
>  	char pci_slot[NAME_MAX];
> +	char str[150];
> =20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
> @@ -228,6 +229,7 @@ igt_main
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  		xe_for_each_engine(fd, hwe)
>  			simple_exec(fd, hwe);
> +		igt_debugfs_read(fd, "wedged_mode", str);

I don't think the system reports if this read fails.  AFAICT, while an erro=
r
value is reported and returned by igt_debugfs_simple_read in the
execution stack, the error value is not passed along any further than that,
and an error in this function otherwise does not trigger a test failure or
warning.

IMO, it would probably be for the best if we put some form of assertion her=
e.
Maybe something like:

"""
		igt_assert_f(str[0] !=3D '\0', "Failed to read wedged_mode from debugfs!\=
n");
"""

There's also an argument to be made that attempting to read wedged_mode
and asserting its existence should be handled by a separate test, but I'll =
leave
that up to your discretion.

Other than that, this change is acceptable.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  	}
> =20
>  	igt_subtest_f("wedged-at-any-timeout") {
> --=20
> 2.34.1
>=20
>=20

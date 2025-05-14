Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92746C3ABDA
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 21:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FFD10E745;
	Wed, 14 May 2025 21:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cp574Uc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3172810E745
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 21:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747259214; x=1778795214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cSmZ/bLugPEB4oo0L4F31AG6/r3JS4pv8gjlgGe7/O0=;
 b=Cp574Uc+olCoL+8N1tz4pDm8GcxHLz1P1cKNMOcEtYjfnG+glcpNEFtd
 ixHxxOk9VEliT8eu7DEeZ51gFluFuFg+iZbBvlEpq0wxEuxeVFWRm4wym
 aCeT6zTf9jyUQLSM5nrI1j/J2idpyTesChX02xFW9v7EYrv4fC964S4Hz
 hEVMvwZovcDwOmMv85QFVXG+/NixiWYtPll40wuCKNYlywsUusAGu9+mn
 r0hcoiTj6Vod4k9wkwsjSRMFH0sXh7DTmiqUT6Lc5YlVhOd3spqlIXu1p
 XRxxWVwadhyHiYO6RuYc9lsZOKJgGa2Oaim4ndGVLU6+tNOQ+U57GKr1m g==;
X-CSE-ConnectionGUID: MUqEWLdiRXasSOF3iaFyTA==
X-CSE-MsgGUID: nuL1N2BLSLKfP9pPaTMWmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59404816"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="59404816"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:46:52 -0700
X-CSE-ConnectionGUID: lw1do9NsSxqFwvjf3Zyrwg==
X-CSE-MsgGUID: LaZ4sj8VQ4yqBQy+K39BqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="169248241"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:46:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 14:46:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 14:46:50 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 14:46:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToXvzMF+lZLahGu1Ry8f5LtSi6rYoW6lZfFFYDDTKIayPdWMwbMqJPjPR5UjNqxjdIrjcNCfBhR03AerV2eKGExImFL6vYYJcdaRAPEmIrB9UkRU1qhXL8l2kybS2baTEzNWUFubCKEkuGf9OX+nnFhs4o/t7WFPm45bOpBvVKHiIPkZxFpGt6g/vIQPnVne6cT3lAdOZFNG3jqbBoaG6Cm3nuENIBqYTYQ4W7fL/+Yr1DDlR3chWOX3vYCYRCgLUdk3j/1yphCbo/iKEbr7DhN4dOxy8c7wkBiayKrLGMoivSB8LtbmkDtQNFUPQw00b6xuiY926usqTkng5oAGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhBwD75ebf7eaA+2jVpQ8WFUuGQLT3xFlW/EEjux8Ok=;
 b=qYNWpfNVkdR6ndXDtLfuD9v/ePfk5wcR0/bt2gL06v87y2mdx8Uaqpi36h4WGQodPtuaMxFPA+MpkiCS/nSYh47VR08J6WVmMzf9cD45Dej5/OKektiMk6vmkBbpaKA+//RDpf1yCZcd9k6Oz7w13h7IMHq6Iqj+OnPFObHrxa3E9y70ttlYNgkQdFlYZetuc34zpz6EI98uRnaiMUCK1iRv7WJV/zpNhFIbjcb495c/FpsecFVltFISDfCU2/SpV0uw08fOwXkZhi3mSvNUueEzdS9ok0UvfNltC3e8m4d6RRBYW90kpOVl7KhreOpuxiNYVns5afW+4a/0QmviIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM3PR11MB8757.namprd11.prod.outlook.com (2603:10b6:8:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 21:46:48 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 21:46:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate
 preftch of svm with single and multi ranges
Thread-Topic: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate
 preftch of svm with single and multi ranges
Thread-Index: AQHbxRLsZksCVNzm8k+8uMESuT77QbPSqLBg
Date: Wed, 14 May 2025 21:46:48 +0000
Message-ID: <CH0PR11MB5444D49BAD6A94AC83EF6F19E591A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250514205801.40253-1-sai.gowtham.ch@intel.com>
 <20250514205801.40253-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20250514205801.40253-3-sai.gowtham.ch@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM3PR11MB8757:EE_
x-ms-office365-filtering-correlation-id: da9f45f9-68a6-4cd9-6b20-08dd9330d415
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8diqPChL9AgxVQiK93BoT9nRUuJjaU0soU9UOoXABTJmiTHpBYSr6sAJoUjC?=
 =?us-ascii?Q?VYT1JvOPLkITLyQwB7PBCiRBb5rypxSrtimINcVqQETrAIF5DMViAhMJ21Mj?=
 =?us-ascii?Q?DY1tJ2/b7W8nwF4cSK7odOrFS5Pp6VbsV+30jMvNwMoakjUJDt3hBywZ1pcF?=
 =?us-ascii?Q?B47vJ2kxKcJ0x4rvUUOTt1wO9ssKVpp8+ESrr+K5Xk3dJFDdJBGK+atqoM2P?=
 =?us-ascii?Q?PFgCdPrHhsrOlKSgczui/5/nnIOaNgOm6rc7dUPilwReHc2ZhyqQLY7muWFm?=
 =?us-ascii?Q?PpBMtGYE4a/AWzqL0e43m0j37icJgsIPGO2AO72GHinjJNYF/sTrp690RlY0?=
 =?us-ascii?Q?l7F6mKVb/TgJVSc3OuiCldC7GtFP5YkIOuxVbVMKyzcbmBfQ3xtsKF6ygueE?=
 =?us-ascii?Q?4VT/PRUfLDXb2juVNDeiJ+XO+VGNKUSYoSmC3rd8+p7Q6cZGIsRc9waBMsAZ?=
 =?us-ascii?Q?ltW4Df91J0TA2Vd8kQcdxyUwuH0f9fk8V6AvZSdHOaY7hsxhy7uebzz5KdIj?=
 =?us-ascii?Q?HPzV5rEajipW3qpVUgq5R7KISvE6NhK4aou9SpBrzTm7OS9dN0IlF3cMgMAk?=
 =?us-ascii?Q?VJ6rsQbQFACnZ8Xj/zfoeQOfGjosdBqr1tjS1zHxvg0USAaT7HdvLI14no4A?=
 =?us-ascii?Q?QploHFnGxKnxnIb0S9ylyN4kCikfkK9wKZjt3GOgBpnU5yQjgFGmjoIjlV7x?=
 =?us-ascii?Q?yboOqffl2PgABojIboXYI1K2flPJ094FmVxbz0y0NOZg2j4WrpSgViEk/G2b?=
 =?us-ascii?Q?xtiDcYM+n3ppdjwTEsNxo5+5dwReL9tBELe2QZr2KLUOs+SOY0GpAizKPEaR?=
 =?us-ascii?Q?Nhy8v7VmdEfZyZtZ/Sv9J4Zk/u0XSjevUtj1ihqtw+97urZ/DbXO5coS1Psr?=
 =?us-ascii?Q?SApGmezUWVp50lo3OIuGZo4GwWghDJfxtdvu/Ns4Muphl5HmSGqVTeVbeDO4?=
 =?us-ascii?Q?J32ZCcxBVTY9Yg6J0QXJCgqtZRrGn6CwmCE+6BZlhbw0cEHkhZnWzzt2dPrb?=
 =?us-ascii?Q?OISB66xtjT/xuBj7PsRUC45eMTueXoLmoQuqWosU1VAzYMfrjrvTTsKbtbHZ?=
 =?us-ascii?Q?AADYTSl7Xfi25yTX5G0LtbqIlgmrR/8KvndE3dK0aVV/ltA3J1V836wCup2f?=
 =?us-ascii?Q?w5Uei9neynlXLoTxyQXQQ07h//IanUmZMnPGBCz72czRnJzavntK8ABPrjmJ?=
 =?us-ascii?Q?siw//icVvuwXglR1+NZN3wwlGWLSPazZ2+1zxOVEvvNxMbEH+RdmN0aTNTp5?=
 =?us-ascii?Q?EofUXEO2kcO0eFcSBuXRTIAYpsAG5oRnhJrwVzpOe7qjEFCt8Z3wWOaXV7y6?=
 =?us-ascii?Q?KrM9UJojNJ6qyTzZpa2zlKku/W0jtjAY8Z8OdyaVjWc8NEFY2+oaVUorXO6H?=
 =?us-ascii?Q?ddmzknozLenIuTLWmkB1NdjCb+Nay+BcPqQ7cwqFyLhBKe7ZdypzS/wjLNZ8?=
 =?us-ascii?Q?TBHPBlROqn3UZ1/3CfDjVKpkriNn0DEJKpVzGXvu7TFDSLruAZAYyOFC1lqw?=
 =?us-ascii?Q?nO1npKcVFLbLIAI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NELxU/FDZTOz/fX1grTTpaKJ5f+/JjNMXvNi9z2gF6nOKVPkUoszUF16h+3B?=
 =?us-ascii?Q?akhM7RXqCkvJiYxjciBA119orlR3m1RHGa4Lc/0KTFzyqwf3/+wZLt95Ah9H?=
 =?us-ascii?Q?NeMpJjTN+pHnJqQecqhHFX3jXVon5BZdcq6rr34/q45I6YlYsR80ToBtk2GP?=
 =?us-ascii?Q?cK+zgytN44F381AP3VrYGrQnqAYeq3obYlbdIhg1/eoFRS/MQ/9aFWJeWSKw?=
 =?us-ascii?Q?maZc73UZgUYKHIzrFuW9KuCsoliXGUm19PndqAg91nDxbzag+di/fe7F6afo?=
 =?us-ascii?Q?AdOi+pQnHNOXPUJCOKtRbtJVlqAtTod8p0ZFpbd9jHct6sb/+r8/CQqQrYYg?=
 =?us-ascii?Q?gRpLuIHd0nHzUSvBhRbrvDLpMZHAbWghYi4kufsiLqijYwFwApZR+acZBKlO?=
 =?us-ascii?Q?4cqQu04lLsvx2WLnzzFZ4aOiwDNi71+hnUSzfSBH0u7rap8hkxnWhfgSdMOD?=
 =?us-ascii?Q?0WVTWtaS+OvjCAbVGWl+yZXGpLwxjd/eICLWJ+R/EXL420cb9Se6JgSx2xu6?=
 =?us-ascii?Q?AeV5zIGcfD6fOmpR0KQOkXukrbh70xlP0A9fS1wqXvx6s67o+dmNaRZb22uR?=
 =?us-ascii?Q?WSGIKLQDEKW16kWhglqJ5iMElbalin6tlL/y4qM6KQBr8+SzkoWuV/Nb14uG?=
 =?us-ascii?Q?lzBDyUxqOcCBGGuxHQALRA0GMzjNiGeTcB7UPYsqMStIxPJssf+PAXxoHmRa?=
 =?us-ascii?Q?39VRn16KzPNNRgTvzyW2VDKKEUtwfMWCL6r8xLGmhWr8ChxQX/kGlZ5ljpcI?=
 =?us-ascii?Q?Jx0Xy59J3O5EKCymRj9dXgVxHkE6uwGz8QxGROiqygP49wuu51VGiliUc1aW?=
 =?us-ascii?Q?UrlfAIUBf7A+r2W5YnBIjJxl/Vw49QBG/py+SX9F7rV79zWiZqwxaoB0w76d?=
 =?us-ascii?Q?uJIgKtBuX5Jo3IC+ys1XXVT7frD5liyEQpRm2OFKBDeqXTmxtrYACbtlvDvO?=
 =?us-ascii?Q?K/TT5Xz/79yAChDd0XABMPRgCiKnjhyfmABCWnYvUmQaJMCcmJbogpj3D5DJ?=
 =?us-ascii?Q?zZV3t1nMoaXB101inFdO7eX4zycv3zB+u/lRWNvzpn9SZyuZPTwJQkTnTrrs?=
 =?us-ascii?Q?NWKNlE5e17HHnZ+ymUPMjNWpHk874EwGZsO56dVasepP5hKJlWNGEkJaxn+j?=
 =?us-ascii?Q?UTe/vYMPDF2+Q+HqsvLm8nogG+p1GnP6t8YJbOlvIVXORGJsYG0PHa1+DFh+?=
 =?us-ascii?Q?0FVDorfzfC36Mq5tw+9Argkut0xTIDG+N/7bylrcuBvZEjTaSIR1twn82JTg?=
 =?us-ascii?Q?FRU5xngQJ9z48R/JpPYpcDO/3vXYH5j8vihOzZi8gvXu1UoiR4ps2RzE9UZk?=
 =?us-ascii?Q?5kfvkSJgB8DVt6pRV0H7F6ot0gDMKaEC/pUnjPo3n/rrmcAHI5LDn8Av+eqY?=
 =?us-ascii?Q?fyLGLvcS1h+AYGVW6/oqSuG+4mJFc/uWnyuk/GtHlT+F/7YcywCp5Q+384kI?=
 =?us-ascii?Q?IhdNyU0cJsnP8ci++m4lL7UGz9SmDzd+GLK39yA5jO5esolCPMw0GsSsDM3y?=
 =?us-ascii?Q?0lnlo4NDvI4cMkQSjL2VUBKAaMR4ySM3yFY6wYKk5oFZ1DSM66sRxOJ6p0Cv?=
 =?us-ascii?Q?E/DkkyVk5rIk7svNoWzRA9IpsfIDb548HJHUIXgv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9f45f9-68a6-4cd9-6b20-08dd9330d415
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 21:46:48.1956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0R0mV07j+EAg03F8Dsh4X773cvgEf9RC/0ms9wp3J5xQb5dVkCt6LhNyc9DdLiz9lCUz3T/8auxYKQCTp2OxF/7WfmetMbF5/NVU5baguhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8757
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
From: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>=20
Sent: Wednesday, May 14, 2025 1:58 PM
To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham <sai.gowtham.ch@intel.co=
m>; Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthe=
w <matthew.brost@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate preftch=
 of svm with single and multi ranges
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Tests validates Prefetch of SVM with single range and multiple ranges, wi=
th different
> range of sizes. checks if not svm pagefaults are seen while prefetching t=
he ranges of
> svm.
> v2: Enhance test to utilize smem/vram flags from the selection loop (Jona=
than Cavitt)
>=20
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

No additional notes:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_exec_system_allocator.c | 121 +++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec=
_system_allocator.c
> index 68bf29898..d4f2e8d98 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -20,6 +20,7 @@
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
> +#include "xe/xe_gt.c"
> =20
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -139,6 +140,7 @@ static void signal_pdata(struct process_data *pdata)
>  #define CPU_FAULT_THREADS	(0x1 << 2)
>  #define CPU_FAULT_PROCESS	(0x1 << 3)
>  #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
> +#define VRAM			(0x1 << 5)
> =20
>  static void process_check(void *ptr, uint64_t alloc_size, uint64_t strid=
e,
>  			  unsigned int flags)
> @@ -464,6 +466,101 @@ static void test_basic(int fd, struct drm_xe_engine=
_class_instance *eci,
>  	xe_exec_queue_destroy(fd, exec_queues);
>  	xe_vm_destroy(fd, vm);
>  }
> +
> +/**
> + * SUBTEST: prefetch-%s
> + * Description: Test to validate functionality of Prefetch of SVM %arg[1=
]
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-%s
> + * Description: Multi range Prefetch of SVM %arg[1] and  check if multip=
le ranges are created
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @smem-SZ_4K: with size of SZ_4K on smem region
> + * @smem-SZ_64K: with size of SZ_64K on smem region
> + * @smem-SZ_2M: with size of SZ_2M on smem region
> + * @vram-SZ_4K: with size of SZ_4K on vram region
> + * @vram-SZ_64K: with size of SZ_64K on vram region
> + * @vram-SZ_2M: with size of SZ_2M on vram region
> + */
> +#define MAX_BATCH_DWORDS 16
> +static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
> +		     size_t bo_size, unsigned int flags, int num_dwords)
> +{
> +	struct batch_data *data;
> +	uint64_t target_addr;
> +	uint64_t addr;
> +	u64 *exec_ufence =3D NULL;
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D DRM_XE_SYNC_FLAG_S=
IGNAL,
> +		  .timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(sync),
> +	};
> +	size_t slice_size =3D bo_size;
> +	uint64_t batch_addr;
> +	uint32_t exec_queues, expected, vm, *result_ptr, *batch;
> +	size_t aligned_size =3D bo_size ?: xe_get_default_alignment(fd);
> +	const char *stat =3D "svm_pagefault_count";
> +	int b, svm_pf_count_pre, svm_pf_count_pos;
> +
> +	bo_size =3D bo_size * num_dwords;
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREAT=
E_FLAG_FAULT_MODE, 0);
> +	data =3D aligned_alloc(aligned_size, bo_size);
> +	memset(data, 0, bo_size);
> +	addr =3D to_user_pointer(data);
> +
> +	exec_queues =3D xe_exec_queue_create(fd, vm, eci, 0);
> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	bind_system_allocator(sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC)=
;
> +	data[0].vm_sync =3D 0;
> +	exec_ufence =3D mmap(NULL, SZ_4K, PROT_READ |
> +				 PROT_WRITE, MAP_SHARED |
> +				 MAP_ANONYMOUS, -1, 0);
> +	igt_assert(exec_ufence !=3D MAP_FAILED);
> +	memset(exec_ufence, 0, SZ_4K);
> +
> +	for (int i =3D 0; i < num_dwords; i++) {
> +		batch =3D (uint32_t *)((uint8_t *)data + i * slice_size);
> +		target_addr =3D addr + i * slice_size + 0x100;
> +		b =3D 0;
> +
> +		igt_assert(b + 5 <=3D MAX_BATCH_DWORDS);
> +		write_dword(batch, target_addr, 0xDEADBEEF + i, &b);
> +	}
> +	sync[0].addr =3D to_user_pointer(exec_ufence);
> +	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM=
 ? 1 : 0);
> +	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	exec.exec_queue_id =3D exec_queues;
> +
> +	for (int i =3D 0; i < num_dwords; i++) {
> +		result_ptr =3D (uint32_t *)((uint8_t *)data + i * slice_size + 0x100);
> +		expected =3D 0xDEADBEEF + i;
> +
> +		svm_pf_count_pre =3D xe_gt_stats_get_count(fd, eci->gt_id, stat);
> +		batch_addr =3D addr + i * slice_size;
> +		exec.address =3D batch_addr;
> +		exec_ufence[0] =3D 0;
> +		sync[0].addr =3D to_user_pointer(exec_ufence);
> +		xe_exec(fd, &exec);
> +		svm_pf_count_pos =3D xe_gt_stats_get_count(fd, eci->gt_id, stat);
> +		igt_assert(svm_pf_count_pre =3D=3D svm_pf_count_pos);
> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queues, NSEC_PE=
R_SEC);
> +		exec_ufence[0] =3D 0;
> +		igt_assert_eq(*result_ptr, expected);
> +	}
> +	xe_exec_queue_destroy(fd, exec_queues);
> +	unbind_system_allocator();
> +	munmap(data, bo_size);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: unaligned-alloc
>   * Description: allocate unaligned sizes of memory
> @@ -1657,6 +1754,20 @@ struct section {
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> +	const struct mode {
> +		const char *name;
> +		unsigned int flags;
> +		size_t size;
> +	} mode[] =3D {
> +		{ "smem-SZ_4K", 0, SZ_4K},
> +		{ "smem-SZ_64K", 0, SZ_64K},
> +		{ "smem-SZ_2M", 0, SZ_2M},
> +		{ "vram-SZ_4K", VRAM, SZ_4K},
> +		{ "vram-SZ_64K", VRAM, SZ_64K},
> +		{ "vram-SZ_2M", VRAM, SZ_2M},
> +		{},
> +	}, *m;
> +
>  	const struct section sections[] =3D {
>  		{ "malloc", 0 },
>  		{ "malloc-multi-fault", MULTI_FAULT },
> @@ -1930,6 +2041,16 @@ igt_main
>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>  	}
> =20
> +	for (m =3D mode; m->name; m++) {
> +		igt_subtest_f("prefetch-%s", m->name)
> +			xe_for_each_engine(fd, hwe)
> +				prefetch(fd, hwe, m->size, m->flags, 1);
> +
> +		igt_subtest_f("multi-range-%s", m->name)
> +			xe_for_each_engine(fd, hwe)
> +				prefetch(fd, hwe, m->size, m->flags, 10);
> +	}
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		drm_close_driver(fd);
> --=20
> 2.34.1
>=20
>=20

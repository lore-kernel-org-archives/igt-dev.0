Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F99CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 14:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5843410EBE4;
	Fri, 29 Aug 2025 14:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxlyaRGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7698610EBE9
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 14:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756478263; x=1788014263;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BcGSYRQXYgKzNT9r1jbB7rngWhgzdpRxIuXTjyEKO6g=;
 b=cxlyaRGj2haPAUxuA2gYR75PnzZMiWb4a+zAAxAePCm3RJymRbTsj9LD
 Ebw6Y+pSlpmLdTWiPX7hjXVwPazjkkT21E+vx0OVFBM0NP8ssL7O+FNCP
 DgjYf42VX9N5+h5JKaG4bjD7JPloS9fzS9ZXnv4QbeIth5+uzqDty6kZI
 E6/c6wYrRfT3Sz7mAR9lYgg5gyu5tmhGIIz5D8KIvKcvfh4PaKu+jVBbq
 3HHoZC2xyfzwtz+UnNxH0YK7IAt02xpT4OZcECiWQafpLwWehNE54myBk
 LCPtV8Rte+tkNoSNOCfKNJQJMS/bXeC38elzg+N2PgHCadJ16+kWDYFC5 w==;
X-CSE-ConnectionGUID: 494eGvouRQer9Oi1q9ghnw==
X-CSE-MsgGUID: Ck4mmBDmQambG5mnCZVOHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58709257"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58709257"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:37:43 -0700
X-CSE-ConnectionGUID: IC7w8DMnQb2/EFjY8CxVNQ==
X-CSE-MsgGUID: 4dbt3x/hQVGGiY/XIYLCZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169651749"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:37:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:37:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 07:37:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.87)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:37:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVvLFj9VO5/5MT1Yi18ZNgnpuSwzwS+zlPiWZ2ManfrSuWrBzA0HJ9U7tqoAWSFP1kYwJCgjBsemSS4WuVNRtyODu0ib/J+NkcQEUBLl/GzdAiq3XbOCopo7bCvnRxd532dffxDxVuQ/dXqES5JqERRaJJGs7k+WWvs+Ys92HAdf0fPtvcgsnImv+BqLrSYNMpUUNNggLCotGKAxqLXZbD82OVewJGFsmon+k8BV0/7CZtYRtsykE7QAz065T7TDCPzYzPVta/qhKD6Xbu5qmR7/+yh8jwzomyAwsgHuSoSMxt2aVPxbkIZ9QuQzKZPR35z3Xu/ixZQQtR+3vLz9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pcm3CI9ubQHBO7y/a977s54cR/Va6zwUO4z6vS1+BVo=;
 b=oJUexX/uxrke8U5B8RO1P+gc2LWt+sP3b8qTOHYvZqU0FfrkJpuIxkTcS4nW7oauOtvBn2VFYAJGZgI5N6o0LQ+DdYlktsLyU8NY66Aa6J0esEK/2hzZlIXG0PvBETcoYcjltdWkTBCY6aJx5uCgSw3RLyp1GO+r5O3oowut0GLjTbRRg8K30lY3StfvwdzIn/IEmm6xGJR/zZLhFZRiJO8pViAebF6buaCVX23SMiQVELxG2GkKWbKcxudhUswcHrrvk1r5FZX1XoTPotwnYK8ycXcxYMZ+Yq52JMkwcXZSOIYfCQmrq3PmumPvVMeUQiSRgwKpfcD5+TxI/e2gcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 by PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 14:37:34 +0000
Received: from BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c]) by BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c%6]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 14:37:34 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t v5 5/5] tests/intel/xe_exec_system_allocator: Add
 atomic_batch test in IGT
Thread-Topic: [PATCH i-g-t v5 5/5] tests/intel/xe_exec_system_allocator: Add
 atomic_batch test in IGT
Thread-Index: AQHcGD0DPD5/nSJn+UyehfpE+BoD/bR5sBvg
Date: Fri, 29 Aug 2025 14:37:34 +0000
Message-ID: <BN9PR11MB55297212D01AF28BFCD96B75843AA@BN9PR11MB5529.namprd11.prod.outlook.com>
References: <20250828165817.97661-1-nishit.sharma@intel.com>
 <20250828165817.97661-6-nishit.sharma@intel.com>
In-Reply-To: <20250828165817.97661-6-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5529:EE_|PH7PR11MB8551:EE_
x-ms-office365-filtering-correlation-id: cb8280e1-ddb9-4af5-caec-08dde70997d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?zTFF2fCDx9T5YfTpaMPmZUm5DiZKDErcjPZRTHEsT/uGVlb+PQSNUO+APN?=
 =?iso-8859-1?Q?gJdWR/Merfm7qNbfhpe9uLOt1HmKK0n0NyPZhnqIC9R1MHyOnVXlG7NtVF?=
 =?iso-8859-1?Q?2TbZGaQYWODHiV3dmTKeTYcFy5It0JBOAjN6M9wvCW6QkbJVhAaENHZwCR?=
 =?iso-8859-1?Q?SVU0yRZtMMjuisuyFiIrgwH8xwSJKpQusNbhB2GZjIVZdVD74HWz/czYX7?=
 =?iso-8859-1?Q?4Tdrynzw+FX0FAPFkSnwlpgAQx7KAyqmkl1m+fw6ZecrOj0su6EWGfi7CE?=
 =?iso-8859-1?Q?ULOs8eAJO3uKPZrlcyVVEuChT+1P9iWZZ//FN1GBzqply/djINuZ0e22LD?=
 =?iso-8859-1?Q?JpNCp7cNehJxqtvYcb6XdKxUSTfolOmPYxgK3O4wiJqRYwixFrc1krasvq?=
 =?iso-8859-1?Q?ff7k66nGHr83izBeexBIZm/+FpkTyYERsWRSwluo0vf2FdzlWmSmmNnP/q?=
 =?iso-8859-1?Q?FFjV9FjpVluShnzmI8yOwdXtUNiuYBHSiy+M2WALm6mzPSEWHblKE5ZqnJ?=
 =?iso-8859-1?Q?pSV+xZph0kOsl3xtdEXquVSe7a/SfsSjp+tGU3dqKGcsgVu7NZ/BywjG8Q?=
 =?iso-8859-1?Q?GL+UXBIgAAsmBu4Nn/JrlWw2fdgIN0C0i1OitkrqKuXp+pWP5sP/fNUvRp?=
 =?iso-8859-1?Q?CfTvhvXl6utveUYax+LGIAVyDBCb1ItAHi2VxOnzRqLyvaIh3T5ovrXSki?=
 =?iso-8859-1?Q?ZhK5u9I1mCO7VmqalxSv7csTDSTyPVtcytHb6pgPDvLI5UrQy1Gmz5OyGF?=
 =?iso-8859-1?Q?8oVnPxBEQtE6yOWWRi2HpkxWjBNsjuB0sLG23SVjHX6K2VZXDP+4bHa7Cs?=
 =?iso-8859-1?Q?drTHXP3HQd05uVzOhilD/VOliBfDTRE0obJrcuc9EnlrnijGB/pGjUsn0X?=
 =?iso-8859-1?Q?26njopusT/apc1MAzxI2/v/W/33dLEEIguSwJjrAhea07Zsz0JOfXw5jjb?=
 =?iso-8859-1?Q?Hsoc1GQcYBpxwgHs6bWds88cWkaCP+s/x2vaVZk97Ea5fiThYOZf405L/9?=
 =?iso-8859-1?Q?iYl78x0HrabivXxXWZq7zHHXmUtLunkZqHajmZjXNJaj4UnoWd5p2N69Ep?=
 =?iso-8859-1?Q?/jSzpfGmld2I/GMO6NVx0YHLVhvtJmwYLq608apfH7pwjhncWt+x79QIWm?=
 =?iso-8859-1?Q?iqDcPWUIN41z27WRTUdG/huV8sBM4qkVq7lQOP51F8lvhflI+a7hSF0hH8?=
 =?iso-8859-1?Q?orVKCqfEVUBoQqX1/PCtXDblFAP5Ab2ETMczjpBMSe+Ay2egxPHnxz4L4u?=
 =?iso-8859-1?Q?ukBNzKkZRC3dy6xOV818pXrzGnwyvuHOz8/XSPURMNNXSCiQWd8nJjq24W?=
 =?iso-8859-1?Q?IVdz+7K68WL9YrPpqX5Z5tLqsqB9ax/8Qo9hTSxaSbtWUfI3Xwcv3dNRyB?=
 =?iso-8859-1?Q?n57s2JXqUWAQauZ1QDLCARQx6i/SNyn+GBNt6BR5a1nU92ZfFQGjZuFOJg?=
 =?iso-8859-1?Q?STb83vjaKZF9Vr3luIRdNVmMjU2WNddSznvZf9AnTsC3g8JIpBaYiWbc0p?=
 =?iso-8859-1?Q?DTzD0Oif30QUlGcbIKlwEZcYqvxIZ/ECeFGwwUvocowg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TcHqyxjLxU1KSPbma2kb83SC8/lwREzpK3hvzRisIxeUEledvAOpjJmgsh?=
 =?iso-8859-1?Q?GcSDHVtjEh5YuCHElJ7EdKHuqp0ewl2g1e51eGYd3h5u0TPC8j3LHhPEnv?=
 =?iso-8859-1?Q?1kgyltz6Lt/o7tFe72H3AJdOFFttaT1li+hY2ndMsWnKb+FlQTcDL5yO/C?=
 =?iso-8859-1?Q?AE9KkDY5+v49Ww7oGNLdTfKYBua4Y9b/+zdaVtqfWlcfLxSzSXk4SJljVY?=
 =?iso-8859-1?Q?zudolvJSV/o6cVC71c1IrchBblET++AaNYn0717O2sYbFR6MmGsObH8OlL?=
 =?iso-8859-1?Q?TetRD4t18NuDx+JhVh0Ivmi0sQEmks+xgWa2HI+/u2nkrZPoxq7y5IAZCB?=
 =?iso-8859-1?Q?J3Lwl9IlI/kJIUcnRpCLT3bmkEMHGELXQXbSoC1MCvxPS32YdSWCn0/yXN?=
 =?iso-8859-1?Q?KRfVL2k78O7XAzHHWnQK37cKfeLIf7Rj0HvwKZqzZX2qxcoWWnpPEUCbtW?=
 =?iso-8859-1?Q?tu+HKQph1TGevzrdru8pMz1L8HkuSSNuT5/pJTl5tDISbabMTWjRxIToYb?=
 =?iso-8859-1?Q?5HX7fYya28JMuXE2yvHSl++/94/MMp1l2n9ixYIbr1kL6nw5xk63CKpRgB?=
 =?iso-8859-1?Q?+Q7RT2EdaViCY7TMROC7E2bZuW1k/oAEu01/BWYTVRrtw0pshRtfGe6N46?=
 =?iso-8859-1?Q?QaTQPovOJ57Zh4GB3Wj1kqPi9VLLGmRA/jZeX99s88dc7hIqupA66NRD9m?=
 =?iso-8859-1?Q?c6LCXhkl2fsxZyLmvRLoG2uGqCcNzt6230ExuVTva9L953zgvxRAV3cjBe?=
 =?iso-8859-1?Q?BCnFtujJpfeubjKOJjq4bEEL+NUKeNwbDoiW5Dqxhp5U3Mgv42gOAZ7wNU?=
 =?iso-8859-1?Q?z3RMVDRjHjVQYSdY8OATcRjVuNRoExCBwPMhRHYtK3mKnsFLUVUPHZh0+p?=
 =?iso-8859-1?Q?EOIrAgthV+tO/O3HM5SKf2lXzrL1Oq6ydwcRO6bLhVux3nHI9R6N4uzAVA?=
 =?iso-8859-1?Q?mSR9QvQ/bkT4LJ8Wo+x/mOkZ9Dy2jS+tPhZBF8UHGXmRuIfb84uL0uJXuo?=
 =?iso-8859-1?Q?fX3IN8r+CZWsspWqk6Le7sZwc498dubeWnu6QPHBCDxWKaXp1tHjF1ejVh?=
 =?iso-8859-1?Q?cLYumk+KVEJvMQl+fcuLcwB0ENc+NwVGrduQrPw9iNunBgGnF9I65NnX+2?=
 =?iso-8859-1?Q?PUNrpkZeymEqIScdFuIoRn2ouVQ2Ptu71MnsEV4+e7dulcRxiBkmKoJOPe?=
 =?iso-8859-1?Q?X5UMDechPKK2qV8Nzp/AgVZDPuVPRHY+OAohSzrwyjXlX4vzNbYYM95ekG?=
 =?iso-8859-1?Q?A9uEtE1D2rPjpNffjzPGancPQ7wjA3PxNc+ysmKJAJRhyz06sqsJ8Uvrdj?=
 =?iso-8859-1?Q?hNJl2oFJPXIM5gej4XvpfD5jyqfnx0pPQYftHOgenunoef9p8BKj0waoau?=
 =?iso-8859-1?Q?qgboXN7jVAadEJWo2OL2xsrmHd7GbA/EyUGXiJQDfzz5p8LKzRat6rViOx?=
 =?iso-8859-1?Q?mFlnmFfGbBgQd8bzmexbV9AHVp3WW8u7xz1xmu5OCdIsTJBppwZYX/3UdA?=
 =?iso-8859-1?Q?N6Es3xiWev9vWK7GF/8okRffdZ52nS7dTHzpsWTtk0eEfdS1VjkQhemkSb?=
 =?iso-8859-1?Q?XKh1ASXeSh2maKTT1VvKxTnb/e+LMRm9me+awnLsSSJ6bSMKdBBWzPAh4X?=
 =?iso-8859-1?Q?OMYaB7DJ3Kp0aRTXQSN1zVBW3gbcYDFCmT?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8280e1-ddb9-4af5-caec-08dde70997d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 14:37:34.4129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVTmaC+l0dmj8c5UQY0JMppEAnaFjWeNts+DKodT4dkuroFIH9HbzzYnTM19VikgjXIhZ5rvzeKq2uD9/TkTmkB1zm71Ht4dAbolBw0ppyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Thursday, August 28, 2025 10:28 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t v5 5/5] tests/intel/xe_exec_system_allocator: Add
> atomic_batch test in IGT
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> ATOMIC_BATCH flag is introduced when true MI_ATOMIC | MI_ATOMIC_INC
> operation will be called. This will avoid writing another function which =
performs
> atomic increment operations. ATOMIC_BATCH flag is passed as argument in
> write_dword() if true then value will be written on passed address and
> incremented by ATOMIC_INC operation. For all memory operations this flag =
will
> be used to verify if ATOMIC operation is working or not.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c                      |  18 +-
>  tests/intel/xe_exec_system_allocator.c | 545 ++++++++++++++++++++-----
>  2 files changed, 445 insertions(+), 118 deletions(-)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index 4ab2ef39c..71a42=
7b4d
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -688,19 +688,26 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t
> addr, uint64_t range,
>  	madvise.start =3D addr;
>  	madvise.range =3D range;
>=20
> -	if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> +	switch (type) {
> +	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
>  		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_ATOMIC;
>  		madvise.atomic.val =3D op_val;
> -	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
> +		break;
> +
> +	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
>  		madvise.type =3D
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC;
>  		madvise.preferred_mem_loc.devmem_fd =3D op_val;
>  		madvise.preferred_mem_loc.migration_policy =3D policy;
>  		igt_debug("madvise.preferred_mem_loc.devmem_fd =3D %d\n",
>  			  madvise.preferred_mem_loc.devmem_fd);
> -	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
> +		break;
> +
> +	case DRM_XE_MEM_RANGE_ATTR_PAT:
>  		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_PAT;
>  		madvise.pat_index.val =3D op_val;
> -	} else {
> +		break;
> +
> +	default:
>  		igt_warn("Unknown attribute\n");
>  		return -EINVAL;
>  	}
Please move these changes to the lib changes

> @@ -730,6 +737,5 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t add=
r,
> uint64_t range,  int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, ui=
nt64_t
> range,
>  		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)  {
> -	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val,
> policy), 0);
> -	return 0;
> +	return __xe_vm_madvise(fd, vm, addr, range, ext, type, op_val,
> +policy);
>  }
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index 70ca5fc2e..d0a8431a2 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -21,6 +21,7 @@
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
>=20
> +#include "intel_pat.h"
>  #include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -29,6 +30,14 @@
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  #define QUARTER_SEC		(NSEC_PER_SEC / 4)
>  #define FIVE_SEC		(5LL * NSEC_PER_SEC)
Space here
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +};
>=20
>  struct batch_data {
>  	uint32_t batch[16];
> @@ -37,6 +46,7 @@ struct batch_data {
>  	uint32_t expected_data;
>  };
>=20
> +#define VAL_ATOMIC_EXPECTED  56
>  #define WRITE_VALUE(data__, i__)	({			\
>  	if (!(data__)->expected_data)				\
>  		(data__)->expected_data =3D rand() << 12 | (i__);	\
> @@ -53,10 +63,19 @@ static void __write_dword(uint32_t *batch, uint64_t
> sdi_addr, uint32_t wdata,
>  	batch[(*idx)++] =3D wdata;
>  }
>=20
> -static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wda=
ta,
> -			int *idx)
> +static void write_dword(struct test_exec_data *data, uint64_t sdi_addr,
> uint32_t wdata,
> +			int *idx, bool atomic)
>  {
> -	__write_dword(batch, sdi_addr, wdata, idx);
> +	uint32_t *batch =3D data->batch;
> +
> +	if (atomic) {
> +		data->data =3D 55;
> +		batch[(*idx)++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +		batch[(*idx)++] =3D sdi_addr;
> +		batch[(*idx)++] =3D sdi_addr >> 32;
> +	} else {
> +		__write_dword(batch, sdi_addr, wdata, idx);
> +	}
>  	batch[(*idx)++] =3D MI_BATCH_BUFFER_END;  }
>=20
> @@ -271,7 +290,7 @@ check_all_pages_threads(void *ptr, uint64_t alloc_siz=
e,
> uint64_t stride,
>=20
>  static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
>  			    uint64_t alloc_size, uint64_t stride,
> -			    struct timespec *tv, uint64_t *submit)
> +			    struct timespec *tv, uint64_t *submit, bool atomic)
>  {
>  	struct drm_xe_sync sync[1] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, @@ -302,7
> +321,8 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *=
ptr,
>  		uint64_t sdi_addr =3D addr + sdi_offset;
>  		int b =3D 0;
>=20
> -		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i),
> &b);
> +		write_dword((struct test_exec_data *)data, sdi_addr,
> WRITE_VALUE(data, i),
> +			     &b, atomic ? true : false);
>  		igt_assert(b <=3D ARRAY_SIZE(data->batch));
>  	}
>=20
> @@ -407,34 +427,45 @@ static void __aligned_partial_free(struct
> aligned_alloc_type  *aligned_alloc_typ
>=20
>  #define MAX_N_EXEC_QUEUES       16
>=20
> -#define MMAP                    (0x1 << 0)
> -#define NEW                     (0x1 << 1)
> -#define BO_UNMAP                (0x1 << 2)
> -#define FREE                    (0x1 << 3)
> -#define BUSY                    (0x1 << 4)
> -#define BO_MAP                  (0x1 << 5)
> -#define RACE                    (0x1 << 6)
> -#define SKIP_MEMSET             (0x1 << 7)
> -#define FAULT                   (0x1 << 8)
> -#define FILE_BACKED             (0x1 << 9)
> -#define LOCK                    (0x1 << 10)
> -#define MMAP_SHARED             (0x1 << 11)
> -#define HUGE_PAGE               (0x1 << 12)
> -#define SHARED_ALLOC            (0x1 << 13)
> -#define FORK_READ               (0x1 << 14)
> -#define FORK_READ_AFTER         (0x1 << 15)
> -#define MREMAP                  (0x1 << 16)
> -#define DONTUNMAP               (0x1 << 17)
> -#define READ_ONLY_REMAP         (0x1 << 18)
> -#define SYNC_EXEC               (0x1 << 19)
> -#define EVERY_OTHER_CHECK       (0x1 << 20)
> -#define MULTI_FAULT             (0x1 << 21)
> -#define PREFETCH                (0x1 << 22)
> -#define THREADS                 (0x1 << 23)
> -#define PROCESSES               (0x1 << 24)
> -#define PREFETCH_BENCHMARK      (0x1 << 25)
> -#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> -#define PREFERRED_LOC_SMEM      (0x1 << 27)
> +#define MMAP				(0x1 << 0)
> +#define NEW				(0x1 << 1)
> +#define BO_UNMAP			(0x1 << 2)
> +#define FREE				(0x1 << 3)
> +#define BUSY				(0x1 << 4)
> +#define BO_MAP				(0x1 << 5)
> +#define RACE				(0x1 << 6)
> +#define SKIP_MEMSET			(0x1 << 7)
> +#define FAULT				(0x1 << 8)
> +#define FILE_BACKED			(0x1 << 9)
> +#define LOCK				(0x1 << 10)
> +#define MMAP_SHARED			(0x1 << 11)
> +#define HUGE_PAGE			(0x1 << 12)
> +#define SHARED_ALLOC			(0x1 << 13)
> +#define FORK_READ			(0x1 << 14)
> +#define FORK_READ_AFTER			(0x1 << 15)
> +#define MREMAP				(0x1 << 16)
> +#define DONTUNMAP			(0x1 << 17)
> +#define READ_ONLY_REMAP			(0x1 << 18)
> +#define SYNC_EXEC			(0x1 << 19)
> +#define EVERY_OTHER_CHECK		(0x1 << 20)
> +#define MULTI_FAULT			(0x1 << 21)
> +#define PREFETCH			(0x1 << 22)
> +#define THREADS				(0x1 << 23)
> +#define PROCESSES			(0x1 << 24)
> +#define PREFETCH_BENCHMARK		(0x1 << 25)
> +#define PREFETCH_SYS_BENCHMARK		(0x1 << 26)
> +#define PREFERRED_LOC_SMEM		(0x1 << 27)
> +#define ATOMIC_BATCH			(0x1 << 28)
> +#define MIGRATE_ALL_PAGES		(0x1 << 29)
> +#define PREFERRED_LOC_ATOMIC_DEVICE	(0x1 << 30)
> +#define PREFERRED_LOC_ATOMIC_GL		(0x1ull << 31)
> +#define PREFERRED_LOC_ATOMIC_CPU	(0x1ull << 32)
> +#define MADVISE_MULTI_VMA		(0x1ull << 33)
> +#define MADVISE_SPLIT_VMA		(0x1ull << 34)
> +#define MADVISE_ATOMIC_VMA		(0x1ull << 35)
> +#define PREFETCH_SPLIT_VMA		(0x1ull << 36)
> +#define PREFETCH_CHANGE_ATTR		(0x1ull << 37)
> +#define PREFETCH_SAME_ATTR		(0x1ull << 38)
>=20
>  #define N_MULTI_FAULT           4
>=20
> @@ -478,6 +509,47 @@ static void __aligned_partial_free(struct
> aligned_alloc_type  *aligned_alloc_typ
>   * SUBTEST: processes-evict-malloc-mix-bo
>   * Description: multi-process trigger eviction of VRAM allocated via mal=
loc and
> BO create
>   * Test category: stress test
> + *
> + * SUBTEST: madvise-multi-vma
> + * Description: performs multiple madvise operations on multiple
> + virtual memory area using atomic device attributes
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-split-vma
> + * Description: perform madvise operations on multiple type VMAs (BO
> + and CPU VMAs)
> + * Test category: perform madvise operations on multiple type VMAs (BO
> + and CPU VMAs)
> + *
> + * SUBTEST: madvise-atomic-vma
> + * Description: perform madvise atomic operations on BO in VRAM/SMEM if
> + atomic ATTR global/device
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-split-vma-with-mapping
> + * Description: performs prefetch and page migration
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-vram
> + * Description: performs both atomic and preferred loc madvise
> + operations atomic device attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-gl
> + * Description: performs both atomic and preferred loc madvise
> + operations with atomic global attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-cpu
> + * Description: performs both atomic and preferred loc madvise
> + operations with atomic cpu attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-sram-migrate-pages
> + * Description: performs preferred loc madvise operations and migrating
> + all pages in smem
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-no-range-invalidate-same-attr
> + * Description: performs atomic global madvise operation, prefetch and
> + again madvise operation with same atomic attribute
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-range-invalidate-change-attr
> + * Description: performs atomic global madvise operation, prefetch and
> + again madvise operation with different atomic attribute
> + * Test category: functionality test
> + *
>   */
>=20
>  static void
> @@ -544,7 +616,7 @@ many_allocs(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		allocs[i] =3D alloc;
>=20
>  		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size, stride,
> -				&tv, &submit);
> +				&tv, &submit, flags & ATOMIC_BATCH);
>  	}
>=20
>  	if (barrier)
> @@ -692,7 +764,7 @@ partial(int fd, struct drm_xe_engine_class_instance *=
eci,
> unsigned int flags)
>  		.num_syncs =3D 1,
>  		.syncs =3D to_user_pointer(sync),
>  	};
> -	struct {
> +	struct batch_data {
>  		uint32_t batch[16];
>  		uint64_t pad;
>  		uint64_t vm_sync;
> @@ -750,7 +822,8 @@ partial(int fd, struct drm_xe_engine_class_instance *=
eci,
> unsigned int flags)
>  		uint64_t sdi_addr =3D addr + sdi_offset;
>  		int b =3D 0;
>=20
> -		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i],
> i), &b);
> +		write_dword((struct test_exec_data *)&data[i], sdi_addr,
> WRITE_VALUE(&data[i], i),
> +			     &b, ATOMIC_BATCH ? true : false);
>  		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
>=20
>  		if (!i)
> @@ -773,7 +846,10 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>  		xe_wait_ufence(fd, new ?: exec_ufence, USER_FENCE_VALUE,
>  			       exec_queue, FIVE_SEC);
>  		if (i || (flags & CPU_FAULT))
> -			igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
> +			igt_assert_eq(data[i].data,
> +				      flags & ATOMIC_BATCH
> +				      ? VAL_ATOMIC_EXPECTED
> +				      : READ_VALUE(&data[i]));
>  		exec_ufence[0] =3D 0;
>=20
>  		if (!i) {
> @@ -1001,48 +1077,47 @@ partial(int fd, struct drm_xe_engine_class_instan=
ce
> *eci, unsigned int flags)
>   * @mmap-free-huge-preferred-loc-smem:	mmap huge page and free
> buffer for each exec and perform madvise
>   * @mmap-free-nomemset-preferred-loc-smem:	mmap and free buffer
> for each exec and perform madvise
>   * @mmap-free-preferred-loc-smem:	mmap and free buffer for each exec
> and perform madvise
> - * @mmap-free-race-nomemset-preferred-loc-smem:
> - * @mmap-free-race-preferred-loc-smem:
> - * @mmap-huge-nomemset-preferred-loc-smem:
> - * @mmap-huge-preferred-loc-smem:
> - * @mmap-mlock-nomemset-preferred-loc-smem:
> - * @mmap-mlock-preferred-loc-smem:
> - * @mmap-new-huge-nomemset-preferred-loc-smem:
> - * @mmap-new-huge-preferred-loc-smem:
> - * @mmap-new-nomemset-preferred-loc-smem:
> - * @mmap-new-preferred-loc-smem:
> - * @mmap-new-race-nomemset-preferred-loc-smem:
> - * @mmap-new-race-preferred-loc-smem:
> - * @mmap-nomemset-preferred-loc-smem:
> - * @mmap-preferred-loc-smem:
> - * @mmap-prefetch-preferred-loc-smem:
> - * @mmap-prefetch-shared-preferred-loc-smem:
> - * @mmap-race-nomemset-preferred-loc-smem:
> - * @mmap-race-preferred-loc-smem:
> - * @mmap-remap-dontunmap-eocheck-preferred-loc-smem:
> - * @mmap-remap-dontunmap-preferred-loc-smem:
> - * @mmap-remap-eocheck-preferred-loc-smem:
> - * @mmap-remap-preferred-loc-smem:
> - * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem:
> - * @mmap-remap-ro-dontunmap-preferred-loc-smem:
> - * @mmap-remap-ro-eocheck-preferred-loc-smem:
> - * @mmap-remap-ro-preferred-loc-smem:
> - * @mmap-shared-nomemset-preferred-loc-smem:
> - * @mmap-shared-preferred-loc-smem:
> - * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem:
> - * @mmap-shared-remap-dontunmap-preferred-loc-smem:
> - * @mmap-shared-remap-eocheck-preferred-loc-smem:
> - * @mmap-shared-remap-preferred-loc-smem:
> - * @new-bo-map-nomemset-preferred-loc-smem:
> - * @new-bo-map-preferred-loc-smem:
> - * @new-busy-nomemset-preferred-loc-smem:
> - * @new-busy-preferred-loc-smem:
> - * @new-nomemset-preferred-loc-smem:
> - * @new-preferred-loc-smem:
> - * @new-prefetch-preferred-loc-smem:
> - * @new-race-nomemset-preferred-loc-smem:
> - * @new-race-preferred-loc-smem:
> - * @prefetch-benchmark:
> + * @mmap-free-race-nomemset-preferred-loc-smem: mmap and free buffer
> + for each exec with race between cpu and gpu access, perform madvise
> + operation
> + * @mmap-free-race-preferred-loc-smem: mmap and free buffer for each
> + exec with race between cpu and gpu access, perform madvise operation
> + * @mmap-huge-nomemset-preferred-loc-smem: mmap huge page single
> buffer
> + for all execs, skips memset and perform madvise operation
> + * @mmap-huge-preferred-loc-smem: mmap huge page single buffer for all
> + execs, perform madvise operation
> + * @mmap-mlock-nomemset-preferred-loc-smem: mmap and mlock of a
> buffer
> + with preferred location set to system memory, skipping memset
> + * @mmap-mlock-preferred-loc-smem: mmap and mlock of a buffer with
> + preferred location set to system memory
> + * @mmap-new-huge-nomemset-preferred-loc-smem: mmap of a newly
> + allocated buffer using huge pages, with preferred location set to
> + system memory and skipping memset
> + * @mmap-new-huge-preferred-loc-smem: mmap of a newly allocated buffer
> + using huge pages, with preferred location set to system memory
> + * @mmap-new-nomemset-preferred-loc-smem: mmap of a newly allocated
> + buffer with preferred location set to system memory and skipping
> + memset
> + * @mmap-new-preferred-loc-smem: mmap of a newly allocated buffer with
> + preferred location set to system memory
> + * @mmap-new-race-nomemset-preferred-loc-smem: mmap of a newly
> + allocated buffer with preferred location set to system memory and
> + skipping memset
> + * @mmap-new-race-preferred-loc-smem: mmap of a newly allocated buffer
> + with preferred location set to system memory
> + * @mmap-nomemset-preferred-loc-smem: mmap of a buffer with preferred
> + location set to system memory, skipping memset
> + * @mmap-preferred-loc-smem: mmap of a buffer with preferred location
> + set to system memory
> + * @mmap-prefetch-preferred-loc-smem: prefetching mmap buffer with
> + preferred location set to system memory
> + * @mmap-prefetch-shared-preferred-loc-smem: mmap of a shared buffer
> + with prefetch and preferred location set to system memory
> + * @mmap-race-nomemset-preferred-loc-smem: Tests mmap of a buffer with
> + preferred location set to system memory, skipping memset
> + * @mmap-race-preferred-loc-smem: mmap buffer with race between GPU
> and
> + CPU access with preferred location set to system memory
> + * @mmap-remap-dontunmap-eocheck-preferred-loc-smem: mmap and remap
> of
> + a buffer with preferred location set to system memory, does not unmap
> + after use
> + * @mmap-remap-dontunmap-preferred-loc-smem: mmap and remap of a
> buffer
> + with preferred location set to system memory, does not unmap after use
> + * @mmap-remap-eocheck-preferred-loc-smem: mmap and remap of a buffer
> + with preferred location set to system memory
> + * @mmap-remap-preferred-loc-smem: mmap and remap of a buffer with
> + preferred location set to system memory
> + * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem: mmap and
> remap
> + of a read-only buffer with preferred location set to system memory,
> + does not unmap after use
> + * @mmap-remap-ro-dontunmap-preferred-loc-smem: mmap and remap of a
> + read-only buffer with preferred location set to system memory, does
> + not unmap after use
> + * @mmap-remap-ro-eocheck-preferred-loc-smem: mmap and remap of a
> + read-only buffer with preferred location set to system memory
> + * @mmap-remap-ro-preferred-loc-smem: mmap and remap of a read-only
> + buffer with preferred location set to system memory
> + * @mmap-shared-nomemset-preferred-loc-smem: mmap of a shared buffer
> + with preferred location set to system memory, skipping memset
> + * @mmap-shared-preferred-loc-smem: mmap of a shared buffer with
> + preferred location set to system memory
> + * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem: mmap
> and
> + remap of a shared buffer with preferred location set to system memory,
> + does not unmap after use
> + * @mmap-shared-remap-dontunmap-preferred-loc-smem: mmap and remap
> of a
> + shared buffer with preferred location set to system memory
> + * @mmap-shared-remap-eocheck-preferred-loc-smem: mmap and remap of a
> + shared buffer with preferred location set to system memory with end of
> + check validation
> + * @mmap-shared-remap-preferred-loc-smem: mmap and remap of a shared
> + buffer with preferred location set to system memory without end of
> + check validation
> + * @new-bo-map-nomemset-preferred-loc-smem: Tests allocation and
> + mapping of a new buffer object with preferred location set to system
> + memory, skipping memset
> + * @new-bo-map-preferred-loc-smem: ests allocation and mapping of a new
> + buffer object with preferred location set to system memory
> + * @new-busy-nomemset-preferred-loc-smem: Tests allocation and usage of
> + a new busy buffer object with preferred location set to system memory,
> + skipping memset
> + * @new-busy-preferred-loc-smem: ests allocation and usage of a new
> + busy buffer object with preferred location set to system memory
> + * @new-nomemset-preferred-loc-smem: Tests allocation of a new buffer
> + object with preferred location set to system memory, skipping memset
> + * @new-preferred-loc-smem: Tests allocation of a new buffer object
> + with preferred location set to system memory
> + * @new-prefetch-preferred-loc-smem: Tests allocation and prefetching
> + of a new buffer object with preferred location set to system memory
> + * @new-race-nomemset-preferred-loc-smem: Tests allocation of a new
> + buffer object with preferred location set to system memory, skipping
> + memset
> + * @new-race-preferred-loc-smem: tests allocation of a new buffer
> + object with preferred location set to system memory
>   *
>   * SUBTEST: prefetch-benchmark
>   * Description: Prefetch a 64M buffer 128 times, measure bandwidth of pr=
efetch
> @@ -1072,16 +1147,6 @@ partial(int fd, struct drm_xe_engine_class_instanc=
e
> *eci, unsigned int flags)
>   * Description: Create multiple threads with a faults on different hardw=
are
> engines to same addresses, racing between CPU and GPU access
>   * Test category: stress test
>   */
> -
> -struct test_exec_data {
> -	uint32_t batch[32];
> -	uint64_t pad;
> -	uint64_t vm_sync;
> -	uint64_t exec_sync;
> -	uint32_t data;
> -	uint32_t expected_data;
> -};
> -
>  static void igt_require_hugepages(void)  {
>  	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
> @@ -1090,11 +1155,37 @@ static void igt_require_hugepages(void)
>  		      "No huge pages available!\n");
>  }
>=20
> +static int
> +xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t rang=
e,
> +			int pat_index)
> +{
> +	return	xe_vm_madvise(fd, vm, addr, range, 0,
> +			      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0); }
> +
> +static int
> +xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t
> range,
> +			  int mem_attr)
> +{
> +	return	xe_vm_madvise(fd, vm, addr, range, 0,
> +			      DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> +			      mem_attr, 0);
> +}
> +
> +static int
> +xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr,
> +uint64_t range) {
> +	return	xe_vm_madvise(fd, vm, addr, range, 0,
> +			      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
> +			      DRM_XE_MIGRATE_ALL_PAGES);
> +}
> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
>  	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> -	  unsigned int flags)
> +	  unsigned long long flags)
>  {
>  	uint64_t addr;
>  	struct drm_xe_sync sync[1] =3D {
> @@ -1107,9 +1198,10 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		.syncs =3D to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> -	struct test_exec_data *data, *next_data =3D NULL;
> +	struct test_exec_data *data, *next_data =3D NULL, *org_data;
>  	uint32_t bo_flags;
>  	uint32_t bo =3D 0, bind_sync =3D 0;
> +	uint32_t val;
>  	void **pending_free;
>  	u64 *exec_ufence =3D NULL, *bind_ufence =3D NULL;
>  	int i, j, b, file_fd =3D -1, prev_idx, pf_count, err; @@ -1234,6 +1326,=
133
> @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				 strerror(errno), vm, to_user_pointer(data),
> bo_size);
>  	}
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		if (flags & MIGRATE_ALL_PAGES) {
> +			err =3D xe_vm_madvise_migrate_pages(fd, vm,
> to_user_pointer(data), bo_size);
> +			if (err)
> +				igt_warn("failure in page migration err =3D %s,
> vm =3D%u, data=3D%"PRIu64"\n",
> +					 strerror(errno), vm,
> to_user_pointer(data));
> +		} else {
> +			err =3D xe_vm_madvise(fd, vm, to_user_pointer(data),
> bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		}
> +	}
Here if & else doing same setting preferred LOC as SRAM can you please chec=
k

can you please add test coverage for  DRM_XE_ATOMIC_UNDEFINED also=20
and for all atomic cases migrations is done. Can you please for atomic case=
 with out migration

> +	if (flags & PREFERRED_LOC_ATOMIC_DEVICE) {
> +		err =3D xe_vm_madvise_migrate_pages(fd, vm,
> to_user_pointer(data), bo_size);
> +		if (err)
> +			igt_warn("failure in page migration err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data), bo_size,
> +						DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in atomic device attr err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & PREFERRED_LOC_ATOMIC_GL) {
> +		err =3D xe_vm_madvise_migrate_pages(fd, vm,
> to_user_pointer(data), bo_size);
> +		if (err)
> +			igt_warn("failure in page migration err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data), bo_size,
> +						DRM_XE_ATOMIC_GLOBAL);
> +		if (err)
> +			igt_warn("failure in atomic global attr err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & PREFERRED_LOC_ATOMIC_CPU) {
> +		err =3D xe_vm_madvise_migrate_pages(fd, vm,
> to_user_pointer(data), bo_size);
> +		if (err)
> +			igt_warn("failure in page migration err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data), bo_size,
> +						DRM_XE_ATOMIC_CPU);
> +		if (err)
> +			igt_warn("failure in atomic cpu attr err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & MADVISE_MULTI_VMA) {
> +		if (bo_size)
> +			bo_size =3D ALIGN(bo_size, SZ_4K);
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data) + bo_size/2,
> +						bo_size/2,
> DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in atomic device attr err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
After setting the atomic at a=A0specific location and write the pat_value n=
ext to this  only to avoid confusion=20
remove the pat values.

> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data) + bo_size,
> +						bo_size,
> DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in atomic multi_vma err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data),
> bo_size, intel_get_pat_idx_wb(fd));
> +		if (err)
> +			igt_warn("failure in pat attr index 4 err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data),
> bo_size, intel_get_pat_idx_wb(fd));
> +		if (err)
> +			igt_warn("failure in pat attr index 3 err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +
> +		err =3D xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) +
> bo_size/2, bo_size/2,
> +					     intel_get_pat_idx_wb(fd));
> +		if (err)
> +			igt_warn("failure in pat attr index 8 err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & MADVISE_SPLIT_VMA) {
> +		if (bo_size)
> +			bo_size =3D ALIGN(bo_size, SZ_4K);
> +
> +		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo =3D xe_bo_create(fd, vm, bo_size,
> +				  vram_if_possible(fd, eci->gt_id), bo_flags);
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) +
> bo_size/2,
> +				 bo_size/2, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) +
> bo_size/2,
> +				    bo_size/2, DRM_XE_VM_BIND_OP_MAP,
> +
> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> +				    1, 0, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> FIVE_SEC);
> +		data[0].vm_sync =3D 0;
> +		gem_close(fd, bo);
> +		bo =3D 0;
> +
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data),
> +						bo_size/2,
> DRM_XE_ATOMIC_DEVICE);
> +		if (err)
> +			igt_warn("failure in split atomic device attr err =3D %s, vm
> =3D%u data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +	if (flags & MADVISE_ATOMIC_VMA) {
> +		if (bo_size)
> +			bo_size =3D ALIGN(bo_size, SZ_4K);
> +
> +		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci-
> >gt_id), bo_flags);
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data),
> bo_size, 0,
> +0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data),
> bo_size,
> +				    DRM_XE_VM_BIND_OP_MAP,
> +
> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> +				    1, 0, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> FIVE_SEC);
> +		data[0].vm_sync =3D 0;
> +		gem_close(fd, bo);
> +		bo =3D 0;
> +
> +		err =3D xe_vm_madvise_atomic_attr(fd, vm,
> to_user_pointer(data), bo_size/2,
> +						DRM_XE_ATOMIC_GLOBAL);
> +		if (err)
> +			igt_warn("failure in atomic vma err =3D %s, vm =3D%u
> data=3D%"PRIu64"\n",
> +				 strerror(errno), vm, to_user_pointer(data));
> +	}
> +
>  	if (flags & BO_UNMAP) {
>  		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		bo =3D xe_bo_create(fd, vm, bo_size,
> @@ -1307,6 +1526,16 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		bool fault_inject =3D (FAULT & flags) && i =3D=3D n_execs / 2;
>  		bool fault_injected =3D (FAULT & flags) && i > n_execs;
>=20
> +		if (flags & MADVISE_MULTI_VMA) {
> +			addr =3D addr + bo_size;
> +			org_data =3D data;
> +			data =3D from_user_pointer(addr);
> +			batch_offset =3D (char *)&(data[idx].batch) - (char *)data;
> +			batch_addr =3D addr + batch_offset;
> +			sdi_offset =3D (char *)&(data[idx].data) - (char *)data;
> +			sdi_addr =3D addr + sdi_offset;
> +		}
> +
We are rearranging the address for Multi VMA, but I don't see that happenin=
g for Split VMA.
In the Split VMA case, we are binding the first half of the VMA, but should=
n't we also shift the address before writing data, similar to Multi VMA?
My understanding is that we should update the address to point to the corre=
ct region before writing.
Can you confirm if this?
eg:
------------------------------------------------

	if (flags & MADVISE_SPLIT_VMA) {
                        int b =3D 0;
                        uint64_t first_half_addr =3D addr;
                        uint64_t sdi_offset =3D (char *)&data[idx].data - (=
char *)data;
                        uint64_t sdi_addr_1 =3D first_half_addr + sdi_offse=
t;
                        write_dword(&data[idx], sdi_addr_1,
                                        WRITE_VALUE(&data[idx], idx), &b,
                                        flags & ATOMIC_BATCH ? true : false=
);
                        igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
=20
                        b =3D 0;
                        uint64_t second_half_addr =3D addr + bo_size/2;
                        uint64_t sdi_addr_2 =3D second_half_addr + sdi_offs=
et;
                        write_dword(&data[idx], sdi_addr_2,
                                        WRITE_VALUE(&data[idx], idx), &b,
                                        flags & ATOMIC_BATCH ? true : false=
);
                        igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
                }
------------------------------------------------------------------
>  		if (barrier)
>  			pthread_barrier_wait(barrier);
>=20
> @@ -1316,18 +1545,74 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				__write_dword(data[idx].batch,
>  					      sdi_addr + j * orig_size,
>  					      WRITE_VALUE(&data[idx], idx),
> &b);
> -			write_dword(data[idx].batch, sdi_addr + j * orig_size,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr + j * orig_size,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
>  		} else if (!(flags & EVERY_OTHER_CHECK)) {
>  			b =3D 0;
> -			write_dword(data[idx].batch, sdi_addr,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
> +			if (flags & PREFETCH) {
> +				if (flags & PREFETCH_SPLIT_VMA) {
> +					bo_size =3D ALIGN(bo_size, SZ_4K);
> +
> +					xe_vm_prefetch_async(fd, vm, 0, 0,
> addr, bo_size, NULL, 0, 0);
> +
> +					igt_info("num_vmas before madvise =3D
> %d \n", val);
> +
> +					val =3D
> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> +bo_size);
> +
> +					err =3D
> xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
> +					if (err)
> +						igt_warn("failure in prefetch
> split vma err =3D %s, vm =3D%u data=3D%"PRIu64"\n",
> +
> 	strerror(errno), vm, to_user_pointer(data));
> +					igt_info("num_vmas after madvise=3D %d
> \n", val);
> +					val =3D
> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +				} else if (flags & PREFETCH_SAME_ATTR) {
> +					err =3D xe_vm_madvise_atomic_attr(fd,
> vm, to_user_pointer(data), bo_size,
> +
> 	DRM_XE_ATOMIC_GLOBAL);
> +					if (err)
> +						igt_warn("failure in prefetch
> same attr err =3D %s, vm =3D%u data=3D%"PRIu64"\n",
> +
> 	strerror(errno), vm, to_user_pointer(data));
> +					val =3D
> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +					xe_vm_prefetch_async(fd, vm, 0, 0,
> addr, bo_size, NULL, 0, DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +					err =3D xe_vm_madvise_atomic_attr(fd,
> vm, to_user_pointer(data), bo_size/2,
> +
> 	DRM_XE_ATOMIC_GLOBAL);
> +					if (err)
> +						igt_warn("failure in prefetch
> atomic attr err =3D %s, vm =3D%u data=3D%"PRIu64"\n",
> +
> 	strerror(errno), vm, to_user_pointer(data));
> +				} else if (flags & PREFETCH_CHANGE_ATTR) {
> +					err =3D xe_vm_madvise_atomic_attr(fd,
> vm, to_user_pointer(data), bo_size,
> +
> 	DRM_XE_ATOMIC_GLOBAL);
> +					if (err)
> +						igt_warn("failure in prefetch
> atomic attr err =3D %s, vm =3D%u data=3D%"PRIu64"\n",
> +
> 	strerror(errno), vm, to_user_pointer(data));
> +					val =3D
> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> +bo_size);
> +
> +					xe_vm_prefetch_async(fd, vm, 0, 0,
> addr, bo_size, NULL, 0,
> +DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +
> +					err =3D xe_vm_madvise_atomic_attr(fd,
> vm, to_user_pointer(data), bo_size,
> +
> 	DRM_XE_ATOMIC_DEVICE);
> +					if (err)
> +						igt_warn("failure in prefetch
> change attr err =3D %s, vm =3D%u data=3D%"PRIu64"\n",
> +
> 	strerror(errno), vm, to_user_pointer(data));
> +					val =3D
> xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
> +					}
> +				} else {
Please remove this else case you already writing on top?
please check why CI is not listing all new test cases in pre merge results=
=20
-- Pravalika
> +					b =3D 0;
> +					write_dword((struct test_exec_data
> *)&data[idx], sdi_addr,
> +						     WRITE_VALUE(&data[idx],
> idx), &b,
> +						     flags & ATOMIC_BATCH ?
> true : false);
> +						     igt_assert(b <=3D
> ARRAY_SIZE(data[idx].batch));
> +				}
>  		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
>  			b =3D 0;
> -			write_dword(data[idx].batch, sdi_addr,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
>=20
>  			aligned_alloc_type =3D __aligned_alloc(aligned_size,
> bo_size); @@ -1346,10 +1631,11 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			__aligned_partial_free(&aligned_alloc_type);
>=20
>  			b =3D 0;
> -			write_dword(data[next_idx].batch,
> +			write_dword(&data[next_idx],
>  				    to_user_pointer(next_data) +
>  				    (char *)&data[next_idx].data - (char *)data,
> -				    WRITE_VALUE(&data[next_idx], next_idx),
> &b);
> +				    WRITE_VALUE(&data[next_idx], next_idx),
> &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[next_idx].batch));
>  		}
>=20
> @@ -1404,9 +1690,18 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  					       exec_queues[e], &timeout);
>  			igt_assert(err =3D=3D -ETIME || err =3D=3D -EIO);
>  		} else {
> -			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> -				       &data[idx].exec_sync,
> USER_FENCE_VALUE,
> -				       exec_queues[e], FIVE_SEC);
> +			if (flags & PREFERRED_LOC_ATOMIC_CPU) {
> +				int64_t timeout =3D QUARTER_SEC;
> +				err =3D __xe_wait_ufence(fd, exec_ufence ?
> exec_ufence :
> +						       &data[idx].exec_sync,
> +						       USER_FENCE_VALUE,
> +						       exec_queues[e],
> &timeout);
> +				if (err)
> +					goto cleanup;
> +			} else
> +				xe_wait_ufence(fd, exec_ufence ? exec_ufence
> :
> +					       &data[idx].exec_sync,
> USER_FENCE_VALUE,
> +					       exec_queues[e], FIVE_SEC);
>  			if (flags & LOCK && !i)
>  				munlock(data, bo_size);
>=20
> @@ -1456,17 +1751,17 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				if (flags & FORK_READ) {
>  					igt_fork(child, 1)
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[idx]));
>  					if (!(flags & FORK_READ_AFTER))
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[idx]));
>  					igt_waitchildren();
>  					if (flags & FORK_READ_AFTER)
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[idx]));
>  				} else {
>  					igt_assert_eq(data[idx].data,
> -						      READ_VALUE(&data[idx]));
> +						      flags & ATOMIC_BATCH ?
> VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[idx]));
>=20
>  					if (flags &
> PREFETCH_SYS_BENCHMARK) {
>  						struct timespec tv =3D {};
> @@ -1494,13 +1789,13 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  								((void *)data)
> + j * orig_size;
>=20
>=20
> 	igt_assert_eq(__data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +								      flags &
> ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[idx]));
>  						}
>  					}
>  				}
>  				if (flags & EVERY_OTHER_CHECK)
>  					igt_assert_eq(data[prev_idx].data,
> -
> READ_VALUE(&data[prev_idx]));
> +						      flags & ATOMIC_BATCH ?
> VAL_ATOMIC_EXPECTED :
> +READ_VALUE(&data[prev_idx]));
>  			}
>  		}
>=20
> @@ -1521,6 +1816,9 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			gem_close(fd, bo);
>  		}
>=20
> +		if (flags & MADVISE_MULTI_VMA)
> +			data =3D org_data;
> +
>  		if (flags & NEW) {
>  			if (flags & MMAP) {
>  				if (flags & FREE)
> @@ -1610,6 +1908,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				 pf_count, pf_count_after);
>  	}
>=20
> +cleanup:
>  	if (bo) {
>  		sync[0].addr =3D to_user_pointer(bind_ufence);
>  		__xe_vm_bind_assert(fd, vm, 0,
> @@ -1864,7 +2163,7 @@ processes(int fd, int n_exec_queues, int n_execs,
> size_t bo_size,
>=20
>  struct section {
>  	const char *name;
> -	unsigned int flags;
> +	unsigned long long flags;
>  };
>=20
>  igt_main
> @@ -1964,6 +2263,19 @@ igt_main
>  		{ "malloc-mix-bo", MIX_BO_ALLOC },
>  		{ NULL },
>  	};
> +	const struct section msections[] =3D {
> +		{ "preffered-loc-sram-migrate-pages", PREFERRED_LOC_SMEM
> | MIGRATE_ALL_PAGES | ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-vram",
> PREFERRED_LOC_ATOMIC_DEVICE | ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-gl", PREFERRED_LOC_ATOMIC_GL |
> ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-cpu", PREFERRED_LOC_ATOMIC_CPU |
> ATOMIC_BATCH },
> +		{ "multi-vma", MADVISE_MULTI_VMA | ATOMIC_BATCH },
> +		{ "split-vma", MADVISE_SPLIT_VMA | ATOMIC_BATCH },
> +		{ "atomic-vma", MADVISE_ATOMIC_VMA | ATOMIC_BATCH },
> +		{ "split-vma-with-mapping", PREFETCH | PREFETCH_SPLIT_VMA
> | ATOMIC_BATCH },
> +		{ "range-invalidate-change-attr", PREFETCH |
> PREFETCH_CHANGE_ATTR | ATOMIC_BATCH },
> +		{ "no-range-invalidate-same-attr", PREFETCH |
> PREFETCH_SAME_ATTR | ATOMIC_BATCH },
> +		{ NULL },
> +	};
>  	int fd;
>  	int num_sections;
>=20
> @@ -1983,10 +2295,11 @@ igt_main
>  	for (const struct section *s =3D sections; s[num_sections].name;
> num_sections++)
>  		;
>=20
> -	for (int i =3D 0; i < num_sections * 2; i++) {
> -		struct section *s =3D &sections[i % num_sections];
> +	for (int i =3D 0; i < num_sections * 3; i++) {
> +		struct section p =3D sections[i % num_sections];
> +		struct section *s =3D &p;
>=20
> -		if (i/num_sections =3D=3D 0) {
> +		if (i/num_sections =3D=3D 1) {
>  			static char modified_name[256];
>  			snprintf(modified_name, sizeof(modified_name), "%s-
> preferred-loc-smem", s->name);
>  			s->name =3D modified_name;
> @@ -2175,6 +2488,14 @@ igt_main
>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>  	}
>=20
> +	for (const struct section *s =3D msections; s->name; s++) {
> +		igt_subtest_f("madvise-%s", s->name) {
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
> +						NULL, s->flags);
> +		}
> +	}
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		drm_close_driver(fd);
> --
> 2.43.0


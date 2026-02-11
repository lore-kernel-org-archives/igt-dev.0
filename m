Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8B1EB5954
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 09:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AB110E09C;
	Wed, 11 Feb 2026 09:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4pQlFXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A383A10E09C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770802652; x=1802338652;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=r7hXJZndJvgsGV4+f540uivbAcrDAKPXGKzFNhS3d2E=;
 b=B4pQlFXbWJY8mng58OZyhLDzrsoMTGobDDupxTtE1dh3dBEebpm1v4Mz
 7xC63G2eIUKL6K3BnsLgR8TcP7X4OxZcFTstS1v09OVEHjyqv4ke/CihJ
 K228qVXRy9mXjiuZhIOtuzc4L8ULKunsht96C7VJr+mK3YrTZV0GpLIhC
 TTQUBNUFIP37mau1rdkNbUBbd9CIk0hpKgSdbSYZ8XO+OOUw41FKhSLBv
 0CTrXR1VP7c1ltJjLLoehWWB62QnakO+cOFY6UZQQMpAalYnUe2F9Qt1f
 EO6+tG7rLqIEAQI+9SKSCghzDg8r9Se0wsyPSs3s5ntigFfKI/HQt3bfH g==;
X-CSE-ConnectionGUID: dNJ/3cOMQryx7NE+rOQJ1A==
X-CSE-MsgGUID: UykgZuuISMC/7EFQmRVv5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71987700"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71987700"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:37:32 -0800
X-CSE-ConnectionGUID: b2sAeO+DS6eV7bGthuP5JQ==
X-CSE-MsgGUID: tKWJFQvISoeQx25677k1Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216718352"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:37:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 01:37:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 01:37:31 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 01:37:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYmw9wgj0NcUNjSXa2yR2S09mS9D3hlg3WeTLCuwz8hLTSy3hqtIktPAdlDJXMjzFTztiuXiWZszY6O8A/TGj4hkfjiHDGuJ018lYnBUahqZ8hSSMvZL40Mvj1kbMMdBEfMRUT1yyp2QBCgMLdqseI5lTfLIN6nvztTEUcgIPYdt7WH0SfXm1TlQ/EJ6Exvf3VMlkFXg8HLGtfBYjE44uPcJdLbl7mpmBzkEDfvDbQX74TlUohO8KksxE/wclRX7oSacp4IXYk0Y3bZUdoPFbow56CO19StycvCSiWA1C7+q1YA+jKR27qAa7yjT5Wvq/9HoEhBO2Io2ejUBX25NlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLqR0y70zG0/Kf10BG51iDifnGwZZnkAa0uGZJ6FFBo=;
 b=CoiY0TrjDidUXMl5oNweE6SMO3hUDZBPK0emK2lvJh6imzazvNbeqPJ6jnIZ1ejrEf0SfCSLGycCDBJQEvD4d27VddPc2RYOh/dzLuK5xveveLmNftesj54WhyiafU954eEZ8bWs6vbLUc9RQw80PaK1JYZRHGVamJQPhxeT4RDqwKJ84SoGp0Al5JqZGhkcXZ/cTH7Ci1Bbm72gQOJBJKCQmuuKXwAY7tTaBT37S5UFdW1MIYq2PPFVOq6j92b5XSWj5pBS9DZQAujv+EuxJS+6Wt360oTC077oCyqBGjsExPK6OppGRCoV9IBqJy59dzrgDYtLsOcQOubAoIOwYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 09:37:23 +0000
Received: from BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::79dc:e0e7:9338:5e89]) by BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::79dc:e0e7:9338:5e89%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 09:37:23 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add helpers
 to enable and reset hugepages for test execution
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add helpers
 to enable and reset hugepages for test execution
Thread-Index: AQHcmzdsRgBspZSwWUiQTuKpa16+GrV9PWtw
Date: Wed, 11 Feb 2026 09:37:23 +0000
Message-ID: <BN9PR11MB55292067CB465A355817F84C8463A@BN9PR11MB5529.namprd11.prod.outlook.com>
References: <20260211091829.1003250-1-nishit.sharma@intel.com>
In-Reply-To: <20260211091829.1003250-1-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5529:EE_|PH8PR11MB6706:EE_
x-ms-office365-filtering-correlation-id: 493f18ae-23a1-4f83-8a88-08de6951291b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wdRDtaL3Il/MR+YXqSnWAuFl6naq+84dn9tZ2Kwc4lk0eejhShlXFMjiDYv1?=
 =?us-ascii?Q?F5oVehHFjsEGbA+cGUvC9jyRoN+yI5TaFTeqK3rGTB8CXoUQL/zNgA4ftKVw?=
 =?us-ascii?Q?adNUu8WkoGp2xHVbisavMFDSErqqn05wEeuBBfkeoMEEgDCfQQZV/a9uKZ2z?=
 =?us-ascii?Q?V5ALrRfMFIaejjKCFkZW9wM6nfZWMN0QxUaOFP16P4U/YyoHItjgBvwMbO8c?=
 =?us-ascii?Q?EsfDqzz19/+4PgqWmbdCYB9HeH6HBQsYgpdCwFcAWJGGrnEyxQ3nToSO0q29?=
 =?us-ascii?Q?M0Hs0vE3aW8+wYbCf62A5mpX/csjpEjViClfCY0htjZZJKGuKuwJS6A585f8?=
 =?us-ascii?Q?29La7LRWh+rRZhinv5hAbhdNwVBqOYjHJxReNRY/1Mk4cw5FnDJy3eAdu9n6?=
 =?us-ascii?Q?tVSIH9gV8ntRkNCSAJHtZ34ZrsBzBBSDAsG+KGpaH0sbxtNii9SZHa3KVQ4Q?=
 =?us-ascii?Q?k3zpKCR98mA16kacU4+1ZFsoBuFdei/zn/lavQn0CcB+WbzGH6tG7JwziUcN?=
 =?us-ascii?Q?E7LDl5yePsyd+/LLuXXwdcXd8rK3Nyxa5am7FF0MOTU9c+8ZPI5QMdFGV7oJ?=
 =?us-ascii?Q?J1IvMLnFQMEbGldwF989fdM4g4+ZscylA+SjqVViTOO90yMkg2aulH35BIbA?=
 =?us-ascii?Q?kY/EOiNYdcAAPzu910arWnsfwN9RUlbiwTSEewZAjFYckbfmHrVjQOCXhhHE?=
 =?us-ascii?Q?fRCGVhkOOJ2tVW3ZFnNJ7DKz5mHR8CsxbTZ0EwEUmXsMhYzyl745gdnH9yPl?=
 =?us-ascii?Q?LgX16/Vo0uMbgjF0RdL+c0qp9qlBqdIGBl0pRaM4+CkFPSai+B9xOZ2i85/x?=
 =?us-ascii?Q?ETZgXluvDHFU8hmvWIKfVzU9TOxH94nYmGMTxVXoL4w3h8bZIBQctL8n4tFV?=
 =?us-ascii?Q?sU95fgI3Maoz6WbzXDwObeZzqqcZ7HQ/9e2kmq6vKEh0bXD/jlc0BVpYpVXY?=
 =?us-ascii?Q?gcJiJ9gl4TKnJJLAb//mqnXw9HzuHSctziDqV0o2qP4urHJ1bJvscjk2i+rw?=
 =?us-ascii?Q?oiv56rm07pHaFCp0LqgXYsJO+XchwOI04lLgKf+0ffyEHCkWUYLXVLLMhlZE?=
 =?us-ascii?Q?Gh2lWknGuR7OD277MPL25yPjuNTmLZvFbHdw4r9At8ld9YNPi1VmCriZf4kY?=
 =?us-ascii?Q?avzHcv9pCeRl0U4/IIvKzXuAewcIXLcZcluGdfmugMKVy7piSMJIoIxsym6y?=
 =?us-ascii?Q?CCBrMtLhEFweeY3l3IYtFU9nf+KQ+EXogNiL47VN5sbCKAtm44ZBLT7VsaC6?=
 =?us-ascii?Q?CRbP+TJTQFsEw1uwZFCLTKN9mm+vfW8CwFebgZNJiJCuGuEYRHu5rCFqZVWD?=
 =?us-ascii?Q?kOFK7P7NfUZp2JiGMgtKAJYouYNA76rccLEX0F06GgHUGRAP7sVvKVgZrcX4?=
 =?us-ascii?Q?aysTQTPsrKYbjl0oTf+q7H8+lc1for5lgGYUKdMeJM2gQwzZkWmlMzMchju9?=
 =?us-ascii?Q?3GECjXj2oyL9tNkqnD3gzcUzh5IuwSLaQqh/slOaB3LylhuIVyy+7J8Xdj/c?=
 =?us-ascii?Q?RokWiH3yA1M4Tcn7AULuyZJ+0lyzYY3qRoXmjutwcdXA7pYFFRuBwVbORucW?=
 =?us-ascii?Q?09Efx7MWic8IF2sJ7FHz8CrjrLyKQ34/caVdReWjtoUeyCXckF5UG0Yba09M?=
 =?us-ascii?Q?rMk/NoQ8CYEbbaDWYJ2O3wY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b8UQxQhyT6SUvDfBPlc+Bqjk0tzBe4rV2Cn8sXg6Bgt9M+JehaiptjEAhdOY?=
 =?us-ascii?Q?XRPymXXuwicCO3JnXbnZEHD+/o2V4/2yjiGWCh8NOm/lcVr99nPWkb4MKIie?=
 =?us-ascii?Q?6SahVf+Awb2PPu/HrWbpNOpJqCXy5JZj47Z4I78hDRcP0uZ8Du8E4M3Cmoa0?=
 =?us-ascii?Q?IFMuEIps+unL16qjaTCi7zN4JEUdSvLztvdWG/LUurmF3oYh/2JUOs8WkfpT?=
 =?us-ascii?Q?DK3wjzx5Bq61AkyWON4/p8bmoYE9k0yaPS88w39Q7Vb4frdjvKLWTlW34Ey6?=
 =?us-ascii?Q?70Jwpf/f35J4EjKeADBTQ8OLwmGMJJau2geZ1AgqBQV6ZShQp6Fs90hSkHrD?=
 =?us-ascii?Q?h+hR7V7IEX6vDeqs0KUF6DL3vEiQxik73mJ8mdS8Btm8Eos/OMPq6omaRMC3?=
 =?us-ascii?Q?g+vG353LXwrBjo/HKQ9SVrpmK03RHksCilh35Wpzg2/M1Mleg9/UNMPrExSJ?=
 =?us-ascii?Q?EmylZ4tN7EarOd12bCDQ1Pyev7PaAnh5xCDnb2jO10nDARC3nIf5WrLwJwI7?=
 =?us-ascii?Q?nhdXwo1O7/vrbfCM4j2pfjatjgb2aUyp3S80E7xkpLURmF31OLS1BOeMgP7E?=
 =?us-ascii?Q?goES5a/c2p01QMHoj5Dq9YRfXarlhFJWlf6ZTNsMSGXFzcXIk5caAKZvrFuf?=
 =?us-ascii?Q?neA+gAn0NpvKILonjzvKGEC30T8c+bgHMq3oqNdx311siPX1LJoa0cox43mm?=
 =?us-ascii?Q?f2zUVfsI/iB3lUkWqb0QDpI/Gq+WvAWb2JgIGAdE2rKJdhyfBo7G2OeunJXp?=
 =?us-ascii?Q?JGXamGv3xGfmaK3p0yllCC04HTGzV2vJGdalSUOkHFhujOWSC05zSVo6kjUo?=
 =?us-ascii?Q?gPerh8cDgPq7ms36pyHhayI3g2BDZfVaX6CxT9DuS2CwMKfeeVesHgwnJEpH?=
 =?us-ascii?Q?X6gUymYWZR/MBP8uSEDc3TknPetvqrCX+hji3yjrySsTbdSVM5cyFI9jQoae?=
 =?us-ascii?Q?5qOh9aVIO0famYjyCZ0Eqwki3QaCcnVwwPhrXoPRkJFRYR8ha3f4Hjv0wPFA?=
 =?us-ascii?Q?5BBVLL6EU18KhpOxW87fPI7TQkBoaRNy52eoGpNC9FOG3/uxcAir2kfk0CrN?=
 =?us-ascii?Q?o/s93su7gMJwGEvlyCse6vRxbehoyoBcTcfXXN4D/t+nwF+PCfrT+6ikQY4h?=
 =?us-ascii?Q?JYIFJn+iRoxS695cByOWJQp+pXEYFeR8w+0dsa5Q3BKZ7PH29M2l1oN6EOv1?=
 =?us-ascii?Q?L97Vmcc0gzHckq7WLhr4Gqs1Y3AizyV1LtYKSnu8/WfHZAg14sn3SjWJ0/9X?=
 =?us-ascii?Q?TQ9QVXFFl4Jkg1VFf3uFw27M1sozUS3Gz2jHTofUxBCQwCWP1iYDDcUF68NA?=
 =?us-ascii?Q?yfwthueHgN7OtfQhq1o5WMihalr4iXHT34DBO3BuEbCER++pmcDMCzsV2Agf?=
 =?us-ascii?Q?+xnamkzN69RxNqYP4IFA4vWvQiV5rtAHvNWEt6ugIucwnkTr7xcj1y029Y2m?=
 =?us-ascii?Q?gzgqE3jAI+OGU7j/FQ5Pi61/NY4kl9r/p+GumjXB9h+c9qPCa9G3UGXnGk4+?=
 =?us-ascii?Q?S1pN37b//UMqGCCs5qYkrsMCWG4d7yodRbCtQ3D6bXCx3cy6fkm5f0ifbd/V?=
 =?us-ascii?Q?qdg9OIEGtd9vYh52BBcvYbx7JersX2OiqV0o2D07y6IngdLTbtPDvbOyEDVL?=
 =?us-ascii?Q?8CpiD3q12EcW/Z64jqliSGItG6UEEqD5smHQuVIq6xeLt/PWsu89Zl0IGfIq?=
 =?us-ascii?Q?tpNXHnUh8gsCIUAjCB6YJO1TuurjEud4k4+xoBl3aOA8qH85XJbp51VcFD30?=
 =?us-ascii?Q?NyjfnZLRDQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493f18ae-23a1-4f83-8a88-08de6951291b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 09:37:23.6082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HROtDwc8kmo9kl6dNRHT5TCHq8ynPQZ7Kd270EqDMl50iLOIYt/K/y0EnKvAv0OoaWOBTsxLAkMCl8WMQ1hGxzdlRnjmmLV3we/MPtXmkb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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
> Sent: Wednesday, 11 February, 2026 02:48 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit <nishit.sharma@intel.co=
m>;
> Gurram, Pravalika <pravalika.gurram@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add helpers =
to
> enable and reset hugepages for test execution
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Introduce helper functions to programmatically control the number of
> hugepages via /proc/sys/vm/nr_hugepages. This allows tests that require
> hugepage-backed memory to be executed reliably instead of being skipped
> due to insufficient hugepages. The helpers ensure hugepages are enabled
> before relevant subtests and reset after improving test coverage and
> robustness.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 44 ++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index fc987ac7f..14f5e358f 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -31,6 +31,7 @@
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  #define QUARTER_SEC		(NSEC_PER_SEC / 4)
>  #define FIVE_SEC		(5LL * NSEC_PER_SEC)
> +#define NUM_HUGE_PAGES		128
>=20
>  struct test_exec_data {
>  	uint32_t batch[32];
> @@ -55,6 +56,28 @@ struct batch_data {
>  })
>  #define READ_VALUE(data__)	((data__)->expected_data)
>=20
> +bool is_hugepg_enable =3D false;
> +
> +static void set_nr_hugepages(int n)
> +{
> +	char cmd[64];
> +
> +	snprintf(cmd, sizeof(cmd), "echo %d > /proc/sys/vm/nr_hugepages",
> n);
> +	igt_assert(system(cmd) =3D=3D 0);
> +}
> +
> +static void reset_nr_hugepages(void)
> +{
> +	set_nr_hugepages(0);
> +	is_hugepg_enable =3D false;
> +}
> +
> +static void enable_hugepage(void)
> +{
> +	set_nr_hugepages(NUM_HUGE_PAGES);
> +	is_hugepg_enable =3D true;
> +}
> +
>  static void __write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t
> wdata,
>  			int *idx)
>  {
> @@ -1444,8 +1467,10 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	if (flags & EVERY_OTHER_CHECK && odd(n_execs))
>  		return;
>=20
> -	if (flags & HUGE_PAGE)
> +	if (flags & HUGE_PAGE) {
> +		enable_hugepage();
>  		igt_require_hugepages();
> +	}
>=20
>  	if (flags & EVERY_OTHER_CHECK)
>  		igt_assert(flags & MREMAP);
> @@ -1984,6 +2009,9 @@ cleanup:
>  	}
>  	if (free_vm)
>  		xe_vm_destroy(fd, vm);
> +
> +	if (is_hugepg_enable)
> +		reset_nr_hugepages();
>  }
>=20
>  struct thread_data {
> @@ -2036,8 +2064,10 @@ threads(int fd, int n_exec_queues, int n_execs,
> size_t bo_size,
>  	if ((FILE_BACKED | FORK_READ) & flags)
>  		return;
>=20
> -	if (flags & HUGE_PAGE)
> +	if (flags & HUGE_PAGE) {
> +		enable_hugepage();
>  		igt_require_hugepages();
> +	}
>=20
>  	xe_for_each_engine(fd, hwe)
>  		++n_engines;
> @@ -2115,6 +2145,9 @@ threads(int fd, int n_exec_queues, int n_execs,
> size_t bo_size,
>  			free(alloc);
>  	}
>  	free(threads_data);
> +
> +	if (is_hugepg_enable)
> +		reset_nr_hugepages();
>  }
>=20
>  static void process(struct drm_xe_engine_class_instance *hwe, int
> n_exec_queues, @@ -2150,8 +2183,10 @@ processes(int fd, int
> n_exec_queues, int n_execs, size_t bo_size,
>  	if (flags & FORK_READ)
>  		return;
>=20
> -	if (flags & HUGE_PAGE)
> +	if (flags & HUGE_PAGE) {
> +		enable_hugepage();
>  		igt_require_hugepages();
> +	}
>=20
>  	map_fd =3D open(sync_file, O_RDWR | O_CREAT, 0x666);
>  	posix_fallocate(map_fd, 0, sizeof(*pdata)); @@ -2171,6 +2206,9 @@
> processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>=20
>  	close(map_fd);
>  	munmap(pdata, sizeof(*pdata));
> +
> +	if (is_hugepg_enable)
> +		reset_nr_hugepages();
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>  }
>=20
>  /* compute flags */
> --
> 2.34.1


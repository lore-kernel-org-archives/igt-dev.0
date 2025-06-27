Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786FCC7EE31
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 08:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D4710E978;
	Fri, 27 Jun 2025 08:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crJZJYea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3977E10E978
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751011375; x=1782547375;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rvVLuI2QvcQ9jfUIYNpV13iP3zQFhcbQ6B6LbY430Cw=;
 b=crJZJYeaSti0AOLY47iojDjvL1HbGfjhcsc1TOpEJTu6XKrKHGOexpkZ
 K95fcQP+n4EYa98ZyYsFtZlLhBN8l0J9xoy4bZLMVSaiHSxLOoxJwi/iw
 +lSm0WfuBfhlhNqASHa2WbmEKpD4ER4NfVuRBqwg7R8q47//fqlknQfjb
 yZKu0KKbC8K4kLv9N17kdNigIoK7xHsPrT5ul3fdjnsc5x9m68ffV6RUM
 aEm5lxYxf58JayA122J2IWWZGsmIMlT/5NJTCEB+/osqoUyu4z1tmMOSo
 ibpNK3fBuCkPW4j/0WhP4pBntsmjH/WN8j1GCbEV6P+eXphdnpcQgsxsB A==;
X-CSE-ConnectionGUID: zwNtfugNSZqtTUcCqenV6A==
X-CSE-MsgGUID: dLto/xgiS0i9ma3DF5ErQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52552315"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="52552315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 01:02:55 -0700
X-CSE-ConnectionGUID: 6Q4SjNDLSju7qqsqGtW/tw==
X-CSE-MsgGUID: EzGtKx/VSfuoSX8g9haq5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152262012"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 01:02:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 01:02:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 01:02:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 01:02:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTsolnFa0TeKk73CnvVu3CFkxhq6JMhM1kZgT5kYvtDw7WL7TuxA3rqT3YjmqtwQq79pIjR4oFEhmIzMnNzB41ajeBmuT2+xtytwQrWIO6CmP53Xwrg/7+FmtcBA4wM0qGyEsDgLj6t1Ho7CX45cMtWjwfM03u8cAKMP3N3tQ131gbA7QAsrarRXmjvD7W2Jo5WTN0wRvlBT05VRj4SgA38xHpss0sq/BKNhLML+W7QWw9gkcq/NRqjy9QJkco8v2Ianr6TEhlt5beM+iDrLYvJCy+bEkr1H8YmnGTFv0f4Tnp9JlpVPaPVngDk1DcYdXRhU894W9uBOBNrX4pA7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWXsXr+Bq/9A75iLlx93PVkH6BmwZ+Qxw3GFj0BaxPo=;
 b=IhchZ+SOps5iNTL/k+B8qTxPQt8A7ecHCizI+ZdjAk2qfPSDYEydhi4fI5c/GaHknQ5bCWVDo4c6jGuuuXXM29Ei5gSzdtLNoTxnuwathIeX7h8X/e2B2iLXjRKeMNe6jDBzKt7Kvf+eSg/zPZrqFuC3En2yMP7gn0tx1GMplacnivhcJmyKr/3WeM5abpGgm/hpLjU4s/cPGXhxpXv2VaHfgoVH5/cvhYGOjKy8gMgEqsouOzwW8lfQC3QadG7GNi9IX11v7LF6HntsF+XKvLnoIrax/Gss4lernLA5KVuij/H2b4ql89fzw0FlQBmI6p5+e7bftNb19O1UTjEbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.22; Fri, 27 Jun 2025 08:02:11 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 08:02:11 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sokolowski, Jan" <jan.sokolowski@intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v1 1/1] tests/intel/xe_eudebug: move multigpu
 requirement to test block
Thread-Topic: [PATCH i-g-t v1 1/1] tests/intel/xe_eudebug: move multigpu
 requirement to test block
Thread-Index: AQHb5zbBA6qrzi6Yjke/VfrcisphBbQWpPAg
Date: Fri, 27 Jun 2025 08:02:10 +0000
Message-ID: <DS0PR11MB7264874D5E57E8CC15DB3038D945A@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250627074133.2898426-1-jan.sokolowski@intel.com>
In-Reply-To: <20250627074133.2898426-1-jan.sokolowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DM4PR11MB6168:EE_
x-ms-office365-filtering-correlation-id: dcb77078-0e70-4ed6-895c-08ddb550eb8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?v/eYVCxAxrKbhX8ZzHIkiYzWyuxie5PE1dQJ3xiVWoKxW85Veu46uLJ38Z?=
 =?iso-8859-2?Q?hwYmJu2YiM19q1CN/s1JyLFgZ65ymS74+RP5Figd87EEZ15fq2UpDnEOm+?=
 =?iso-8859-2?Q?6theDVyeTmYpFoivXsvr74pwoeTgNXxizZwnezrykjxDVgX2PxEmgcfk9N?=
 =?iso-8859-2?Q?nkrSOyVDkI6M3gHJAk7ATgsMKssbgtHDfd1eL0uL6a1WqQsXJ38ujS/hWG?=
 =?iso-8859-2?Q?aTVkpwzYoTFKWSqwzx1pUdxZpYrEdKHNiLXFLStbDW09k/hInhh5N/K6qD?=
 =?iso-8859-2?Q?XCIVSeYWXFYJA8pbrCVbtnEnfJXXc+wGimk+qgH5BBMS0f4arhskvO/ntj?=
 =?iso-8859-2?Q?+5WBJazM526huHDKh5HI+B1+XbuhmMMO+vZcsMMj7wf02Pm8PSEQRTFAwe?=
 =?iso-8859-2?Q?lsPXfJTQnyfbDc2RWy+QuTpS3aiIzYAIsm/NteqNOOBnyku/8zxIrm6URc?=
 =?iso-8859-2?Q?g5sTm56zBHRCUcI3ljVLNxKUDROGBsyYoWqi7mUZq9SxM/OBmoqbn37Fpu?=
 =?iso-8859-2?Q?u5FGhChsiX8RkLu6ED0Q1Qt1V6lNlLN+rs9bwAbLyEe7k2J0xRHtmS4J/7?=
 =?iso-8859-2?Q?mg+NWbkqCDUcdy+PSH8Pc0IPnujxkDOTy12h2Ol10+1Vs/rywV8+Jj4DLF?=
 =?iso-8859-2?Q?L7zQY0a/JxlM60CW337dxlsxgJcD8Z4gi5/l+5TBMTChgk0nGFKSYwWb4K?=
 =?iso-8859-2?Q?GV10XHg2Jnkav1UUmE0n8Bi5ulVwnANu40zVK86qXmWdWzzd0KrhQRAOIE?=
 =?iso-8859-2?Q?W8bNhP7fTdkv8jClWyzEWRCom1iE4rjsOU3XamqK2AGcz7B5I7sYnp6v4o?=
 =?iso-8859-2?Q?k7HCAKvkJ1jOPhdjoELvCkylKfM55X36ZF6U1BQ3N2d5mR01yLZLOJslZu?=
 =?iso-8859-2?Q?+eBndDBiG1hlHvRdamBqieP4by4twbcLtrWdkmzjS4ZQEOSFJb31GBj9To?=
 =?iso-8859-2?Q?kioS1NFJ/ZNz1IgheLg1kyMcM0nq2fANl+jQvC+tuJocpWOPMYeNWJQgtT?=
 =?iso-8859-2?Q?RBxK1VTlpVqGllxWfy9YU77EUEseDsZkvLrpaTZvvgkNkN13EZ6Qch6x1K?=
 =?iso-8859-2?Q?98eEJDAn2gxlx4h2+uEN8Rurbws64/TX2I0EHJJYwIBXtZY9mKUcfqtHHV?=
 =?iso-8859-2?Q?43ekzDovrCIGZqXjL1+R9bPlifii/ZBiV77MeU12pLShXOD0NYoyXw+azr?=
 =?iso-8859-2?Q?skLvbydCvlBeo08sZzSpAruWXXWA3qNAFpbc7o/Y8RM+6fOl/9RL9dRXk/?=
 =?iso-8859-2?Q?rpfCHoxvrYPTanNeergmE/KSDe+ICLyhFjl8y4igbZ6byQ8LDulb9uh5og?=
 =?iso-8859-2?Q?mbrRDoKhjKsIqlE+qmigIbEExieqBR6K5E/wcm5EI5COee2/okCOHqDp5I?=
 =?iso-8859-2?Q?xSDpdO7NBtyJl8qn8DRbq1aPLSu31ig9u5GHlakjKY6Tp5xmP1/7JE2Zv+?=
 =?iso-8859-2?Q?R2UCGd8jhcfqUKcLhZNzNPxfoPyqEhD2h2BwWPwVrX9iMErlcO++YyHExl?=
 =?iso-8859-2?Q?IqeSfQUTl39TQo77He1uDp/4JLIKqo5nlQTGQYTENjPQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?2wMYVnoJQ+lN4svuPtA5GIj8NvpdT220xxKEO39XLcL/qecxuknpxbrxD3?=
 =?iso-8859-2?Q?d/KDD9ybYIvlbXEPX4wej4/4Qf2h8S0urmG1ayMwe4kxh6bQ2bH4651K52?=
 =?iso-8859-2?Q?c+4Y6epJJwAatDwBAqL/4af+735la3bUn15cMjxNACJr2lX3kTc2qHbY0L?=
 =?iso-8859-2?Q?1BgQh3QuMqfsJuBxO8W46+4uLkWb7e3rZDE/fWJBTYSry1Cd/Ef0ChTszO?=
 =?iso-8859-2?Q?opilRmX5oFcYGxi//6LgmCQEYSTUx0euVDIuZzdKx8GtIaJPD5uvMxxa96?=
 =?iso-8859-2?Q?zqsYEOaJCd9KvbAJKpZoC7xvE9Wrov/mB6DIG74qVmGze1g9Ckmd5eZuww?=
 =?iso-8859-2?Q?6+jK+Vi7BAa9/zSq+SWhU8Ox97v32cSCnGgqxiZtbu2wGB8qZQHhg06qv6?=
 =?iso-8859-2?Q?jP1djBQPq+cn/JmiEtHCKOiLXqd+0MXiBGP9tyhrWaJ2PmQccjNjVc1CwM?=
 =?iso-8859-2?Q?g/En8N4+VJLt775sZl0mWz0gjA+A4GdP4AyHODuL8/77HfidC+Ymaech4R?=
 =?iso-8859-2?Q?WOzW6oFaM+oBblNkhmJwLDh4UUrtnxU0BHTb4SXmpksCZ5pTwix5sf4jzA?=
 =?iso-8859-2?Q?5EMLzIjLG/IF3jO8EidTUOrVPd3/hdtbKBnUGGAPgV1uObUELj1HV7WtR5?=
 =?iso-8859-2?Q?jhNffG0BojwwSTyEUq/JOyUG1mFDQAsVGEt3cC02OkWvr8Hg2b7kMYLtmw?=
 =?iso-8859-2?Q?TEc4v72RNSsjnikVBdE/Lk/trNp6Ci+q3xhZmYrD2+sZjNEilf2O2Tm5Q6?=
 =?iso-8859-2?Q?rXaDJeefTcT0hmTVHZPJu0LxmwZB687FQtpQDTUWCyT9T+CX3cjWEJP00f?=
 =?iso-8859-2?Q?4HRUsiPIB3YDzLzgPVAv1cZsYIss/N8nEpbO7toq4YQLc7Q1jBy60ZJxbF?=
 =?iso-8859-2?Q?gtFEPXMHypm32ePj08JzFTGFrjWvC61bb/vGepa+GyHWtwaIrWPCxHRVcB?=
 =?iso-8859-2?Q?G8aNlC9ccQWEWoIfGaB8+3VxRFp1Nf5u6RI8kn8+o8vHbZxUMrboms6CTO?=
 =?iso-8859-2?Q?8QMMeCKddP8uTEvKPvBflJbC/utUS27/rIDrwkdjCE+q/snBvVuLNC9zGu?=
 =?iso-8859-2?Q?00U1zar3ki+6KIeaDWsqjPveRc7ePu2hP1cYLEXJmwFQuU71yOzYGs6+Ts?=
 =?iso-8859-2?Q?2bdvusy0gRJBO3F0RgXi9V6sZmsWjNiWXdV7FhvtOmJBa1/x4+mlNT71rd?=
 =?iso-8859-2?Q?zc4dhhOn0sfb4BMvoPhTizqkJSA13ahzp8pxYbGQW5n64SjmywS9hu9m4L?=
 =?iso-8859-2?Q?MiRb+i/MdIWlo+aeXugmngLWq7XO5aa9dXDPoDqRq6VklUwg0+D66ykoQk?=
 =?iso-8859-2?Q?Ityz9R3EB8AgLS5moq8CvP1q+cPyv8CMLQTgHH/AWNveLkIG5ofHPfrjQ4?=
 =?iso-8859-2?Q?f8y5LR/vppVJFEGuuphDL7caCiFVJe8ZvKu9j1a+w+E28N5a+euMXNKyEC?=
 =?iso-8859-2?Q?qbW5pVV5ZxAnWcqSHj3/BF8W77R07OZGU/csBdsjLcJfHdXqHgVzrTNodf?=
 =?iso-8859-2?Q?J2V2uAb4Fu4aI1YFycFoRBdKqqzy2QS+4CqWki9S/zUG27o09gNibydMt9?=
 =?iso-8859-2?Q?q1x5uEpLHOenhQgkRhYC/PHX/W4+IkCrekXj+yDg1adeXBGw6INzcTGs1l?=
 =?iso-8859-2?Q?DInqkXouO0pbJly3tDs+HepJk/5Bhq/C27GWO80aK7hjA0WZptxQ2bbQ?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb77078-0e70-4ed6-895c-08ddb550eb8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 08:02:11.0155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjlxsxJztKqL0VSCjzNF+3pY/6QdW1zhKmsYQC/hByM6zjZaPa2/4OU+0H3WMtNDxRMDOfDsRXR3NrtpDyuy3QUcldd6TM2Yo7U06TxsdOwtQY6tKzSZL8raYGLiYtTJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

LGTM,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jan
> Sokolowski
> Sent: Friday, June 27, 2025 9:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sokolowski, Jan <jan.sokolowski@intel.com>; Piecielska, Katarzyna
> <katarzyna.piecielska@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>
> Subject: [PATCH i-g-t v1 1/1] tests/intel/xe_eudebug: move multigpu
> requirement to test block
>=20
> As test fixtures are called regardless whether an associated
> test is going to be executed or not, calling eg.
> ./xe_eudebug --run basic-connect
> would execute
> igt_require(gpu_count >=3D 2);
> from later in the igt_main function, despite it being
> unnecessary and printing a misleading and unrelated
> requirements check when ran on single gpu host.
>=20
> Move igt_require(gpu_count >=3D 2) from fixture block
> to test block.
>=20
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_eudebug.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index bdf73c4e9..d2a1932fb 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -2923,7 +2923,6 @@ igt_main
>  	igt_subtest_group {
>  		igt_fixture {
>  			gpu_count =3D
> drm_prepare_filtered_multigpu(DRIVER_XE);
> -			igt_require(gpu_count >=3D 2);
>=20
>  			multigpu_was_enabled =3D malloc(gpu_count *
> sizeof(bool));
>  			igt_assert(multigpu_was_enabled);
> @@ -2935,6 +2934,7 @@ igt_main
>  		}
>=20
>  		igt_subtest("multigpu-basic-client") {
> +			igt_require(gpu_count >=3D 2);
>  			igt_multi_fork(child, gpu_count) {
>  				fd =3D drm_open_filtered_card(child);
>  				igt_assert_f(fd > 0, "cannot open gpu-%d,
> errno=3D%d\n",
> @@ -2948,6 +2948,7 @@ igt_main
>  		}
>=20
>  		igt_subtest("multigpu-basic-client-many") {
> +			igt_require(gpu_count >=3D 2);
>  			igt_multi_fork(child, gpu_count) {
>  				fd =3D drm_open_filtered_card(child);
>  				igt_assert_f(fd > 0, "cannot open gpu-%d,
> errno=3D%d\n",
> --
> 2.34.1


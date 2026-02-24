Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48428EFB81C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9E410E534;
	Tue, 24 Feb 2026 08:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rddut0Gu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C393010E51C
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771923310; x=1803459310;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9TsRD8ANyuz7zuBjESXeEqqKudiFyyH2EM2SwP5JoyE=;
 b=Rddut0Gudc3KZsGMGeohoUwOhTVepHnLeLq7Db9vE26Uz2Y113cjP2yA
 ZolhG6ANyZ00SZQGqhAhnuXWoW693bpqtgbwjEz75s84OAFeKvZxBufDC
 U1jZJfavEUbhwhdlOxwyEesCqmO/fVT6C69MdDi4Dw5z8VRU38kbory4/
 5oynilML1V61Eq4yL5R+bbkpMjwWJ/n3jbPRfVOgM+e2ya1mlId7YhyxT
 jC44qwCLuBT3UCIk94HLMdAXB0EonwP3nfjcX2fO6VZ14dGSV2HNlcU0r
 p7Dy6qEjwtt5JRnaAv1+ngtKG4QlR414io06k2go5VVCkaXRPf6KF+Qw3 A==;
X-CSE-ConnectionGUID: 2XmLl4iCSyGcQsd5SGi61A==
X-CSE-MsgGUID: SFOr68RnS7CTQxdwtPMXuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83554673"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83554673"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:55:09 -0800
X-CSE-ConnectionGUID: +N/BAJZZQ4Oe3Yknvlba6Q==
X-CSE-MsgGUID: NFMBB5tCSeSLHoDzjC4F0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220359319"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:55:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:55:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 00:55:08 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:55:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRATFNFeksQ0dESHutqQRbr7shcl52HWIcr1niKpFdZTxijZsRF7++M8Or/tYoYJoq14tMAIlvNWsEuBceP5eoevQa+jIcrenNeml/w7iw3w4XYPVbiJ/AstbCI3pAqbGHaSbjhW+CQekhYxUtf4xsTd/7q8AvgJrjPPOitrRW64RpNQnOjHiPmtbnuCY3pukpJ+K3yHb+3pQLlwUDR1GzOyfXr/jcaxlEY1fckiFI8dHaaC7poRogSIniU4nHnq+1emCLi4PoPSqyvTMy9HBlrt/W8/5UL4Hjok97LyLQZa9GT8fm6p/ysiiGqEuFqwlzN0H+gTFAjfIifMN912zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZt4Dmk9hPSNrla97Qn3Horye1pvwpKz1EOPAQ4eWTk=;
 b=bI3T1RnpG2gWPCPylU8wRHa3Gvimjt/VmkLVdlkni5Awi+Vq7jhX72+U+0mOVQyrFseztKXnJClI3HvKgD8/Goqt5g2fQCDRTC4NQEGnOBjZTFyQyZf0w1J5phSQ4IYVKcZkS4tXYopsdPZRo78qaNsCXB8WSlBiw7xAH4rXqj4ZA+3NVpbZiRxPyLuFOGDi9BK4Kntgsj1Ep2Dxs4LDuUqXdiFygLJc2hGOJ+ziUqaDYVKc01JLI93uAK3OJbwXeUMFWXlqDndvFDsKNW8AIycqwQnvaJyxlQLQ4ZeUX/OyKF9yKEpDdDuNFZnOfRMATjYNXdjB46WqcMGxY4RwsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 08:55:06 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:55:06 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_exec_store: Validate PCIe6 relax
 ordering
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_exec_store: Validate PCIe6
 relax ordering
Thread-Index: AQHcpU8fhinzB5/Hw0evqZwiLYrwKrWRV3jg
Date: Tue, 24 Feb 2026 08:55:06 +0000
Message-ID: <CH3PR11MB8434A321ED63C42E55EEB8808D74A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260224053324.2354159-1-nishit.sharma@intel.com>
 <20260224053324.2354159-2-nishit.sharma@intel.com>
In-Reply-To: <20260224053324.2354159-2-nishit.sharma@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CO1PR11MB4977:EE_
x-ms-office365-filtering-correlation-id: e28e13c4-56c9-4ae4-d1fd-08de73826832
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HYj2zSrO777ttB/tDxC2OlLwRQ/7xRjoWPWyShBNmEaHLvdSa8wEx/tf7xbf?=
 =?us-ascii?Q?iQgdKUC2iadvAXhU7VFPpGdEC7Y2/qR2UfEaW5RffE3fPSha/S4MZwUG0QlA?=
 =?us-ascii?Q?JTPjwJHxSXsqa2M8SqBQ4TwmuU9Z8/hzNLDOzWU6kZOtC7MgTLfX8Woixwzo?=
 =?us-ascii?Q?IAAGHXKeSxHwF+nN4tNSjchxTCgfVFQzG76AYdw4R0mp3+sPJTwPkEyU4Zyv?=
 =?us-ascii?Q?W1V96zXgwvNZgBgubQwSY+gcx8RiPK43Ujc5SFKyf59pI5yfhTu2mWEKt6JI?=
 =?us-ascii?Q?4/u3SQibl1aaNx3QYPOBkHyfa95gessPkgkNNu0Ns7KNaaicruRUtDeVH0cu?=
 =?us-ascii?Q?UnDnXnD20PzOKlbUlsz90y4EbV7lWigcP+WMhBbacl6YigVqazOjacNiwex6?=
 =?us-ascii?Q?lNXcrnuq98qps6ZrbTqEzxLkAF9EZGyXN0soupfkmgmsS7CHPOmdkrRwxMy+?=
 =?us-ascii?Q?dYgtieXN7wR1axfgh62J8UV+b4fIvTbxODfrGEBcGJHgsF1I/z5FVH6pIjln?=
 =?us-ascii?Q?ohketbRt0vq49LyizOsqBB+nAEoqngaXLQEjeAhtoSZ4AhwiiLJmqgu43Kae?=
 =?us-ascii?Q?PVSmAduho2AP6T48MAWHXz33DYCWqmqOdh+nJpBuGkiQuN2RsXhfryZFMtFc?=
 =?us-ascii?Q?xcmvapn5FO+OOevjpVwoNSxPjVnkPShmoiQjtLHPx5FpsURY4i7vlPN3nZtf?=
 =?us-ascii?Q?p9j2EUm+/ou7veTKi/i+vx6kbuYkrugoHrgUc7A5NH4NrtAhR49ZaUjEv02I?=
 =?us-ascii?Q?u7/UgaSLhpLHFnnf+tr3hYejYKsF3OOdDdmfgjSW5lG4ZK+pOH9mjc7NLftD?=
 =?us-ascii?Q?oAMzPZOJr9bsIWDEi6rkFwxMYwCFRXzi8xLHiDMVuyZxFqeMQWKPootPZ947?=
 =?us-ascii?Q?o75On0LEfnrESAn3gOFoFKKVxo34pfPmrgneEriKXKqdGKwGXie2AlI5w7CI?=
 =?us-ascii?Q?S3KWxY3Dk4NqRAqnpWLGaduC6JvP37MI++k9e4se78jugDGrhYkwDIfttxXP?=
 =?us-ascii?Q?/ElD/f9Pem5roOF4FN2E0sggTifeh0JtB3W47lRnGBE127PROr9Tpk8lkfLO?=
 =?us-ascii?Q?9DVwgGe+SFbz/maLxl6nPwCU6NldaZouJY93sduzIulkN1ibAf8O9SwqulmK?=
 =?us-ascii?Q?eYg0unvIBdxSWa/4pjqJhK2DiAWVrjmBPTuVcEP9tl85ikOk3LQnt2zcvkF4?=
 =?us-ascii?Q?Sf/Lls4Ba7GUfvFeTbpV+VAN+nuLLhJvCsDKVxjnqIbxGLMAdZNtPOg6G/an?=
 =?us-ascii?Q?rwx/auVY3m3WVrhgCKslLzs/yozSOBjysP3xRVjrvUds7MB9xxJJk5aAAk61?=
 =?us-ascii?Q?m7yxApoa9nfcgWr5JA1nGFL46ZcZ+3LEJTmX3AQekA7FK0HUCHgHRW/M7dSF?=
 =?us-ascii?Q?UzKGtMa2kE6qI5K8O0zkZs+DVCgRGgR2VufFxaR/CE+srttc++fBtYov/3fx?=
 =?us-ascii?Q?Iu2MyzuO7cYB7BO7tEROGtogy543cunfJQ7bBJa2lsM13bgmp2IH/zUhxT1H?=
 =?us-ascii?Q?FHBbYa7qIVyvKm+MdX7EE8YDG27oNuXley1BkANhM5fa7Mc6O+garqO5/9Xs?=
 =?us-ascii?Q?0cPIx6F1RlLn8xIqUsA2rYaKk1sU83Jzv1tAv4F/a1+lQqLa6VPv+2dvfHd4?=
 =?us-ascii?Q?PogOsGVJlAa+D0KOm46cmWo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O257WzM/WR6cL/saLsTLKrdVgSyd8q3sTU5Mit9lx1anjA0X/K3kWR4WZy4u?=
 =?us-ascii?Q?9kHrivmvaaIayVpWJp44EVj2gRnrmSyKCGb+FM3c3+SnJ5ddAb5SKLFX6+R6?=
 =?us-ascii?Q?mg+xfNuDIJRAnES4KW7yxa3z9Ugx5n9fdP90XKEZ73cV918KRNp8LMDnXrEv?=
 =?us-ascii?Q?fyXBTurCVc5a04PV7X1OO5JgR2U/n65DTCMjN04s/AmxTWFLU3W4aku0hTSj?=
 =?us-ascii?Q?qzvkeq90u0cIZLi8RTHnUNEaw+L6tJNu4eBvInB98EPDJcJ0OkX1xWPQ105S?=
 =?us-ascii?Q?q67j9RcnO/y3JYPuF97gAkvu6yTd1H/vNRJy6Nz9TisS6Qmy+eiXFARAfakU?=
 =?us-ascii?Q?AqWamTGsCMzr9qVeEKgU4p+SVaGdJ42jyNZnvQBlE84TT4J7N4KArh4icSdq?=
 =?us-ascii?Q?XQK8ALUhpCwQpCY5JSeC+USlfVc2y3cKpaRza0XWcOOl8nqf1ybbqLRooHbv?=
 =?us-ascii?Q?EaPBsyPcwwZ4JwGIdUfxfDDE9MMRMxj+1H4XxW5lnVl+GUyNBs9BkjB1STkm?=
 =?us-ascii?Q?M0zOZR9PuWr7LTmH8SuN7K1Eg6RNhNy4meAvM2xbRTn7W8ZIwU0SuVjoKLZy?=
 =?us-ascii?Q?xKHxJ4w/IvkgVuczSo4PcDBFKZDbNVBIwhQz/N5CJ2rIWvrssCOs4C/6Dsnr?=
 =?us-ascii?Q?Tz7rPxX+8OCWyeaRMLrs+Dkc1XVK/btlZV0rUpNVVstf1XP2AsnxvUo6yKWk?=
 =?us-ascii?Q?EMsM5N1FXzkxaFfArCsIxcvgvRZ4VrqdM/hHJYUAEBTgC3kx771xfzx1Rc38?=
 =?us-ascii?Q?Uuk/pUt+Zh65/3iUl3ekHVZwgWDEK4l+M7YSHBXQoyc+JlH6c3W2SVFpIPcm?=
 =?us-ascii?Q?jpYH27vpJPJQHPIsYPIn0RDHn5rj1awmjKGQNKE8sxJLMqEontveKUUBJiJk?=
 =?us-ascii?Q?vNSTRwfHpjA9j0tYSP9S7OgILyILYeDPWxb0Q+ZNHmOtYDVZ7fl+pusWMyQE?=
 =?us-ascii?Q?czz4Q4k2HMleipBZYgR5vDI6j3EaZHaK2DMmCN6CRxS05amQQQl77jHJeGDX?=
 =?us-ascii?Q?AtIuzme2IfCZS9I4ymW6zkU/Tkyv35BLXkAfe0/3TbVY0jT7vQzmhFctd7ma?=
 =?us-ascii?Q?0HKn43jas+PmrmDPR/ggbWAPT9M7+50uCfRceGVjqVMHcsYeU+UQpMB5+FcA?=
 =?us-ascii?Q?r3Jj6+aPfaF1zV8YlosLjYA6ImPpSmkCr30LBsrQmdXFjPwUH3jAO2m1SUE3?=
 =?us-ascii?Q?VS6fr/lfEes1LKLvefd4Pio6GU5vHUDXf2SWBhdkPaQORcOJpFOQ4ojTJyIx?=
 =?us-ascii?Q?6EDH98okvH8h3Pa4ZYiAASLd9UW551m+5aJW7Gm/5iV/FiArJ9Z2ld+Ul48C?=
 =?us-ascii?Q?yCD5TwM/rHDCirFDuBnNIlsPF27NiZHSeG1PN+5IMOr5ymHGV4iY7WW8ygrR?=
 =?us-ascii?Q?K66HDU4WIL7xNihGodHz+CP/V5T/tnRlMpfugS2hvtD9CxZlQLHK01HApvFL?=
 =?us-ascii?Q?PFh472g+chs64DiRTqOfXkRm6CdsJTUkE9iY+0MPST9CEYaqyp/Rt9bhKFhA?=
 =?us-ascii?Q?HsK9H8jF83LXTUhKrzfC33nxNmnIm8RlqLezBnQQZmFDVzxPQmtp3KVnkzOL?=
 =?us-ascii?Q?arRq4hgx3IDisohOQ85SxIwevSP6v34zsBTCkpZO4eATvTg4gJgUv9lnjnHT?=
 =?us-ascii?Q?QTjQkHkmQ2PEEBqUIlQhsJMqS/C/CJqivc3C5FKOzXXHL7g8FgrWpbTzyrqs?=
 =?us-ascii?Q?acrkMf9HN6u68ztgJfN5vz6MWrOI41s40MJ7XdU6SCSd58tRzZN+3avE+eIJ?=
 =?us-ascii?Q?jMcQAF5CxXbMIq+0KYtEM7TG9JbM0lMElRWqZjXXspvipZxPyIkC5sm491fA?=
x-ms-exchange-antispam-messagedata-1: 0BeE6RdV8FkK+GTyIP6J/SzNN0FgkxT5/WA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28e13c4-56c9-4ae4-d1fd-08de73826832
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 08:55:06.3946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Izu2ALdzpm0zZY0FqNQr9yBPbE0rCTlHbgb0xVQ/FKQDUXq7p5D0gLxMB5FgzzMzWx/KLotNPtX/qQ2DJaIarEShkIvVMGS1u64VIxEPdVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
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
> Sent: 24 February 2026 11:03 AM
> To: igt-dev@lists.freedesktop.org; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/xe_exec_store: Validate PCIe6 rela=
x
> ordering
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> To improve GPU BW, certain copy engine write instructions to system
> memory is using relaxed pcie transaction which can lead to out of order w=
rite
> to system memory.
> The recommendation is to use MI_MEM_FENCE for such instructions like
> MEM_COPY and MEM_SET to serialize the memory writes.
> In this test the copy limit for MEM_COPY instruction is enforced to max d=
ata
> for linear mode.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 140
> ++++++++++++++++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c in=
dex
> 6935fa8aa..1acaa5aaa 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -28,6 +28,7 @@
>=20
>  #define STORE 0
>  #define COND_BATCH 1
> +#define MAX_DATA_WRITE ((size_t)(262143)) //Maximum data MEM_COPY
> +operate for linear mode
>=20
>  struct data {
>  	uint32_t batch[16];
> @@ -412,6 +413,126 @@ static void long_shader(int fd, struct
> drm_xe_engine_class_instance *hwe,
>  	free(buf);
>  }
>=20
> +/**
> + * SUBTEST: mem-write-ordering-check
> + * Description: Verify that copy engines writes to sys mem is ordered
> + * Test category: functionality test
> + *
> + */
> +static void mem_transaction_ordering(int fd, size_t bo_size, bool
> +fence) {
> +	struct drm_xe_engine_class_instance inst =3D {
> +		.engine_class =3D DRM_XE_ENGINE_CLASS_COPY,
> +	};
> +	struct drm_xe_sync sync[2] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, }
> +	};
> +
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 2,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +
> +	int count =3D 3; // src, dest, batch
> +	int i, b =3D 0;
> +	uint64_t offset[count];
> +	uint64_t dst_offset;
> +	uint64_t src_offset;
> +	uint32_t exec_queues, vm, syncobjs;
> +	uint32_t bo[count], *bo_map[count];
> +	uint64_t ahnd;
> +	uint32_t *batch_map;
> +	int src_idx =3D 0, dst_idx =3D 1;
> +	size_t bytes_written, size;
> +
> +	bo_size =3D ALIGN(bo_size, xe_get_default_alignment(fd));
> +	bytes_written =3D bo_size;
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
> +	exec_queues =3D xe_exec_queue_create(fd, vm, &inst, 0);
> +	syncobjs =3D syncobj_create(fd, 0);
> +	sync[0].handle =3D syncobj_create(fd, 0);
> +
> +	for (i =3D 0; i < count; i++) {
> +		bo[i] =3D xe_bo_create_caching(fd, vm, bo_size,
> system_memory(fd), 0,
> +
> DRM_XE_GEM_CPU_CACHING_WC);
> +		bo_map[i] =3D xe_bo_map(fd, bo[i], bo_size);
> +		offset[i] =3D intel_allocator_alloc_with_strategy(ahnd, bo[i],
> +								bo_size, 0,
> +
> 	ALLOC_STRATEGY_NONE);
> +		xe_vm_bind_async(fd, vm, 0, bo[i], 0, offset[i], bo_size, sync,
> 1);
> +	}
> +
> +	batch_map =3D xe_bo_map(fd, bo[i - 1], bo_size);
> +	exec.address =3D offset[i - 1];
> +
> +	// Fill source buffer with a pattern
> +	for (i =3D 0; i < bo_size; i++)
> +		((uint8_t *)bo_map[src_idx])[i] =3D i % bo_size;
> +
> +	dst_offset =3D offset[dst_idx];
> +	src_offset =3D offset[src_idx];
> +	while (bo_size) {
> +		size =3D min(MAX_DATA_WRITE, bo_size);
> +		batch_map[b++] =3D MEM_COPY_CMD;
> +		batch_map[b++] =3D size - 1;// src # of bytes
> +		batch_map[b++] =3D 0; //src height
> +		batch_map[b++] =3D -1; // src pitch
> +		batch_map[b++] =3D -1; // dist pitch
> +		batch_map[b++] =3D src_offset;
> +		batch_map[b++] =3D src_offset  >> 32;
> +		batch_map[b++] =3D dst_offset;
> +		batch_map[b++] =3D dst_offset  >> 32;
> +		batch_map[b++] =3D intel_get_uc_mocs_index(fd) << 25 |
> +intel_get_uc_mocs_index(fd);
> +
> +		src_offset +=3D size;
> +		dst_offset +=3D size;
> +		bo_size -=3D size;
> +	}
> +	if (fence)
> +		batch_map[b++] =3D MI_MEM_FENCE | MI_WRITE_FENCE;
> +
> +	batch_map[b++] =3D MI_BATCH_BUFFER_END;
> +	sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].handle =3D syncobjs;
> +	exec.exec_queue_id =3D exec_queues;
> +	xe_exec(fd, &exec);
> +	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
> +
> +	if (fence) {
> +		igt_assert(memcmp(bo_map[src_idx], bo_map[dst_idx],
> bytes_written) =3D=3D 0);
> +	} else {
> +		bool detected_out_of_order =3D false;
> +
> +		for (i =3D bo_size - 1; i >=3D 0; i--) {
> +			if (((uint8_t *)bo_map[src_idx])[i] !=3D ((uint8_t
> *)bo_map[dst_idx])[i]) {
> +				detected_out_of_order =3D true;
> +				break;
> +			}
> +		}
> +
> +		if (detected_out_of_order)
> +			igt_info("Test detected out of order write at idx
> %d\n", i);
> +		else
> +			igt_info("Test didn't detect out of order writes\n");
> +	}
> +
> +	for (i =3D 0; i < count; i++) {
> +		munmap(bo_map[i], bo_size);
> +		gem_close(fd, bo[i]);
> +	}
> +
> +	munmap(batch_map, bo_size);
> +	put_ahnd(ahnd);
> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, syncobjs);
> +	xe_exec_queue_destroy(fd, exec_queues);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  int igt_main()
>  {
>  	struct drm_xe_engine_class_instance *hwe; @@ -483,6 +604,25 @@
> int igt_main()
>  		igt_collection_destroy(set);
>  	}
>=20
> +	igt_describe("Verify memory relax ordering using copy/write
> operations");
> +	igt_subtest_with_dynamic("mem-write-ordering-check") {
> +		struct {
> +			size_t size;
> +			const char *label;
> +		} sizes[] =3D {
> +			{ SZ_1M,  "1M" },
> +			{ SZ_2M,  "2M" },
> +			{ SZ_8M,  "8M" },
> +		};
> +
> +		for (size_t i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> +			igt_dynamic_f("size-%s", sizes[i].label) {
> +				mem_transaction_ordering(fd, sizes[i].size,
> true);
> +				mem_transaction_ordering(fd, sizes[i].size,
> false);
> +			}
> +		}
> +	}
> +
LGTM,
Reviewed-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
>  	igt_fixture() {
>  		xe_device_put(fd);
>  		close(fd);
> --
> 2.34.1


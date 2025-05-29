Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D628C54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 21:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B157C10E771;
	Thu, 29 May 2025 21:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUxIZJHA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F4F10E791
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 21:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748555317; x=1780091317;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4PQuB8CzCH0UOk+wzcRz/WkNdSO3m/Nq1484lo2BQ/Y=;
 b=cUxIZJHAxtS3JRsO4YKAEhKMz5QmIAaSVT7LsAwZZcn9SxjLE/mB8fWH
 70CCDIlru7ZhRPebHqT3IuW7K1iWS7mbDaTYwvo7XvlZOkmVAfoNV3Hdk
 iNjjO8C0VlEVco7d5vUcEnEGFMu/sQhLLPr4QHmFZY8a/eVlYC5BTIVMr
 nmztsOoUUdH7wSSwfzxb42c++Q1O9We4vY+TtqIRh5gMbI1GWQJfNkQxe
 ZQp8eDR7jsUd1sMj5CxVKx9wHWMvDSmzk5vlwWM8Rq5KlguvHsVOWtMGz
 JjddZeWDJuqqa/Q1Nv57dlsuSkLQl47qqwDt0JXDo5H4c4LO2nCqStSxZ Q==;
X-CSE-ConnectionGUID: OaTVCMSPQOiWdhNJHnpXIQ==
X-CSE-MsgGUID: 2fEnN3+1RCu0P+i6D/Fuvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38263375"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="38263375"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 14:48:36 -0700
X-CSE-ConnectionGUID: F4qmjvuUQvC3ZohbS/YOVg==
X-CSE-MsgGUID: xP4d3PDQRWKJ4ZI3S8ZhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="166854504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 14:48:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 14:48:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 14:48:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.83)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 14:48:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sai1Kv5WcsAEQws5z1D/vpT+sH69+JiZhkrQFApkUP8w1wW+9M1F92D2G44Y9bm7OY6Nyrz83v/cJsxDmKvruJuNQnPMX/Xaow44NWuBdO7yY2LPSFt5xNfBrN7r2JqEI2gJJr1DCP4ii7BE+P0SIPlrY8Fhj4WmrLyyfR3ffIq1iqYm7OE5WRDewUzQl1lBcJ6vnXMRO1auw9Z/WlAJJnn+4WhH48IAM//+VVy5RffJXV2HfYd7CnN12r3O6ECQLIl5whzCXzwKI0vB6AgxxZo5yAWF9R6cSL9LmrynOaVdnuO94N42b9I0CD+4CwVTJGQAwlNHerHeh34lVpdmhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K04X1aM6kmb8rCLs4CDEcaRlRw9WvlFgOZraKazgXFU=;
 b=AXo+QYXI6cX6t7Rq4hZwSX4GqyasWNMXORGkupYg9RmQd7qHMKotsFQt+6owvNyTJYh37OgQFPA3y2/OpOBaHOg/fPD7muGhzsHxNV4bG5uNY1zweKlvxi/D+lUvon30Et0/zCA+Hkw+jWmqRLvTMD+Qb4QPZALqz1z5AOf6tXY4dFDmRcYVeU0CPwl4K4tCXh6Ksvep9Wb5Cs4T8QEUxn+dGiHdUiIz5boYDlHHQdg9MjJ9lpGDTSBADjBZbULnruSlTuNRz1+zCJotGPzdyaHH0szwizy/Q1ZsAP0ECYtLd62Fh1WENfu2AYMz5BjGKpKdqY7RyfeNNDlSA+Tajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB6995.namprd11.prod.outlook.com (2603:10b6:806:2ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 29 May
 2025 21:48:32 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 21:48:32 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Index: AQHb0JvCnpB9WjrebkeSiFKJEHnUQrPqCzmAgAAR3YA=
Date: Thu, 29 May 2025 21:48:32 +0000
Message-ID: <CH0PR11MB54442A56220EDDF9DB18A52DE566A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
 <bafb3f48-e1bb-4ed4-8419-dd5e85875795@intel.com>
In-Reply-To: <bafb3f48-e1bb-4ed4-8419-dd5e85875795@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB6995:EE_
x-ms-office365-filtering-correlation-id: c4f5c434-51a6-420a-1d28-08dd9efa8e39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BTq0qjOfPZMzHclENyT8MoV8I/tk7RnkGza7opkIAL9nKpm/+aic3n8VBsKb?=
 =?us-ascii?Q?+Rp7I3QHK6onmYRmWuVZlRlX09sZUarXIwBD+Rs3FdXj5uB939/XInYLdEgw?=
 =?us-ascii?Q?D5FGKvZCd9Chv5i4vMXJj39zATdDOoqx01WWiuTxvUj2x0jdAVrUculrlSyc?=
 =?us-ascii?Q?NJW41Y4lkO6ii3zYGN//XdnTvLIO1T4UE6PNuyp+H+tN58moJtd9xwNOd1GH?=
 =?us-ascii?Q?6+LfZk+l0VlfUzup5P9xxDZv0hB7yWe9OQ/mK7ipc89fs6775/J6/IGJYpiH?=
 =?us-ascii?Q?VzjchppWvqUGTD7j3rTtQM6aANVaPeTHTbt1NkaJui49PKMDmgQti0SkWo3B?=
 =?us-ascii?Q?F1RZkPMn1vOjgekLan+mqWq9Qz9aITMH6xWdGhOygegPvwI6B/BZxEa3i+6j?=
 =?us-ascii?Q?T73cOzkloVwKIUTQ4jHLKPV7BNAEhiq7wG+HuKjhOHejOGuBLELypaWDl4rD?=
 =?us-ascii?Q?pYf0DaXHbDJuCEYV9XNPW27EVT8c5Ifb0NK8TADm1Wki/qnI4vpqFWHigpvo?=
 =?us-ascii?Q?OUq0zVpgHa81zv/4HowFd38ieSaFQmSe1KTz6syfM4MKJ3vsoSr9x8aoeXSC?=
 =?us-ascii?Q?oqkUqO7aovhaaw7SjHuBhZMltjdGx/acVpd1vLbo9OjZizTdVm7s+wr10WxP?=
 =?us-ascii?Q?G7UfSga3xrfzRCHGv5FrQG7dCauLyPJOLb9cK+VFsdKAMibwd4Fdtej4olq2?=
 =?us-ascii?Q?odtQei2P6aVtFJUUaz8arCtgmlt+qNFyVjEszWKKPONsTl1KK+m/TVz828Qz?=
 =?us-ascii?Q?YAP+KLmQum4IxHhB1Fl29S8TI8R+aLqLyVVKKk4GiKTApvx+oKQRGmrt7cgW?=
 =?us-ascii?Q?qnk92OCLceUqth9pUTQMvSl1dclkgPFRf+ubdFTo32boVe5b0fkzu9FDuQtZ?=
 =?us-ascii?Q?CVG5Ahsztt5HxA5zipSacrFicZNcL6hIM7PhUKepRMoKu3pEAOIUddL+oLX8?=
 =?us-ascii?Q?lDaEoaLgUAOKN88E9cTSIZnPAWUUpDjfnQxXlSaEBkX9dRuVXLfx1lE7EA1g?=
 =?us-ascii?Q?yF5JQKUac00oTqy72fqrNw4Y15anmiKVMdPGbjbcg6dtNbr8HqfClVshPCjT?=
 =?us-ascii?Q?0ifYfGcuE7gmCFblDSMWv2uVG9UgnR8XD7CJ3zMzkc7EM6qPaxq+KjaGCU7J?=
 =?us-ascii?Q?PlgLcYPTGw2pHkqzUx5B9Dti9DSoxC9+D+FktJ23mHJzS1P45Xr/1pj/PftJ?=
 =?us-ascii?Q?URh3X4wWFSz7PwORJ28UDfnTfUsGojRijkeEZLl+oQH3QadR2f+f77mxI9g8?=
 =?us-ascii?Q?DX6kxzhDxnVcsTsmAXnr5ygAnoX/h7pz/VghVVqSe6EGrSJp5EkFDxR21ti/?=
 =?us-ascii?Q?J4h77h5puFIa7Df3kYJg+ZQwssSkiY29Bd+h0y2WIx3THY97rLEit08djdHI?=
 =?us-ascii?Q?Xia2Wz29fmWG0zJAWk2HF2Y0pBBv7WZ5YodItWvp5fw1AWBTCEWivGuMuNae?=
 =?us-ascii?Q?e9R3rvXyi7D9jAMvlvWxUF7JPIKkTcb7j5JI9b6xTEZbcfF867S5oUmBGomF?=
 =?us-ascii?Q?je4wLopjT1E3tgk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gMHkRDyVKir5ocC5TAs7xHqEs15tiSzeiLVW7UZGJ2X8hxeTNWwXrWn4TWbP?=
 =?us-ascii?Q?lRtvhcBtMLLEsU4Cyz1/Eyi0w3CR9lWZSrnbUR+YI7ZXLIGKD+3ev37xThjM?=
 =?us-ascii?Q?lfQxgw+BSLTCdhn35qu5+T504EXkb2T2A+VEj9O0nz9qAkB4wQa4Ymb6nPxh?=
 =?us-ascii?Q?MMVnmy1R/zR78CL2Ud01HPX1C8HdYAPVJZHwgCzLxJGekzkGL2FhdP/9z8M2?=
 =?us-ascii?Q?mLIC550ScC/l8LaF54hztrShzIiDWJD0sZah7zCdvqYfWZh+Uph60PinbrIr?=
 =?us-ascii?Q?RGWw+/mEPRu/K94IH06/u86NJfTMUCC9bhDsJlrdISr0AJDAI5TU2axDM1W3?=
 =?us-ascii?Q?voydQEdlewuBPeOIAgsnFSihTPgkbOKsn1Rs2ILyaJHF3rovKQjYLbPDHFbK?=
 =?us-ascii?Q?5T5nnqOXFPWccsa9cRpLcbK0z441FWdlMQyPptrg0eNjydOc5x86DxJlMWjZ?=
 =?us-ascii?Q?6LqM4Wu9ftlhwihrgfXh4cOj0bBS0e3469s+qL3i9oE/93piPvIdvYFkWTC0?=
 =?us-ascii?Q?9Q+k62/CDi1NH1Sl2Dspx0N1b2IxpczoMcSEwJxbtYw6V9beDeOcZ8eKPP+c?=
 =?us-ascii?Q?cqsNLx9jDNeMSRqREvX3At2w+f8FLjUtYl7zlBWJpWglc8vT/upMle3y7trH?=
 =?us-ascii?Q?wcqjvN/ek/X2N00wQ4q/qIWErMThthQ+s+Zr2TSTpLekZ1r2og0mHo6rFL36?=
 =?us-ascii?Q?OvHFA4hPrzpyhDwFw48P2mShMlNp09RMUsP3/9XSOBUnd33beDsAyMV5vPDj?=
 =?us-ascii?Q?DUb7s3xj8RrFlT3QIRWYxkkbSS83bZU4YTdqwBcMA4542YkuvSKIXG/5Jhh/?=
 =?us-ascii?Q?hrkxW6hLpP/J2O7ivS6EEjBbM8Pi6nlp0fPXjVTH5pfQTbS3Ia9Du1NC89oJ?=
 =?us-ascii?Q?dfHTWhSDNqF5wU/EVVqfZmXLJ8W04gBQdwJI6GRQKvbsBmepGiHdZ6p68AJe?=
 =?us-ascii?Q?UWsWCYf5/YgY07HIYSra/wK4+erdHDHZWo0KwAQYI/sWLJStJZaUNQfTNeNM?=
 =?us-ascii?Q?SsfBvCcH0lZIzIAbQPGk1EIJ/FheGDg9e2VzG20ECdUTmtSufxYpcUwNvc6T?=
 =?us-ascii?Q?qlAx/WsmvRKUiC9ojLfqV5dC58VsMaKpoxwbhfgKs+eTTf1VWTAnl46ImffJ?=
 =?us-ascii?Q?sP83inzkwcZ8UGl7DyC8Bh5iKxtYOziWil+WBsvoHPseXxwzVXVU6y55NyYG?=
 =?us-ascii?Q?wa7YRf7Yq8dFlMqjZ3Ntb/AgbDPUah636cGrBc2i7DUQQK1CDdiSspoDb1AL?=
 =?us-ascii?Q?eKWvf/zDxPVIX6g2ZoTv2VnuTupeWLN0Zl67012jCSH0aM0A3DU9tuxlbx3A?=
 =?us-ascii?Q?L2NyDCPJhSd8tQM9AOGXC0elqG9ac4aoeJVWL2Qlp6ZOd/fUKGRMLpPv3Hok?=
 =?us-ascii?Q?23rOVusS3y+FNgBT+zOWauAXAbW9hbkce6HIOnq35ZsPkexRx+xjYhWjNAim?=
 =?us-ascii?Q?p0cV6iHaaBhHcvDxgs07nJDNgz1+8LG4HZxhfUDs+UbIvw7aypCrKR0IJges?=
 =?us-ascii?Q?3cvCZaWpjE1LaAHN3zmaQ7nUIxWWkNbqnQzSxkb4lrFuvs+VTKdSJh/dXi0J?=
 =?us-ascii?Q?EYcS6WSyQj29E/ouJoA/T+kdbV31N9tCq0+ywza1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f5c434-51a6-420a-1d28-08dd9efa8e39
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 21:48:32.1530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2qCeBZEMj7SSj5mdXznr7lcRIQWl6VGwA1PHQQdoU9q3dcNgKrPS4AeJNBHUto43aTJJ+RuM1WySdUhZaFBPXIoT+eXzD4pVGwkmW9Xd84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6995
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
From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
Sent: Thursday, May 29, 2025 1:14 PM
To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-dev@lists.fre=
edesktop.org; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
Cc: Dugast, Francois <francois.dugast@intel.com>; Cavitt, Jonathan <jonatha=
n.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all error=
s while injecting fault
> On 29.05.2025 15:31, Satyanarayana K V P wrote:
> > Currently, numerous fault messages have been included in the dmesg igno=
re list,
> > and this list continues to expand. Each time a new fault injection poin=
t is
> > introduced or a new feature is activated, additional fault messages app=
ear,
> > making it cumbersome to manage the dmesg ignore list.
> >=20
> > This new patch automatically ignores all error messages from dmesg, eli=
minating
> > the need to add or maintain a dmesg ignore message list.
> >=20
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > ---
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >  tests/intel/xe_fault_injection.c | 35 +++++++-------------------------
> >  1 file changed, 7 insertions(+), 28 deletions(-)
> >=20
> > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_in=
jection.c
> > index f9bd5c761..0dffbe5da 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -64,30 +64,9 @@ static int fail_function_open(void)
> >  	return debugfs_fail_function_dir_fd;
> >  }
> > =20
> > -static bool function_is_part_of_guc(const char function_name[])
> > +static void ignore_faults_in_dmesg(void)
> >  {
> > -	return strstr(function_name, "_guc_") !=3D NULL ||
> > -	       strstr(function_name, "_uc_") !=3D NULL ||
> > -	       strstr(function_name, "_wopcm_") !=3D NULL;
> > -}
> > -
> > -static void ignore_faults_in_dmesg(const char function_name[])
> > -{
> > -	/* Driver probe is expected to fail in all cases, so ignore in igt_ru=
nner */
> > -	char regex[1024] =3D "probe with driver xe failed with error -12";
> > -
> > -	/*
> > -	 * If GuC module fault is injected, GuC is expected to fail,
> > -	 * so also ignore GuC init failures in igt_runner.
> > -	 */
> > -	if (function_is_part_of_guc(function_name)) {
> > -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> > -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> > -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
> > -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENO=
MEM");
> > -	}
> > -
> > -	igt_emit_ignore_dmesg_regex(regex);
> > +	igt_emit_ignore_dmesg_regex(".*");
>=20
> that will filter out all messages, no?
>=20
> maybe we should look for KERN_ERR level messages
>=20
> if IGT can't filter by level then at least look for our errors:
>=20
> 	xe 0000:00:02.0 [drm] *ERROR*
> 	xe ... [drm] *ERROR*
> 	[drm] *ERROR*
> 	*ERROR*

The regex for that would probably look something like:

igt_emit_ignore_dmesg_regex("^((?!ERROR).)*$");

The above regex should filter out all CI warnings that don't contain errors=
.

>=20
> and we want to catch/report all warn/WARN/BUG without just relying on
> taint (and WARN will also catch our xe_asserts)

If you also want to catch WARNs and BUGs, then the filter would look
more like:

igt_emit_ignore_dmesg_regex("^((?!ERROR|WARN|BUG).)*$");

Would either of these be more amenable, Michal?
-Jonathan Cavitt

>=20
>=20

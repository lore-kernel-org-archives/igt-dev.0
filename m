Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB98DC369D7
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 22:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B3B10E146;
	Thu, 24 Apr 2025 22:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vg9JkJn9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E6210E146
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 22:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745533969; x=1777069969;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RKgTn3XmtJRkpZ1W9rapOcZ9001/soV6DPzOAruNVhA=;
 b=Vg9JkJn9IT7xsXnHcNN9QmarHFa5fIDvCZ9JW6HZIicINRRKWWYfFja1
 bS6TBsYrEJI8n4Ia2A77L7gA2rQXXWqaP5lZDqq+5rzSZp2U6V0nqBgty
 H5mn6TxXqb6mn/sqIprPMstaixL04BQTwqm+gRLhBcTOKk06u5kw2+avv
 MUAeOpW+i9PBvJGw9LKpTk+AEbEjNNyx6SS6ZJ4C3y6ToTophtcmWQP9p
 ikKtiik58zhaEY0pKJ9L92567q5A62rMtOyXC4ecO/GPGdBuIfFXQ2fi6
 ajZMtu1AC8W7VH60zYUb/HCddUy/AsMwVY4lfmf+6A83aDanjGWFsEteM w==;
X-CSE-ConnectionGUID: jJYLmXMsQNuStQnzTG7zzw==
X-CSE-MsgGUID: bq9TQhneRA+udxFHMjrGmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50854225"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="50854225"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 15:32:49 -0700
X-CSE-ConnectionGUID: XQz/jKDYSSqCry07G5TiFQ==
X-CSE-MsgGUID: mh6UyU0CSuuJzb+IhAW75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="132481196"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 15:32:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 15:32:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 15:32:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 15:32:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dta9K3Wcm2NIPe/xAtCA1S3IPHCDlsKmyaHSmv6jqiJ7h0m5Y42732+4PQTEpunu3hkfu8EB6kq1giO/c43zupDBoZIiCmAW9J72txCCpQFEr2AA7akYNgP9YuOnoTnYMBpCeIoKAzfC9+i5EE80U0M0wFmwlPOrdeHxskVqkbtY/6LpmvmQwU8Cl4i/z5RbtPxZNZGHvCHLztoygam6hhFjmu4xsPHO9lfoF4avBKg8L3VwwyJZHzuOgq//ZSUa/UuUP+Rs9Ovy1Px8wQFGqITOmJjLV+FjGBsy/29jKsfU9GHM4UZ1lzVzBrMQsJrY1f+LYw6L3RNSac9pXnAYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaxaEaghhSQAL0M9Nmjc2FPcntarQHLqE0rd1D3YqI0=;
 b=cTJ6yC6uP1+v1WhV30VPiqX9JJ4gaD8LwKso24YECzOM+B35SLm+b+73eqpD5lWGGoTkB3FcHgr+EeTcJvvGLLr3oU11SRdFkQfyY0iyVyoGX/ju/tmdwiz0T/ksov2ZoPXBzY07AoyNZ1Ju34PkVbDP5p9J0ppf3oiWfUdFMS68EvGNEs7wjlfuJpJYNDjumafwSvDvL6D4Mk1sKPgRku+JE4oA+3gPtKVb/WYxM8YDlLIx2j1+0DJGp3kD9WzeHWLteyy1I6Ozrq/TiahwJNR5h/iOW8lelt6mpchGQvtK/723fnpejyY4o8bnQKsLTCJ5N3b47jzIuE5RYiDzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 22:32:06 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 22:32:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 2/2] tests/xe: Add system_allocator test
Thread-Topic: [PATCH v3 2/2] tests/xe: Add system_allocator test
Thread-Index: AQHbtVl/qsuLJmZHC0uYOL0Yt+XETrOzVEDw
Date: Thu, 24 Apr 2025 22:32:06 +0000
Message-ID: <CH0PR11MB5444D3BEF888D4AE308F3ED8E5852@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250424204406.656794-1-matthew.brost@intel.com>
 <20250424204406.656794-3-matthew.brost@intel.com>
In-Reply-To: <20250424204406.656794-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4574:EE_
x-ms-office365-filtering-correlation-id: 31ae413f-1a6e-4772-201d-08dd837fd7c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dirkZwZkyVCFPR+y3EVOW55VZ0BAqlZVmFqRN25BWtb3wr94XE2GN5vkGG2P?=
 =?us-ascii?Q?HMLvoD6yKbzE284skayd8xenbR8OpHPIIJALyS0eM40IIm35JEl2Eyvs+ulP?=
 =?us-ascii?Q?R79Cfg15GvZ+9fRZm4YVnbD0i0bnoiQLe8+LGtdoU9D1yt3FuPu/3GNDk/ew?=
 =?us-ascii?Q?ZEpkhb9SamVKR/5bjORmOxmeabWGi/vk+VWgc+UKKhvQaKgQAicQDlCYu2aa?=
 =?us-ascii?Q?Ph5Ub8WhLvF6CFKYeetGByTDRw3D31NsYwCSdJqBQsVUcsgzjE+H19mXRp77?=
 =?us-ascii?Q?T8hwfwvVwOvW68EHeXMguKajEiEipUdKuqnwhPli5TlFOYB6RjXBgAT5NaOB?=
 =?us-ascii?Q?3/DgKES2KDoCDS7eSMA2J1xQrHJ6Ys1zL78CFl1JSc/Nw1ZSrSAdhpTzxC4n?=
 =?us-ascii?Q?AXe2gaJqUCuc7rHK6g1eQLkSVMEiuZczgi5p5rk581kySp3GPskhItO2BqG5?=
 =?us-ascii?Q?88eQbKtyZJXbZUPMB9fiMrQ/FW572KU68E/9tE5xlZGt5bHCKwPcehIcHMS1?=
 =?us-ascii?Q?mGfG0dP5Q7iE72rnqsMgCJEunU0/YJFVFjXoSTtiY0fhn/t4wktCzJyRAOoe?=
 =?us-ascii?Q?Did1hKyE02cY0CLOK42OOwTuqDkmLTvbBPORD4cm9p56OcJEDIB8KktnEw9P?=
 =?us-ascii?Q?u1D1XdGQxc2NveNX7ztw2sO6qde+Ucj+kzBHcstoEdWuqr/qZOVS28jfdWSu?=
 =?us-ascii?Q?VcY7E3016mNQ99SQlQfeOudNzrzJeiIE2hMT60cacT5PYiZ/l4NZFYHmu1YS?=
 =?us-ascii?Q?0N/XHUoowQ3NNRfZ7V60ex9POZKK8/ZRfLsEO6srOxE5ddwRMg6QE9aeEB4H?=
 =?us-ascii?Q?oBWPzJd2ZhjW4+YhiwcLrrZW155CaWu3kvSjycgH7GBjzUGhOcwrTWfcB0qc?=
 =?us-ascii?Q?WpUikcug4BhlwW70lX71SU4yPzTc2VjQA3jICNK5OFIae8a/oYfxzgirmImQ?=
 =?us-ascii?Q?BFoGyspuoZWXRc0CBtxCPwgPEu9pn6a0d0Fv0B+ynIW3bUd471EbwpGYV9eP?=
 =?us-ascii?Q?MKcVT5Mb2MkW40zHj28otesm5dZAgtACCEaVRb3kcq6CbIEou2KoYOWLAD4N?=
 =?us-ascii?Q?NjputQdrttvIQSynsw4h++D8a2qyVM7yEIpI3yhO4/YmScs6a5Rac+RFO6LZ?=
 =?us-ascii?Q?EkbMCUW6xDFbPLxLbECgBOZlhKFziHA++zMAna/hiFg7cZhzxjw49AEeQIiI?=
 =?us-ascii?Q?gvVaCmp3jYsEsPL+q04UKyf7+3fzHHfvueSbWfmC9lLP3IGvCrYuPMA6Y4q+?=
 =?us-ascii?Q?sBLVICL7O1OGhAngpJQ1tuf27jW9MNR939IRVJnK3wnMLEk9/TFRTUkvAETl?=
 =?us-ascii?Q?Z5/Qg4QSrQKftZQLTf7o7UzFSVKHBhzVg1HbDqwbVfYCaa9rZI2u1VgS/Drh?=
 =?us-ascii?Q?XV4nuLohWjBcJCkZ+nYvAqZQPSH/xIFGVVEqaH/SVM+lAc80MGOEYMHKClJm?=
 =?us-ascii?Q?OkkUTUjV9TBBqj0/MY2Xp1iM7belLrzPMqwwwq6hYBe+EbL/exraNGtEwqi/?=
 =?us-ascii?Q?kTB2YqYx3t4eWSs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cVKWaUop7a2d81AF7KH3iPryJA2zx220aoNw2RGSyJ6/huL4QQloBHlf+ush?=
 =?us-ascii?Q?RkF8SGAGpTMHPbBeR0oB8GAovGCcyTswyxwVvPoDffjD507btoCi2wgxKNeX?=
 =?us-ascii?Q?lUxbR6pVLJ6GecBsXFLpMIXnefiXZWQPTOsv8aBVn0Zk9XvA4Gw4l2JMsvoM?=
 =?us-ascii?Q?p+Se5RnwfzKg98b2qn4fyBsXyF6AAkSOFC9hqtyxh2YEvZS//zOKg2hsXdhM?=
 =?us-ascii?Q?ZU0/6WtP622ldDPTYECCVPcjNfhVw6RqUhFMDDOpPp2o8DlOKuDIJDeJWgu0?=
 =?us-ascii?Q?0iO2raq2Ed7PsEC6OqREuG3Qv8JHA4Z6Vd1VD1UOyQyLx4TiLjYgE57w3mtB?=
 =?us-ascii?Q?hKj967q8wQNrJJMHvXzyO+Nx41/9IEE7/yBeoN73s1khFezxTQH03+iQ1sbV?=
 =?us-ascii?Q?4fG5nZ4yuAf1h4/QRdLFtzifkJkPiqpArSbuClBgRskjGXYojff7AKkOLbF7?=
 =?us-ascii?Q?IqyDzKq5giTEDFe2fGDXNiG9s0zpAixPfcNiKscETD4hoNSBnFj6yfPAdZox?=
 =?us-ascii?Q?L+WY4i/DukA9l51KyBIEk6nY0oWT+2xDOwhjpYiczKpdBfKhZKdnstFMtmvy?=
 =?us-ascii?Q?l6Y8Qk3zBTqFP9DPXjITyqFWCG1jWHgHauw1Zxjc6Yqy7k1RqMfzhPzkjcud?=
 =?us-ascii?Q?JjcO9oygrKWo/XSWjWcGIPkGU7D+uSasLZd/8jCyWfLICb8jpWJtbgOkdjlj?=
 =?us-ascii?Q?yUozb/pOCdcXD7I9Gz23IMZSCfjpJccCJOgRW7qB7daswKf6AcZ9qTBIhQej?=
 =?us-ascii?Q?s6EOjc+dwVPtI4kP8wFJmG8fmsFdIaj/HcGJg/TLLr0+oGP1+r+HjUX1QkKh?=
 =?us-ascii?Q?EKnxVwG/0pvch7mvCwYoBkILPONJOWerPdWcw7G59y0GmZQY0D+1F3IbiiOp?=
 =?us-ascii?Q?B/4FeHjZT7FEcA4ggIOXPxBk+6QwRwj1INMZ3ostYcdj2YDTDmMxXebSeWqW?=
 =?us-ascii?Q?xADG1fuh7Q9fOUcFZcLRzUJ8zXHw79k72rNlbwfkNt1gHYBkiwm5PsXHidYC?=
 =?us-ascii?Q?FvNSe46/s/2U10o3QLrqqehFzk+0ZHXXVLh3QYni3JCLkJJ8OycE04YHtqz2?=
 =?us-ascii?Q?DNNaqF7p6jeDrCapHrgXq1wU9i1kkdgXe9/e1/ILGBRObE4p6adzA6crymNc?=
 =?us-ascii?Q?qNCyFG06GSdKw3MKzpWH4zd2l1sSzdvVzdvnpMY+FdSrpQmuJyxUEG/B/NeJ?=
 =?us-ascii?Q?+J4Iv3AWyaRlwzA6p2NIU6PQrwg8GeiSuUdTiW9Bmcwwkew6BPPkt2CwroHb?=
 =?us-ascii?Q?SA4UHnRskGh3In3jNbgOhInGbylAwoxv0c2cezc71BMZqmY+T/i4X8FZPzZX?=
 =?us-ascii?Q?nbuYDFCZCK08ZTMGjnxXW/pspqfh2nXrhLKO7oKxYkGde0sZBIsyieXyemEj?=
 =?us-ascii?Q?L1gRAIdkMtEeGgw2zSuqAw3xAhEHBj8C5IKuMDXwnVmj3vCnNCCJ97ASj3vV?=
 =?us-ascii?Q?ny3rskJOn2NA1E4WzJ7Op5e/A2PV2AHu/5W9vEs4P5kIecAVgbuNw3he/otL?=
 =?us-ascii?Q?tNrL2PST/F7wtZVFXMWGjic7YnUSWTakFzKR/wGlUEBAhu8BWor6D+h4ERA2?=
 =?us-ascii?Q?OyaFvU14LGZnF/IN5FRzRVegW5dWmWNw03aqf8+F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ae413f-1a6e-4772-201d-08dd837fd7c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 22:32:06.0466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oax/rtfWjRWbuUieXu+/b4Lad86q+I5R4CmmxON46AbqiYlfXSx9ZCREAbiPniFFMA0tORCih82G/m2u1HlQH6NGX1ak9bsrMmi3ekIRRpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthew =
Brost
Sent: Thursday, April 24, 2025 1:44 PM
To: igt-dev@lists.freedesktop.org
Cc: Dugast, Francois <francois.dugast@intel.com>
Subject: [PATCH v3 2/2] tests/xe: Add system_allocator test
>=20
> Test various uses of system allocator in single thread, multiple
> threads, and multiple processes.
>=20
> Features tested:
>  - Malloc with various size
>  - Mmap with various sizes and flags including file backed mappings
>  - Mixing BO allocations with system allocator
>  - Various page sizes
>  - Dynamically freeing / unmapping memory
>  - Sharing VM across threads
>  - Faults racing on different hardware engines / GTs / Tiles
>  - GPU faults and CPU faults racing
>  - CPU faults on multiple threads racing
>  - CPU faults on multiple process racing
>  - GPU faults of memory not faulted in by CPU
>  - Partial unmap of allocations
>  - Attempting to unmap system allocations when GPU has mappings
>  - Eviction of both system allocations and BOs
>  - Forking child processes and reading data from VRAM
>  - mremap data in VRAM
>  - Protection changes
>  - Multiple faults per execbuf
>=20
> Running on LNL, BMG, PVC 1 tile, and PVC 2 tile.
>=20
> v2:
>  - Rebase
>  - Fix memory allocation to not interfear with malloc (Thomas)
> v3:
>  - Fix memory leak (Francois)
>  - Break out uAPI into own patch (Francois)
>  - Use mkstemp for sync file (Francois)
>  - Use mkstemp for file backed data (Francois)
>  - Drop i argument from READ_VALUE (Francois)
>  - Fix test description (Francois)
>  - Add comment to check_all_pages_process (Francois)
>  - Prefer igt_info over printf (Francois)
>  - Fix types in messages (Francois)
>  - Prefer odd macro (Francois)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM, though maybe it would be better to split the various tests
introduced in xe_exec_system_allocator.c across multiple patches,
instead of creating all of the tests at once?

I'm okay with creating the test series either way, so this isn't a
blocking request.

The remaining nits below are non-blocking as well, so this is:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  lib/xe/xe_ioctl.c                      |   12 +
>  lib/xe/xe_ioctl.h                      |    1 +
>  tests/intel/xe_exec_system_allocator.c | 1849 ++++++++++++++++++++++++
>  tests/meson.build                      |    1 +
>  4 files changed, 1863 insertions(+)
>  create mode 100644 tests/intel/xe_exec_system_allocator.c
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index fb8c4aef13..785fc9184c 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -440,6 +440,18 @@ void *xe_bo_map(int fd, uint32_t bo, size_t size)
>  	return __xe_bo_map(fd, bo, size, PROT_WRITE);
>  }
> =20
> +void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
> +{
> +	uint64_t mmo;
> +	void *map;
> +
> +	mmo =3D xe_bo_mmap_offset(fd, bo);
> +	map =3D mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd=
, mmo);
> +	igt_assert(map !=3D MAP_FAILED);
> +
> +	return map;
> +}
> +
>  void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
>  {
>  	return __xe_bo_map(fd, bo, size, prot);
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 9bdf73b2bd..554a33c9cd 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -86,6 +86,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm=
, uint16_t class);
>  void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
>  uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
>  void *xe_bo_map(int fd, uint32_t bo, size_t size);
> +void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned in=
t addr);
>  void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
>  int __xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec(int fd, struct drm_xe_exec *exec);
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec=
_system_allocator.c
> new file mode 100644
> index 0000000000..4839090cb2
> --- /dev/null
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -0,0 +1,1849 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (c) 2024 Intel Corporation

NIT:
Shouldn't this be a 2025 copyright?

> + */
> +
> +/**
> + * TEST: Basic tests for execbuf functionality using system allocator
> + * Category: Core
> + * Mega feature: USM
> + * Sub-category: System allocator
> + * Functionality: fault mode, system allocator
> + * GPU: LNL, BMG, PVC
> + */
> +
> +#include <fcntl.h>
> +#include <linux/mman.h>
> +#include <time.h>
> +
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +#include "xe_drm.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include <string.h>
> +
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define QUARTER_SEC		(NSEC_PER_SEC / 4)
> +#define FIVE_SEC		(5LL * NSEC_PER_SEC)
> +
> +struct batch_data {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint32_t data;
> +	uint32_t expected_data;
> +};
> +
> +#define WRITE_VALUE(data__, i__)	({			\
> +	if (!(data__)->expected_data)				\
> +		(data__)->expected_data =3D rand() << 12 | (i__);	\
> +	(data__)->expected_data;				\
> +})
> +#define READ_VALUE(data__)	((data__)->expected_data)
> +
> +static void __write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t w=
data,
> +			int *idx)
> +{
> +	batch[(*idx)++] =3D MI_STORE_DWORD_IMM_GEN4;
> +	batch[(*idx)++] =3D sdi_addr;
> +	batch[(*idx)++] =3D sdi_addr >> 32;
> +	batch[(*idx)++] =3D wdata;
> +}
> +
> +static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wda=
ta,
> +			int *idx)
> +{
> +	__write_dword(batch, sdi_addr, wdata, idx);
> +	batch[(*idx)++] =3D MI_BATCH_BUFFER_END;
> +}
> +
> +static void check_all_pages(void *ptr, uint64_t alloc_size, uint64_t str=
ide,
> +			    pthread_barrier_t *barrier)
> +{
> +	int i, n_writes =3D alloc_size / stride;
> +
> +	for (i =3D 0; i < n_writes; ++i) {
> +		struct batch_data *data =3D ptr + i * stride;
> +
> +		igt_assert_eq(data->data, READ_VALUE(data));
> +
> +		if (barrier)
> +			pthread_barrier_wait(barrier);
> +	}
> +}
> +
> +static char sync_file[] =3D "/tmp/xe_exec_system_allocator_syncXXXXXX";
> +static int sync_fd;
> +
> +static void open_sync_file(void)
> +{
> +	sync_fd =3D mkstemp(sync_file);
> +}
> +
> +static void close_sync_file(void)
> +{
> +	close(sync_fd);
> +}

NIT:
The sync_fd doesn't seem like it's being used for anything.  However, just
because I don't know what this file does doesn't mean it does nothing, so
I won't block on this.

> +
> +struct process_data {
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	pthread_barrier_t barrier;
> +	bool go;
> +};
> +
> +static void wait_pdata(struct process_data *pdata)
> +{
> +	pthread_mutex_lock(&pdata->mutex);
> +	while (!pdata->go)
> +		pthread_cond_wait(&pdata->cond, &pdata->mutex);
> +	pthread_mutex_unlock(&pdata->mutex);
> +}
> +
> +static void init_pdata(struct process_data *pdata, int n_engine)
> +{
> +	pthread_mutexattr_t mutex_attr;
> +	pthread_condattr_t cond_attr;
> +	pthread_barrierattr_t barrier_attr;
> +
> +	pthread_mutexattr_init(&mutex_attr);
> +	pthread_mutexattr_setpshared(&mutex_attr, PTHREAD_PROCESS_SHARED);
> +	pthread_mutex_init(&pdata->mutex, &mutex_attr);
> +
> +	pthread_condattr_init(&cond_attr);
> +	pthread_condattr_setpshared(&cond_attr, PTHREAD_PROCESS_SHARED);
> +	pthread_cond_init(&pdata->cond, &cond_attr);
> +
> +	pthread_barrierattr_init(&barrier_attr);
> +	pthread_barrierattr_setpshared(&barrier_attr, PTHREAD_PROCESS_SHARED);
> +	pthread_barrier_init(&pdata->barrier, &barrier_attr, n_engine);
> +
> +	pdata->go =3D false;
> +}
> +
> +static void signal_pdata(struct process_data *pdata)
> +{
> +	pthread_mutex_lock(&pdata->mutex);
> +	pdata->go =3D true;
> +	pthread_cond_broadcast(&pdata->cond);
> +	pthread_mutex_unlock(&pdata->mutex);
> +}
> +
> +/* many_alloc flags */
> +#define MIX_BO_ALLOC		(0x1 << 0)
> +#define BENCHMARK		(0x1 << 1)
> +#define CPU_FAULT_THREADS	(0x1 << 2)
> +#define CPU_FAULT_PROCESS	(0x1 << 3)
> +#define CPU_FAULT_SAME_PAGE	(0x1 << 4)
> +
> +static void process_check(void *ptr, uint64_t alloc_size, uint64_t strid=
e,
> +			  unsigned int flags)
> +{
> +	struct process_data *pdata;
> +	int map_fd;
> +
> +	map_fd =3D open(sync_file, O_RDWR, 0x666);
> +	pdata =3D mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +	wait_pdata(pdata);
> +
> +	if (flags & CPU_FAULT_SAME_PAGE)
> +		check_all_pages(ptr, alloc_size, stride, &pdata->barrier);
> +	else
> +		check_all_pages(ptr, alloc_size, stride, NULL);
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +/*
> + * Partition checking of results in chunks which causes multiple process=
es to
> + * fault same VRAM allocation in parallel.
> + */
> +static void
> +check_all_pages_process(void *ptr, uint64_t alloc_size, uint64_t stride,
> +			int n_process, unsigned int flags)
> +{
> +	struct process_data *pdata;
> +	int map_fd, i;
> +
> +	map_fd =3D open(sync_file, O_RDWR | O_CREAT, 0x666);
> +	posix_fallocate(map_fd, 0, sizeof(*pdata));
> +	pdata =3D mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +
> +	init_pdata(pdata, n_process);
> +
> +	for (i =3D 0; i < n_process; ++i) {
> +		igt_fork(child, 1)
> +			if (flags & CPU_FAULT_SAME_PAGE)
> +				process_check(ptr, alloc_size, stride, flags);
> +			else
> +				process_check(ptr + stride * i, alloc_size,
> +					      stride * n_process, flags);
> +	}
> +
> +	signal_pdata(pdata);
> +	igt_waitchildren();
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +struct thread_check_data {
> +	pthread_t thread;
> +	pthread_mutex_t *mutex;
> +	pthread_cond_t *cond;
> +	pthread_barrier_t *barrier;
> +	void *ptr;
> +	uint64_t alloc_size;
> +	uint64_t stride;
> +	bool *go;
> +};
> +
> +static void *thread_check(void *data)
> +{
> +	struct thread_check_data *t =3D data;
> +
> +	pthread_mutex_lock(t->mutex);
> +	while (!*t->go)
> +		pthread_cond_wait(t->cond, t->mutex);
> +	pthread_mutex_unlock(t->mutex);
> +
> +	check_all_pages(t->ptr, t->alloc_size, t->stride, t->barrier);
> +
> +	return NULL;
> +}
> +
> +/*
> + * Partition checking of results in chunks which causes multiple threads=
 to
> + * fault same VRAM allocation in parallel.
> + */
> +static void
> +check_all_pages_threads(void *ptr, uint64_t alloc_size, uint64_t stride,
> +			int n_threads, unsigned int flags)
> +{
> +	struct thread_check_data *threads_check_data;
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	pthread_barrier_t barrier;
> +	int i;
> +	bool go =3D false;
> +
> +	threads_check_data =3D calloc(n_threads, sizeof(*threads_check_data));
> +	igt_assert(threads_check_data);
> +
> +	pthread_mutex_init(&mutex, 0);
> +	pthread_cond_init(&cond, 0);
> +	pthread_barrier_init(&barrier, 0, n_threads);
> +
> +	for (i =3D 0; i < n_threads; ++i) {
> +		threads_check_data[i].mutex =3D &mutex;
> +		threads_check_data[i].cond =3D &cond;
> +		if (flags & CPU_FAULT_SAME_PAGE) {
> +			threads_check_data[i].barrier =3D &barrier;
> +			threads_check_data[i].ptr =3D ptr;
> +			threads_check_data[i].alloc_size =3D alloc_size;
> +			threads_check_data[i].stride =3D stride;
> +		} else {
> +			threads_check_data[i].barrier =3D NULL;
> +			threads_check_data[i].ptr =3D ptr + stride * i;
> +			threads_check_data[i].alloc_size =3D alloc_size;
> +			threads_check_data[i].stride =3D n_threads * stride;
> +		}
> +		threads_check_data[i].go =3D &go;
> +
> +		pthread_create(&threads_check_data[i].thread, 0, thread_check,
> +			       &threads_check_data[i]);
> +	}
> +
> +	pthread_mutex_lock(&mutex);
> +	go =3D true;
> +	pthread_cond_broadcast(&cond);
> +	pthread_mutex_unlock(&mutex);
> +
> +	for (i =3D 0; i < n_threads; ++i)
> +		pthread_join(threads_check_data[i].thread, NULL);
> +	free(threads_check_data);
> +}
> +
> +static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
> +			    uint64_t alloc_size, uint64_t stride,
> +			    struct timespec *tv, uint64_t *submit)
> +{
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 0,
> +		.exec_queue_id =3D exec_queue,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +	uint64_t addr =3D to_user_pointer(ptr);
> +	int i, ret, n_writes =3D alloc_size / stride;
> +	u64 *exec_ufence =3D NULL;
> +	int64_t timeout =3D FIVE_SEC;
> +
> +	exec_ufence =3D mmap(NULL, SZ_4K, PROT_READ |
> +			   PROT_WRITE, MAP_SHARED |
> +			   MAP_ANONYMOUS, -1, 0);
> +	igt_assert(exec_ufence !=3D MAP_FAILED);
> +	memset(exec_ufence, 0, SZ_4K);
> +	sync[0].addr =3D to_user_pointer(exec_ufence);
> +
> +	for (i =3D 0; i < n_writes; ++i, addr +=3D stride) {
> +		struct batch_data *data =3D ptr + i * stride;
> +		uint64_t sdi_offset =3D (char *)&data->data - (char *)data;
> +		uint64_t sdi_addr =3D addr + sdi_offset;
> +		int b =3D 0;
> +
> +		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i), &b);
> +		igt_assert(b <=3D ARRAY_SIZE(data->batch));
> +	}
> +
> +	igt_nsec_elapsed(tv);
> +	*submit =3D igt_nsec_elapsed(tv);
> +
> +	addr =3D to_user_pointer(ptr);
> +	for (i =3D 0; i < n_writes; ++i, addr +=3D stride) {
> +		struct batch_data *data =3D ptr + i * stride;
> +		uint64_t batch_offset =3D (char *)&data->batch - (char *)data;
> +		uint64_t batch_addr =3D addr + batch_offset;
> +
> +		exec.address =3D batch_addr;
> +		if (i + 1 =3D=3D n_writes)
> +			exec.num_syncs =3D 1;
> +		xe_exec(fd, &exec);
> +	}
> +
> +	ret =3D __xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queue,
> +			       &timeout);
> +	if (ret) {
> +		igt_info("FAIL EXEC_UFENCE_ADDR: 0x%016llx\n", sync[0].addr);
> +		igt_info("FAIL EXEC_UFENCE: EXPECTED=3D0x%016llx, ACTUAL=3D0x%016lx\n"=
,
> +			 USER_FENCE_VALUE, exec_ufence[0]);
> +
> +		addr =3D to_user_pointer(ptr);
> +		for (i =3D 0; i < n_writes; ++i, addr +=3D stride) {
> +			struct batch_data *data =3D ptr + i * stride;
> +			uint64_t batch_offset =3D (char *)&data->batch - (char *)data;
> +			uint64_t batch_addr =3D addr + batch_offset;
> +			uint64_t sdi_offset =3D (char *)&data->data - (char *)data;
> +			uint64_t sdi_addr =3D addr + sdi_offset;
> +
> +			igt_info("FAIL BATCH_ADDR: 0x%016lx\n", batch_addr);
> +			igt_info("FAIL SDI_ADDR: 0x%016lx\n", sdi_addr);
> +			igt_info("FAIL SDI_ADDR (in batch): 0x%016lx\n",
> +				 (((u64)data->batch[2]) << 32) | data->batch[1]);
> +			igt_info("FAIL DATA: EXPECTED=3D0x%08x, ACTUAL=3D0x%08x\n",
> +				 data->expected_data, data->data);
> +		}
> +		igt_assert_eq(ret, 0);
> +	}
> +	munmap(exec_ufence, SZ_4K);
> +}
> +
> +static int va_bits;
> +
> +#define bind_system_allocator(__sync, __num_sync)			\
> +	__xe_vm_bind_assert(fd, vm, 0,					\
> +			    0, 0, 0, 0x1ull << va_bits,			\
> +			    DRM_XE_VM_BIND_OP_MAP,			\
> +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
> +			    (__sync), (__num_sync), 0, 0)
> +
> +#define unbind_system_allocator()				\
> +	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,	\
> +		     DRM_XE_VM_BIND_OP_UNMAP, 0,		\
> +		     NULL, 0, 0, 0, 0)
> +
> +#define odd(__i)	(__i & 1)
> +
> +struct aligned_alloc_type {
> +	void *__ptr;
> +	void *ptr;
> +	size_t __size;
> +	size_t size;
> +};
> +
> +static struct aligned_alloc_type __aligned_alloc(size_t alignment, size_=
t size)
> +{
> +	struct aligned_alloc_type aligned_alloc_type;
> +
> +	aligned_alloc_type.__ptr =3D mmap(NULL, alignment + size, PROT_NONE, MA=
P_PRIVATE |
> +			      MAP_ANONYMOUS, -1, 0);
> +	igt_assert(aligned_alloc_type.__ptr !=3D MAP_FAILED);
> +
> +	aligned_alloc_type.ptr =3D (void *)ALIGN((uint64_t)aligned_alloc_type._=
_ptr, alignment);
> +	aligned_alloc_type.size =3D size;
> +	aligned_alloc_type.__size =3D size + alignment;
> +
> +	return aligned_alloc_type;
> +}
> +
> +static void __aligned_free(struct aligned_alloc_type  *aligned_alloc_typ=
e)
> +{
> +	munmap(aligned_alloc_type->__ptr, aligned_alloc_type->__size);
> +}
> +
> +static void __aligned_partial_free(struct aligned_alloc_type  *aligned_a=
lloc_type)
> +{
> +	size_t begin_size =3D (size_t)(aligned_alloc_type->ptr - aligned_alloc_=
type->__ptr);
> +
> +	if (begin_size)
> +		munmap(aligned_alloc_type->__ptr, begin_size);
> +	if (aligned_alloc_type->__size - aligned_alloc_type->size - begin_size)
> +		munmap(aligned_alloc_type->ptr + aligned_alloc_type->size,
> +		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_s=
ize);
> +}
> +
> +/**
> + * SUBTEST: unaligned-alloc
> + * Description: allocate unaligned sizes of memory
> + * Test category: functionality test
> + *
> + * SUBTEST: fault-benchmark
> + * Description: Benchmark how long GPU / CPU take
> + * Test category: performance test
> + *
> + * SUBTEST: fault-threads-benchmark
> + * Description: Benchmark how long GPU / CPU take, reading results with =
multiple threads
> + * Test category: performance and functionality test
> + *
> + * SUBTEST: fault-threads-same-page-benchmark
> + * Description: Benchmark how long GPU / CPU take, reading results with =
multiple threads, hammer same page
> + * Test category: performance and functionality test
> + *
> + * SUBTEST: fault-process-benchmark
> + * Description: Benchmark how long GPU / CPU take, reading results with =
multiple process
> + * Test category: performance and functionality test
> + *
> + * SUBTEST: fault-process-same-page-benchmark
> + * Description: Benchmark how long GPU / CPU take, reading results with =
multiple process, hammer same page
> + * Test category: performance and functionality test
> + *
> + * SUBTEST: evict-malloc
> + * Description: trigger eviction of VRAM allocated via malloc
> + * Test category: functionality test
> + *
> + * SUBTEST: evict-malloc-mix-bo
> + * Description: trigger eviction of VRAM allocated via malloc and BO cre=
ate
> + * Test category: functionality test
> + *
> + * SUBTEST: processes-evict-malloc
> + * Description: multi-process trigger eviction of VRAM allocated via mal=
loc
> + * Test category: stress test
> + *
> + * SUBTEST: processes-evict-malloc-mix-bo
> + * Description: multi-process trigger eviction of VRAM allocated via mal=
loc and BO create
> + * Test category: stress test
> + */
> +
> +static void
> +many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
> +	    uint64_t total_alloc, uint64_t alloc_size, uint64_t stride,
> +	    pthread_barrier_t *barrier, unsigned int flags)
> +{
> +	uint32_t vm, exec_queue;
> +	int num_allocs =3D flags & BENCHMARK ? 1 :
> +		(9 * (total_alloc / alloc_size)) / 8;
> +	struct aligned_alloc_type *allocs;
> +	uint32_t *bos =3D NULL;
> +	struct timespec tv =3D {};
> +	uint64_t submit, read, elapsed;
> +	int i;
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	bind_system_allocator(NULL, 0);
> +
> +	allocs =3D malloc(sizeof(*allocs) * num_allocs);
> +	igt_assert(allocs);
> +	memset(allocs, 0, sizeof(*allocs) * num_allocs);
> +
> +	if (flags & MIX_BO_ALLOC) {
> +		bos =3D malloc(sizeof(*bos) * num_allocs);
> +		igt_assert(bos);
> +		memset(bos, 0, sizeof(*bos) * num_allocs);
> +	}
> +
> +	for (i =3D 0; i < num_allocs; ++i) {
> +		struct aligned_alloc_type alloc;
> +
> +		if (flags & MIX_BO_ALLOC && odd(i)) {
> +			uint32_t bo_flags =3D
> +				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +
> +			alloc =3D __aligned_alloc(SZ_2M, alloc_size);
> +			igt_assert(alloc.ptr);
> +
> +			bos[i] =3D xe_bo_create(fd, vm, alloc_size,
> +					      vram_if_possible(fd, eci->gt_id),
> +					      bo_flags);
> +			alloc.ptr =3D xe_bo_map_fixed(fd, bos[i], alloc_size,
> +						    to_user_pointer(alloc.ptr));
> +			xe_vm_bind_async(fd, vm, 0, bos[i], 0,
> +					 to_user_pointer(alloc.ptr),
> +					 alloc_size, 0, 0);
> +		} else {
> +			alloc.ptr =3D aligned_alloc(SZ_2M, alloc_size);
> +			igt_assert(alloc.ptr);
> +		}
> +		allocs[i] =3D alloc;
> +
> +		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size, stride,
> +				&tv, &submit);
> +	}
> +
> +	if (barrier)
> +		pthread_barrier_wait(barrier);
> +
> +	for (i =3D 0; i < num_allocs; ++i) {
> +		if (flags & BENCHMARK)
> +			read =3D igt_nsec_elapsed(&tv);
> +#define NUM_CHECK_THREADS	8
> +		if (flags & CPU_FAULT_PROCESS)
> +			check_all_pages_process(allocs[i].ptr, alloc_size, stride,
> +						NUM_CHECK_THREADS, flags);
> +		else if (flags & CPU_FAULT_THREADS)
> +			check_all_pages_threads(allocs[i].ptr, alloc_size, stride,
> +						NUM_CHECK_THREADS, flags);
> +		else
> +			check_all_pages(allocs[i].ptr, alloc_size, stride, NULL);
> +		if (flags & BENCHMARK) {
> +			elapsed =3D igt_nsec_elapsed(&tv);
> +			igt_info("Execution took %.3fms (submit %.1fus, read %.1fus, total %.=
1fus, read_total %.1fus)\n",
> +				 1e-6 * elapsed, 1e-3 * submit, 1e-3 * read,
> +				 1e-3 * (elapsed - submit),
> +				 1e-3 * (elapsed - read));
> +		}
> +		if (bos && bos[i]) {
> +			__aligned_free(allocs + i);
> +			gem_close(fd, bos[i]);
> +		} else {
> +			free(allocs[i].ptr);
> +		}
> +	}
> +	if (bos)
> +		free(bos);
> +	free(allocs);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +static void process_evict(struct drm_xe_engine_class_instance *hwe,
> +			  uint64_t total_alloc, uint64_t alloc_size,
> +			  uint64_t stride, unsigned int flags)
> +{
> +	struct process_data *pdata;
> +	int map_fd;
> +	int fd;
> +
> +	map_fd =3D open(sync_file, O_RDWR, 0x666);
> +	pdata =3D mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +	wait_pdata(pdata);
> +
> +	fd =3D drm_open_driver(DRIVER_XE);
> +	many_allocs(fd, hwe, total_alloc, alloc_size, stride, &pdata->barrier,
> +		    flags);
> +	drm_close_driver(fd);
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +static void
> +processes_evict(int fd, uint64_t alloc_size, uint64_t stride,
> +		unsigned int flags)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct process_data *pdata;
> +	int n_engine_gt[2] =3D { 0, 0 }, n_engine =3D 0;
> +	int map_fd;
> +
> +	map_fd =3D open(sync_file, O_RDWR | O_CREAT, 0x666);
> +	posix_fallocate(map_fd, 0, sizeof(*pdata));
> +	pdata =3D mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +
> +	xe_for_each_engine(fd, hwe) {
> +		igt_assert(hwe->gt_id < 2);
> +		n_engine_gt[hwe->gt_id]++;
> +		n_engine++;
> +	}
> +
> +	init_pdata(pdata, n_engine);
> +
> +	xe_for_each_engine(fd, hwe) {
> +		igt_fork(child, 1)
> +			process_evict(hwe,
> +				      xe_visible_vram_size(fd, hwe->gt_id) /
> +				      n_engine_gt[hwe->gt_id], alloc_size,
> +				      stride, flags);
> +	}
> +
> +	signal_pdata(pdata);
> +	igt_waitchildren();
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +#define CPU_FAULT	(0x1 << 0)
> +#define REMAP		(0x1 << 1)
> +#define MIDDLE		(0x1 << 2)
> +
> +/**
> + * SUBTEST: partial-munmap-cpu-fault
> + * Description: munmap partially with cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-munmap-no-cpu-fault
> + * Description: munmap partially with no cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-remap-cpu-fault
> + * Description: remap partially with cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-remap-no-cpu-fault
> + * Description: remap partially with no cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-middle-munmap-cpu-fault
> + * Description: munmap middle with cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-middle-munmap-no-cpu-fault
> + * Description: munmap middle with no cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-middle-remap-cpu-fault
> + * Description: remap middle with cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-middle-remap-no-cpu-fault
> + * Description: remap middle with no cpu access in between
> + * Test category: functionality test
> + */
> +
> +static void
> +partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int f=
lags)
> +{
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D DRM_XE_SYNC_FLAG_S=
IGNAL,
> +	          .timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(sync),
> +	};
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;
> +		uint32_t data;
> +		uint32_t expected_data;
> +	} *data;
> +	size_t bo_size =3D SZ_2M, unmap_offset =3D 0;
> +	uint32_t vm, exec_queue;
> +	u64 *exec_ufence =3D NULL;
> +	int i;
> +	void *old, *new =3D NULL;
> +	struct aligned_alloc_type alloc;
> +
> +	if (flags & MIDDLE)
> +		unmap_offset =3D bo_size / 4;
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +
> +	alloc =3D __aligned_alloc(bo_size, bo_size);
> +	igt_assert(alloc.ptr);
> +
> +	data =3D mmap(alloc.ptr, bo_size, PROT_READ | PROT_WRITE,
> +		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> +	igt_assert(data !=3D MAP_FAILED);
> +	memset(data, 0, bo_size);
> +	old =3D data;
> +
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	bind_system_allocator(sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +	data[0].vm_sync =3D 0;
> +
> +	exec_ufence =3D mmap(NULL, SZ_4K, PROT_READ |
> +			   PROT_WRITE, MAP_SHARED |
> +			   MAP_ANONYMOUS, -1, 0);
> +	igt_assert(exec_ufence !=3D MAP_FAILED);
> +	memset(exec_ufence, 0, SZ_4K);
> +
> +	for (i =3D 0; i < 2; i++) {
> +		uint64_t addr =3D to_user_pointer(data);
> +		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr =3D addr + sdi_offset;
> +		int b =3D 0;
> +
> +		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
> +		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> +
> +		if (!i)
> +			data =3D old + unmap_offset + bo_size / 2;
> +	}
> +
> +	data =3D old;
> +	exec.exec_queue_id =3D exec_queue;
> +
> +	for (i =3D 0; i < 2; i++) {
> +		uint64_t addr =3D to_user_pointer(data);
> +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr =3D addr + batch_offset;
> +
> +		sync[0].addr =3D new ? to_user_pointer(new) :
> +			to_user_pointer(exec_ufence);
> +		exec.address =3D batch_addr;
> +		xe_exec(fd, &exec);
> +
> +		xe_wait_ufence(fd, new ?: exec_ufence, USER_FENCE_VALUE,
> +			       exec_queue, FIVE_SEC);
> +		if (i || (flags & CPU_FAULT))
> +			igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
> +		exec_ufence[0] =3D 0;
> +
> +		if (!i) {
> +			data =3D old + unmap_offset + bo_size / 2;
> +			munmap(old + unmap_offset, bo_size / 2);
> +			if (flags & REMAP) {
> +				new =3D mmap(old + unmap_offset, bo_size / 2,
> +					   PROT_READ | PROT_WRITE,
> +					   MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED |
> +					   MAP_LOCKED, -1, 0);
> +				igt_assert(new !=3D MAP_FAILED);
> +			}
> +		}
> +	}
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	munmap(exec_ufence, SZ_4K);
> +	__aligned_free(&alloc);
> +	if (new)
> +		munmap(new, bo_size / 2);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +#define MAX_N_EXEC_QUEUES	16
> +
> +#define MMAP		(0x1 << 0)
> +#define NEW		(0x1 << 1)
> +#define BO_UNMAP	(0x1 << 2)
> +#define FREE		(0x1 << 3)
> +#define BUSY		(0x1 << 4)
> +#define BO_MAP		(0x1 << 5)
> +#define RACE		(0x1 << 6)
> +#define SKIP_MEMSET	(0x1 << 7)
> +#define FAULT		(0x1 << 8)
> +#define FILE_BACKED	(0x1 << 9)
> +#define LOCK		(0x1 << 10)
> +#define MMAP_SHARED	(0x1 << 11)
> +#define HUGE_PAGE	(0x1 << 12)
> +#define SHARED_ALLOC	(0x1 << 13)
> +#define FORK_READ	(0x1 << 14)
> +#define FORK_READ_AFTER	(0x1 << 15)
> +#define MREMAP		(0x1 << 16)
> +#define DONTUNMAP	(0x1 << 17)
> +#define READ_ONLY_REMAP	(0x1 << 18)
> +#define SYNC_EXEC	(0x1 << 19)
> +#define EVERY_OTHER_CHECK	(0x1 << 20)
> +#define MULTI_FAULT	(0x1 << 21)

NIT:
The above doesn't look aligned, but I'm willing to bet that has
to do with my email client and that it's aligned in code.

However, there is a notable standout with EVERY_OTHER_CHECK.
IMO, I think all of the values should be aligned to that if they aren't
already.

-Jonathan Cavitt

> +
> +#define N_MULTI_FAULT	4
> +
> +/**
> + * SUBTEST: once-%s
> + * Description: Run %arg[1] system allocator test only once
> + * Test category: functionality test
> + *
> + * SUBTEST: once-large-%s
> + * Description: Run %arg[1] system allocator test only once with large a=
llocation
> + * Test category: functionality test
> + *
> + * SUBTEST: twice-%s
> + * Description: Run %arg[1] system allocator test twice
> + * Test category: functionality test
> + *
> + * SUBTEST: twice-large-%s
> + * Description: Run %arg[1] system allocator test twice with large alloc=
ation
> + * Test category: functionality test
> + *
> + * SUBTEST: many-%s
> + * Description: Run %arg[1] system allocator test many times
> + * Test category: stress test
> + *
> + * SUBTEST: many-stride-%s
> + * Description: Run %arg[1] system allocator test many times with a stri=
de on each exec
> + * Test category: stress test
> + *
> + * SUBTEST: many-execqueues-%s
> + * Description: Run %arg[1] system allocator test on many exec_queues
> + * Test category: stress test
> + *
> + * SUBTEST: many-large-%s
> + * Description: Run %arg[1] system allocator test many times with large =
allocations
> + * Test category: stress test
> + *
> + * SUBTEST: many-large-execqueues-%s
> + * Description: Run %arg[1] system allocator test on many exec_queues wi=
th large allocations
> + *
> + * SUBTEST: threads-many-%s
> + * Description: Run %arg[1] system allocator threaded test many times
> + * Test category: stress test
> + *
> + * SUBTEST: threads-many-stride-%s
> + * Description: Run %arg[1] system allocator threaded test many times wi=
th a stride on each exec
> + * Test category: stress test
> + *
> + * SUBTEST: threads-many-execqueues-%s
> + * Description: Run %arg[1] system allocator threaded test on many exec_=
queues
> + * Test category: stress test
> + *
> + * SUBTEST: threads-many-large-%s
> + * Description: Run %arg[1] system allocator threaded test many times wi=
th large allocations
> + * Test category: stress test
> + *
> + * SUBTEST: threads-many-large-execqueues-%s
> + * Description: Run %arg[1] system allocator threaded test on many exec_=
queues with large allocations
> + *
> + * SUBTEST: threads-shared-vm-many-%s
> + * Description: Run %arg[1] system allocator threaded, shared vm test ma=
ny times
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-vm-many-stride-%s
> + * Description: Run %arg[1] system allocator threaded, shared vm test ma=
ny times with a stride on each exec
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-vm-many-execqueues-%s
> + * Description: Run %arg[1] system allocator threaded, shared vm test on=
 many exec_queues
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-vm-many-large-%s
> + * Description: Run %arg[1] system allocator threaded, shared vm test ma=
ny times with large allocations
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-vm-many-large-execqueues-%s
> + * Description: Run %arg[1] system allocator threaded, shared vm test on=
 many exec_queues with large allocations
> + * Test category: stress test
> + *
> + * SUBTEST: process-many-%s
> + * Description: Run %arg[1] system allocator multi-process test many tim=
es
> + * Test category: stress test
> + *
> + * SUBTEST: process-many-stride-%s
> + * Description: Run %arg[1] system allocator multi-process test many tim=
es with a stride on each exec
> + * Test category: stress test
> + *
> + * SUBTEST: process-many-execqueues-%s
> + * Description: Run %arg[1] system allocator multi-process test on many =
exec_queues
> + * Test category: stress test
> + *
> + * SUBTEST: process-many-large-%s
> + * Description: Run %arg[1] system allocator multi-process test many tim=
es with large allocations
> + * Test category: stress test
> + *
> + * SUBTEST: process-many-large-execqueues-%s
> + * Description: Run %arg[1] system allocator multi-process test on many =
exec_queues with large allocations
> + *
> + * SUBTEST: fault
> + * Description: use a bad system allocator address resulting in a fault
> + * Test category: bad input
> + *
> + * arg[1]:
> + *
> + * @malloc:				malloc single buffer for all execs, issue a command which=
 will trigger multiple faults
> + * @malloc-multi-fault:			malloc single buffer for all execs
> + * @malloc-fork-read:			malloc single buffer for all execs, fork a proce=
ss to read test output
> + * @malloc-fork-read-after:		malloc single buffer for all execs, fork a =
process to read test output, check again after fork returns in parent
> + * @malloc-mlock:			malloc and mlock single buffer for all execs
> + * @malloc-race:			malloc single buffer for all execs with race between =
cpu and gpu access
> + * @malloc-bo-unmap:			malloc single buffer for all execs, bind and unbi=
nd a BO to same address before execs
> + * @malloc-busy:			malloc single buffer for all execs, try to unbind whi=
le buffer valid
> + * @mmap:				mmap single buffer for all execs
> + * @mmap-remap:				mmap and mremap a buffer for all execs
> + * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag =
for all execs
> + * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
> + * @mmap-remap-ro-dontunmap:		mmap and mremap a read-only buffer with do=
ntunmap flag for all execs
> + * @mmap-remap-eocheck:			mmap and mremap a buffer for all execs, check =
data every other loop iteration
> + * @mmap-remap-dontunmap-eocheck:	mmap and mremap a buffer with dontunma=
p flag for all execs, check data every other loop iteration
> + * @mmap-remap-ro-eocheck:		mmap and mremap a read-only buffer for all e=
xecs, check data every other loop iteration
> + * @mmap-remap-ro-dontunmap-eocheck:	mmap and mremap a read-only buffer =
with dontunmap flag for all execs, check data every other loop iteration
> + * @mmap-huge:				mmap huge page single buffer for all execs
> + * @mmap-shared:			mmap shared single buffer for all execs
> + * @mmap-shared-remap:			mmap shared and mremap a buffer for all execs
> + * @mmap-shared-remap-dontunmap:	mmap shared and mremap a buffer with do=
ntunmap flag for all execs
> + * @mmap-shared-remap-eocheck:		mmap shared and mremap a buffer for all =
execs, check data every other loop iteration
> + * @mmap-shared-remap-dontunmap-eocheck:	mmap shared and mremap a buffer=
 with dontunmap flag for all execs, check data every other loop iteration
> + * @mmap-mlock:				mmap and mlock single buffer for all execs
> + * @mmap-file:				mmap single buffer, with file backing, for all execs
> + * @mmap-file-mlock:			mmap and mlock single buffer, with file backing, =
for all execs
> + * @mmap-race:				mmap single buffer for all execs with race between cpu=
 and gpu access
> + * @free:				malloc and free buffer for each exec
> + * @free-race:				malloc and free buffer for each exec with race between=
 cpu and gpu access
> + * @new:				malloc a new buffer for each exec
> + * @new-race:				malloc a new buffer for each exec with race between cpu=
 and gpu access
> + * @new-bo-map:				malloc a new buffer or map BO for each exec
> + * @new-busy:				malloc a new buffer for each exec, try to unbind while =
buffers valid
> + * @mmap-free:				mmap and free buffer for each exec
> + * @mmap-free-huge:			mmap huge page and free buffer for each exec
> + * @mmap-free-race:			mmap and free buffer for each exec with race betwe=
en cpu and gpu access
> + * @mmap-new:				mmap a new buffer for each exec
> + * @mmap-new-huge:			mmap huge page a new buffer for each exec
> + * @mmap-new-race:			mmap a new buffer for each exec with race between c=
pu and gpu access
> + * @malloc-nomemset:			malloc single buffer for all execs, skip memset o=
f buffers
> + * @malloc-mlock-nomemset:		malloc and mlock single buffer for all execs=
, skip memset of buffers
> + * @malloc-race-nomemset:		malloc single buffer for all execs with race =
between cpu and gpu access, skip memset of buffers
> + * @malloc-bo-unmap-nomemset:		malloc single buffer for all execs, bind =
and unbind a BO to same address before execs, skip memset of buffers
> + * @malloc-busy-nomemset:		malloc single buffer for all execs, try to un=
bind while buffer valid, skip memset of buffers
> + * @mmap-nomemset:			mmap single buffer for all execs, skip memset of bu=
ffers
> + * @mmap-huge-nomemset:			mmap huge page single buffer for all execs, sk=
ip memset of buffers
> + * @mmap-shared-nomemset:		mmap shared single buffer for all execs, skip=
 memset of buffers
> + * @mmap-mlock-nomemset:		mmap and mlock single buffer for all execs, sk=
ip memset of buffers
> + * @mmap-file-nomemset:			mmap single buffer, with file backing, for all=
 execs, skip memset of buffers
> + * @mmap-file-mlock-nomemset:		mmap and mlock single buffer, with file b=
acking, for all execs, skip memset of buffers
> + * @mmap-race-nomemset:			mmap single buffer for all execs with race bet=
ween cpu and gpu access, skip memset of buffers
> + * @free-nomemset:			malloc and free buffer for each exec, skip memset o=
f buffers
> + * @free-race-nomemset:			malloc and free buffer for each exec with race=
 between cpu and gpu access, skip memset of buffers
> + * @new-nomemset:			malloc a new buffer for each exec, skip memset of bu=
ffers
> + * @new-race-nomemset:			malloc a new buffer for each exec with race bet=
ween cpu and gpu access, skip memset of buffers
> + * @new-bo-map-nomemset:		malloc a new buffer or map BO for each exec, s=
kip memset of buffers
> + * @new-busy-nomemset:			malloc a new buffer for each exec, try to unbin=
d while buffers valid, skip memset of buffers
> + * @mmap-free-nomemset:			mmap and free buffer for each exec, skip memse=
t of buffers
> + * @mmap-free-huge-nomemset:		mmap huge page and free buffer for each ex=
ec, skip memset of buffers
> + * @mmap-free-race-nomemset:		mmap and free buffer for each exec with ra=
ce between cpu and gpu access, skip memset of buffers
> + * @mmap-new-nomemset:			mmap a new buffer for each exec, skip memset of=
 buffers
> + * @mmap-new-huge-nomemset:		mmap huge page new buffer for each exec, sk=
ip memset of buffers
> + * @mmap-new-race-nomemset:		mmap a new buffer for each exec with race b=
etween cpu and gpu access, skip memset of buffers
> + *
> + * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
> + * Description: Create multiple threads with a shared VM triggering faul=
ts on different hardware engines to same addresses
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc-race
> + * Description: Create multiple threads with a shared VM triggering faul=
ts on different hardware engines to same addresses, racing between CPU and =
GPU access
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-alloc-many-stride-malloc
> + * Description: Create multiple threads with a faults on different hardw=
are engines to same addresses
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-alloc-many-stride-malloc-sync
> + * Description: Create multiple threads with a faults on different hardw=
are engines to same addresses, syncing on each exec
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-alloc-many-stride-malloc-race
> + * Description: Create multiple threads with a faults on different hardw=
are engines to same addresses, racing between CPU and GPU access
> + * Test category: stress test
> + */
> +
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +};
> +
> +static void
> +test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> +	  int n_exec_queues, int n_execs, size_t bo_size,
> +	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> +	  unsigned int flags)
> +{
> +	uint64_t addr;
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D DRM_XE_SYNC_FLAG_S=
IGNAL,
> +	          .timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(sync),
> +	};
> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> +	struct test_exec_data *data, *next_data =3D NULL;
> +	uint32_t bo_flags;
> +	uint32_t bo =3D 0;
> +	void **pending_free;
> +	u64 *exec_ufence =3D NULL;
> +	int i, j, b, file_fd =3D -1, prev_idx;
> +	bool free_vm =3D false;
> +	size_t aligned_size =3D bo_size ?: xe_get_default_alignment(fd);
> +	size_t orig_size =3D bo_size;
> +	struct aligned_alloc_type aligned_alloc_type;
> +
> +	if (flags & MULTI_FAULT) {
> +		if (!bo_size)
> +			return;
> +
> +		bo_size *=3D N_MULTI_FAULT;
> +	}
> +
> +	if (flags & SHARED_ALLOC)
> +		return;
> +
> +	if (flags & EVERY_OTHER_CHECK && odd(n_execs))
> +		return;
> +
> +	if (flags & EVERY_OTHER_CHECK)
> +		igt_assert(flags & MREMAP);
> +
> +	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
> +
> +	if (flags & NEW && !(flags & FREE)) {
> +		pending_free =3D malloc(sizeof(*pending_free) * n_execs);
> +		igt_assert(pending_free);
> +		memset(pending_free, 0, sizeof(*pending_free) * n_execs);
> +	}
> +
> +	if (!vm) {
> +		vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +		free_vm =3D true;
> +	}
> +	if (!bo_size) {
> +		if (!stride) {
> +			bo_size =3D sizeof(*data) * n_execs;
> +			bo_size =3D xe_bb_size(fd, bo_size);
> +		} else {
> +			bo_size =3D stride * n_execs * sizeof(*data);
> +			bo_size =3D xe_bb_size(fd, bo_size);
> +		}
> +	}
> +	if (flags & HUGE_PAGE) {
> +		aligned_size =3D ALIGN(aligned_size, SZ_2M);
> +		bo_size =3D ALIGN(bo_size, SZ_2M);
> +	}
> +
> +	if (alloc) {
> +		data =3D alloc;
> +	} else {
> +		if (flags & MMAP) {
> +			int mmap_flags =3D MAP_FIXED;
> +
> +			aligned_alloc_type =3D __aligned_alloc(aligned_size, bo_size);
> +			data =3D aligned_alloc_type.ptr;
> +			igt_assert(data);
> +			__aligned_partial_free(&aligned_alloc_type);
> +
> +			if (flags & MMAP_SHARED)
> +				mmap_flags |=3D MAP_SHARED;
> +			else
> +				mmap_flags |=3D MAP_PRIVATE;
> +
> +			if (flags & HUGE_PAGE)
> +				mmap_flags |=3D MAP_HUGETLB | MAP_HUGE_2MB;
> +
> +			if (flags & FILE_BACKED) {
> +				char name[] =3D "/tmp/xe_exec_system_allocator_datXXXXXX";
> +
> +				igt_assert(!(flags & NEW));
> +
> +				file_fd =3D mkstemp(name);
> +				posix_fallocate(file_fd, 0, bo_size);
> +			} else {
> +				mmap_flags |=3D MAP_ANONYMOUS;
> +			}
> +
> +			data =3D mmap(data, bo_size, PROT_READ |
> +				    PROT_WRITE, mmap_flags, file_fd, 0);
> +			igt_assert(data !=3D MAP_FAILED);
> +		} else {
> +			data =3D aligned_alloc(aligned_size, bo_size);
> +			igt_assert(data);
> +		}
> +		if (!(flags & SKIP_MEMSET))
> +			memset(data, 0, bo_size);
> +		if (flags & LOCK) {
> +			igt_assert(!(flags & NEW));
> +			mlock(data, bo_size);
> +		}
> +	}
> +
> +	for (i =3D 0; i < n_exec_queues; i++)
> +		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	if (free_vm) {
> +		bind_system_allocator(sync, 1);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +	}
> +	data[0].vm_sync =3D 0;
> +
> +	addr =3D to_user_pointer(data);
> +
> +	if (flags & BO_UNMAP) {
> +		bo_flags =3D DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo =3D xe_bo_create(fd, vm, bo_size,
> +				  vram_if_possible(fd, eci->gt_id), bo_flags);
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0,
> +				    0, 0, addr, bo_size,
> +				    DRM_XE_VM_BIND_OP_MAP,
> +				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> +				    1, 0, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> +			       FIVE_SEC);
> +		data[0].vm_sync =3D 0;
> +		gem_close(fd, bo);
> +		bo =3D 0;
> +	}
> +
> +	if (!(flags & RACE)) {
> +		exec_ufence =3D mmap(NULL, SZ_4K, PROT_READ |
> +				   PROT_WRITE, MAP_SHARED |
> +				   MAP_ANONYMOUS, -1, 0);
> +		igt_assert(exec_ufence !=3D MAP_FAILED);
> +		memset(exec_ufence, 0, SZ_4K);
> +	}
> +
> +	for (i =3D 0; i < n_execs; i++) {
> +		int idx =3D !stride ? i : i * stride, next_idx =3D !stride
> +			? (i + 1) : (i + 1) * stride;
> +		uint64_t batch_offset =3D (char *)&data[idx].batch - (char *)data;
> +		uint64_t batch_addr =3D addr + batch_offset;
> +		uint64_t sdi_offset =3D (char *)&data[idx].data - (char *)data;
> +		uint64_t sdi_addr =3D addr + sdi_offset;
> +		int e =3D i % n_exec_queues, err;
> +		bool fault_inject =3D (FAULT & flags) && i =3D=3D n_execs / 2;
> +		bool fault_injected =3D (FAULT & flags) && i > n_execs;
> +
> +		if (barrier)
> +			pthread_barrier_wait(barrier);
> +
> +		if (flags & MULTI_FAULT) {
> +			b =3D 0;
> +			for (j =3D 0; j < N_MULTI_FAULT - 1; ++j)
> +				__write_dword(data[idx].batch,
> +					      sdi_addr + j * orig_size,
> +					      WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(data[idx].batch, sdi_addr + j * orig_size,
> +				    WRITE_VALUE(&data[idx], idx), &b);
> +			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
> +		} else if (!(flags & EVERY_OTHER_CHECK)) {
> +			b =3D 0;
> +			write_dword(data[idx].batch, sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b);
> +			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
> +		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
> +			b =3D 0;
> +			write_dword(data[idx].batch, sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b);
> +			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
> +
> +			aligned_alloc_type =3D __aligned_alloc(aligned_size, bo_size);
> +			next_data =3D aligned_alloc_type.ptr;
> +			igt_assert(next_data);
> +			__aligned_partial_free(&aligned_alloc_type);
> +
> +			b =3D 0;
> +			write_dword(data[next_idx].batch,
> +				    to_user_pointer(next_data) +
> +				    (char *)&data[next_idx].data - (char *)data,
> +				    WRITE_VALUE(&data[next_idx], next_idx), &b);
> +			igt_assert(b <=3D ARRAY_SIZE(data[next_idx].batch));
> +		}
> +
> +		if (!exec_ufence)
> +			data[idx].exec_sync =3D 0;
> +
> +		sync[0].addr =3D exec_ufence ? to_user_pointer(exec_ufence) :
> +			addr + (char *)&data[idx].exec_sync - (char *)data;
> +
> +		exec.exec_queue_id =3D exec_queues[e];
> +		if (fault_inject)
> +			exec.address =3D batch_addr * 2;
> +		else
> +			exec.address =3D batch_addr;
> +
> +		if (fault_injected) {
> +			err =3D __xe_exec(fd, &exec);
> +			igt_assert(err =3D=3D -ENOENT);
> +		} else {
> +			xe_exec(fd, &exec);
> +		}
> +
> +		if (barrier)
> +			pthread_barrier_wait(barrier);
> +
> +		if (fault_inject || fault_injected) {
> +			int64_t timeout =3D QUARTER_SEC;
> +
> +			err =3D __xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> +					       &data[idx].exec_sync,
> +					       USER_FENCE_VALUE,
> +					       exec_queues[e], &timeout);
> +			igt_assert(err =3D=3D -ETIME || err =3D=3D -EIO);
> +		} else {
> +			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> +				       &data[idx].exec_sync, USER_FENCE_VALUE,
> +				       exec_queues[e], FIVE_SEC);
> +			if (flags & LOCK && !i)
> +				munlock(data, bo_size);
> +
> +			if (flags & MREMAP) {
> +				void *old =3D data;
> +				int remap_flags =3D MREMAP_MAYMOVE | MREMAP_FIXED;
> +
> +				if (flags & DONTUNMAP)
> +					remap_flags |=3D MREMAP_DONTUNMAP;
> +
> +				if (flags & READ_ONLY_REMAP)
> +					igt_assert(!mprotect(old, bo_size,
> +							     PROT_READ));
> +
> +				if (!next_data) {
> +					aligned_alloc_type =3D __aligned_alloc(aligned_size,
> +								    bo_size);
> +					data =3D aligned_alloc_type.ptr;
> +					__aligned_partial_free(&aligned_alloc_type);
> +				} else {
> +					data =3D next_data;
> +				}
> +				next_data =3D NULL;
> +				igt_assert(data);
> +
> +				data =3D mremap(old, bo_size, bo_size,
> +					      remap_flags, data);
> +				igt_assert(data !=3D MAP_FAILED);
> +
> +				if (flags & READ_ONLY_REMAP)
> +					igt_assert(!mprotect(data, bo_size,
> +							     PROT_READ |
> +							     PROT_WRITE));
> +
> +				addr =3D to_user_pointer(data);
> +				if (flags & DONTUNMAP)
> +					munmap(old, bo_size);
> +			}
> +
> +			if (!(flags & EVERY_OTHER_CHECK) || odd(i)) {
> +				if (flags & FORK_READ) {
> +					igt_fork(child, 1)
> +						igt_assert_eq(data[idx].data,
> +							      READ_VALUE(&data[idx]));
> +					if (!(flags & FORK_READ_AFTER))
> +						igt_assert_eq(data[idx].data,
> +							      READ_VALUE(&data[idx]));
> +					igt_waitchildren();
> +					if (flags & FORK_READ_AFTER)
> +						igt_assert_eq(data[idx].data,
> +							      READ_VALUE(&data[idx]));
> +				} else {
> +					igt_assert_eq(data[idx].data,
> +						      READ_VALUE(&data[idx]));
> +
> +					if (flags & MULTI_FAULT) {
> +						for (j =3D 1; j < N_MULTI_FAULT; ++j) {
> +							struct test_exec_data *__data =3D
> +								((void *)data) + j * orig_size;
> +
> +							igt_assert_eq(__data[idx].data,
> +								      READ_VALUE(&data[idx]));
> +						}
> +					}
> +				}
> +				if (flags & EVERY_OTHER_CHECK)
> +					igt_assert_eq(data[prev_idx].data,
> +						      READ_VALUE(&data[prev_idx]));
> +			}
> +		}
> +
> +		if (exec_ufence)
> +			exec_ufence[0] =3D 0;
> +
> +		if (bo) {
> +			__xe_vm_bind_assert(fd, vm, 0,
> +					    0, 0, addr, bo_size,
> +					    DRM_XE_VM_BIND_OP_MAP,
> +					    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +					    NULL, 0, 0, 0);
> +			munmap(data, bo_size);
> +			gem_close(fd, bo);
> +		}
> +
> +		if (flags & NEW) {
> +			if (flags & MMAP) {
> +				if (flags & FREE)
> +					munmap(data, bo_size);
> +				else
> +					pending_free[i] =3D data;
> +				data =3D mmap(NULL, bo_size, PROT_READ |
> +					    PROT_WRITE, MAP_SHARED |
> +					    MAP_ANONYMOUS, -1, 0);
> +				igt_assert(data !=3D MAP_FAILED);
> +			} else if (flags & BO_MAP && odd(i)) {
> +				if (!bo) {
> +					if (flags & FREE)
> +						free(data);
> +					else
> +						pending_free[i] =3D data;
> +				}
> +
> +				aligned_alloc_type =3D __aligned_alloc(aligned_size, bo_size);
> +				data =3D aligned_alloc_type.ptr;
> +				igt_assert(data);
> +				__aligned_partial_free(&aligned_alloc_type);
> +
> +				bo_flags =3D DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +				bo =3D xe_bo_create(fd, vm, bo_size,
> +						  vram_if_possible(fd, eci->gt_id),
> +						  bo_flags);
> +				data =3D xe_bo_map_fixed(fd, bo, bo_size,
> +						       to_user_pointer(data));
> +
> +				xe_vm_bind_async(fd, vm, 0, bo, 0,
> +						 to_user_pointer(data),
> +						 bo_size, 0, 0);
> +			} else {
> +				if (!bo) {
> +					if (flags & FREE)
> +						free(data);
> +					else
> +						pending_free[i] =3D data;
> +				}
> +				bo =3D 0;
> +				data =3D aligned_alloc(aligned_size, bo_size);
> +				igt_assert(data);
> +			}
> +			addr =3D to_user_pointer(data);
> +			if (!(flags & SKIP_MEMSET))
> +				memset(data, 0, bo_size);
> +		}
> +
> +		prev_idx =3D idx;
> +	}
> +
> +	if (bo) {
> +		__xe_vm_bind_assert(fd, vm, 0,
> +				    0, 0, addr, bo_size,
> +				    DRM_XE_VM_BIND_OP_MAP,
> +				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +				    NULL, 0, 0, 0);
> +		munmap(data, bo_size);
> +		data =3D NULL;
> +		gem_close(fd, bo);
> +	}
> +
> +	if (flags & BUSY)
> +		igt_assert_eq(unbind_system_allocator(), -EBUSY);
> +
> +	for (i =3D 0; i < n_exec_queues; i++)
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +
> +	if (exec_ufence)
> +		munmap(exec_ufence, SZ_4K);
> +
> +	if (flags & LOCK)
> +		munlock(data, bo_size);
> +
> +	if (file_fd !=3D -1)
> +		close(file_fd);
> +
> +	if (flags & NEW && !(flags & FREE)) {
> +		for (i =3D 0; i < n_execs; i++) {
> +			if (!pending_free[i])
> +				continue;
> +
> +			if (flags & MMAP)
> +				munmap(pending_free[i], bo_size);
> +			else
> +				free(pending_free[i]);
> +		}
> +		free(pending_free);
> +	}
> +	if (data) {
> +		if (flags & MMAP)
> +			munmap(data, bo_size);
> +		else if (!alloc)
> +			free(data);
> +	}
> +	if (free_vm)
> +		xe_vm_destroy(fd, vm);
> +}
> +
> +struct thread_data {
> +	pthread_t thread;
> +	pthread_mutex_t *mutex;
> +	pthread_cond_t *cond;
> +	pthread_barrier_t *barrier;
> +	int fd;
> +	struct drm_xe_engine_class_instance *eci;
> +	int n_exec_queues;
> +	int n_execs;
> +	size_t bo_size;
> +	size_t stride;
> +	uint32_t vm;
> +	unsigned int flags;
> +	void *alloc;
> +	bool *go;
> +};
> +
> +static void *thread(void *data)
> +{
> +	struct thread_data *t =3D data;
> +
> +	pthread_mutex_lock(t->mutex);
> +	while (!*t->go)
> +		pthread_cond_wait(t->cond, t->mutex);
> +	pthread_mutex_unlock(t->mutex);
> +
> +	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
> +		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
> +		  t->flags);
> +
> +	return NULL;
> +}
> +
> +static void
> +threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> +	size_t stride, unsigned int flags, bool shared_vm)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct thread_data *threads_data;
> +	int n_engines =3D 0, i =3D 0;
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	pthread_barrier_t barrier;
> +	uint32_t vm =3D 0;
> +	bool go =3D false;
> +	void *alloc =3D NULL;
> +
> +	if ((FILE_BACKED | FORK_READ) & flags)
> +		return;
> +
> +	xe_for_each_engine(fd, hwe)
> +		++n_engines;
> +
> +	if (shared_vm) {
> +		vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +		bind_system_allocator(NULL, 0);
> +	}
> +
> +	if (flags & SHARED_ALLOC) {
> +		uint64_t alloc_size;
> +
> +		igt_assert(stride);
> +
> +		alloc_size =3D sizeof(struct test_exec_data) * stride *
> +			n_execs * n_engines;
> +		alloc_size =3D xe_bb_size(fd, alloc_size);
> +		alloc =3D aligned_alloc(SZ_2M, alloc_size);
> +		igt_assert(alloc);
> +
> +		memset(alloc, 0, alloc_size);
> +		flags &=3D ~SHARED_ALLOC;
> +	}
> +
> +	threads_data =3D calloc(n_engines, sizeof(*threads_data));
> +	igt_assert(threads_data);
> +
> +	pthread_mutex_init(&mutex, 0);
> +	pthread_cond_init(&cond, 0);
> +	pthread_barrier_init(&barrier, 0, n_engines);
> +
> +	xe_for_each_engine(fd, hwe) {
> +		threads_data[i].mutex =3D &mutex;
> +		threads_data[i].cond =3D &cond;
> +		threads_data[i].barrier =3D (flags & SYNC_EXEC) ? &barrier : NULL;
> +		threads_data[i].fd =3D fd;
> +		threads_data[i].eci =3D hwe;
> +		threads_data[i].n_exec_queues =3D n_exec_queues;
> +		threads_data[i].n_execs =3D n_execs;
> +		threads_data[i].bo_size =3D bo_size;
> +		threads_data[i].stride =3D stride;
> +		threads_data[i].vm =3D vm;
> +		threads_data[i].flags =3D flags;
> +		threads_data[i].alloc =3D alloc ? alloc + i *
> +			sizeof(struct test_exec_data) : NULL;
> +		threads_data[i].go =3D &go;
> +		pthread_create(&threads_data[i].thread, 0, thread,
> +			       &threads_data[i]);
> +		++i;
> +	}
> +
> +	pthread_mutex_lock(&mutex);
> +	go =3D true;
> +	pthread_cond_broadcast(&cond);
> +	pthread_mutex_unlock(&mutex);
> +
> +	for (i =3D 0; i < n_engines; ++i)
> +		pthread_join(threads_data[i].thread, NULL);
> +
> +	if (shared_vm) {
> +		int ret;
> +
> +		if (flags & MMAP) {
> +			int tries =3D 300;
> +
> +			while (tries && (ret =3D unbind_system_allocator()) =3D=3D -EBUSY) {
> +				sleep(.01);
> +				--tries;
> +			}
> +			igt_assert_eq(ret, 0);
> +		}
> +		xe_vm_destroy(fd, vm);
> +		if (alloc)
> +			free(alloc);
> +	}
> +	free(threads_data);
> +}
> +
> +static void process(struct drm_xe_engine_class_instance *hwe, int n_exec=
_queues,
> +		    int n_execs, size_t bo_size, size_t stride,
> +		    unsigned int flags)
> +{
> +	struct process_data *pdata;
> +	int map_fd;
> +	int fd;
> +
> +	map_fd =3D open(sync_file, O_RDWR, 0x666);
> +	pdata =3D mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +	wait_pdata(pdata);
> +
> +	fd =3D drm_open_driver(DRIVER_XE);
> +	test_exec(fd, hwe, n_exec_queues, n_execs,
> +		  bo_size, stride, 0, NULL, NULL, flags);
> +	drm_close_driver(fd);
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +static void
> +processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> +	  size_t stride, unsigned int flags)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct process_data *pdata;
> +	int map_fd;
> +
> +	if (flags & FORK_READ)
> +		return;
> +
> +	map_fd =3D open(sync_file, O_RDWR | O_CREAT, 0x666);
> +	posix_fallocate(map_fd, 0, sizeof(*pdata));
> +	pdata =3D mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +
> +	init_pdata(pdata, 0);
> +
> +	xe_for_each_engine(fd, hwe) {
> +		igt_fork(child, 1)
> +			process(hwe, n_exec_queues, n_execs, bo_size,
> +				stride, flags);
> +	}
> +
> +	signal_pdata(pdata);
> +	igt_waitchildren();
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +struct section {
> +	const char *name;
> +	unsigned int flags;
> +};
> +
> +igt_main
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	const struct section sections[] =3D {
> +		{ "malloc", 0 },
> +		{ "malloc-multi-fault", MULTI_FAULT },
> +		{ "malloc-fork-read", FORK_READ },
> +		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
> +		{ "malloc-mlock", LOCK },
> +		{ "malloc-race", RACE },
> +		{ "malloc-busy", BUSY },
> +		{ "malloc-bo-unmap", BO_UNMAP },
> +		{ "mmap", MMAP },
> +		{ "mmap-remap", MMAP | MREMAP },
> +		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
> +		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
> +		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
> +			READ_ONLY_REMAP },
> +		{ "mmap-remap-eocheck", MMAP | MREMAP | EVERY_OTHER_CHECK },
> +		{ "mmap-remap-dontunmap-eocheck", MMAP | MREMAP | DONTUNMAP |
> +			EVERY_OTHER_CHECK },
> +		{ "mmap-remap-ro-eocheck", MMAP | MREMAP | READ_ONLY_REMAP |
> +			EVERY_OTHER_CHECK },
> +		{ "mmap-remap-ro-dontunmap-eocheck", MMAP | MREMAP | DONTUNMAP |
> +			READ_ONLY_REMAP | EVERY_OTHER_CHECK },
> +		{ "mmap-huge", MMAP | HUGE_PAGE },
> +		{ "mmap-shared", MMAP | LOCK | MMAP_SHARED },
> +		{ "mmap-shared-remap", MMAP | LOCK | MMAP_SHARED | MREMAP },
> +		{ "mmap-shared-remap-dontunmap", MMAP | LOCK | MMAP_SHARED |
> +			MREMAP | DONTUNMAP },
> +		{ "mmap-shared-remap-eocheck", MMAP | LOCK | MMAP_SHARED |
> +			MREMAP | EVERY_OTHER_CHECK },
> +		{ "mmap-shared-remap-dontunmap-eocheck", MMAP | LOCK |
> +			MMAP_SHARED | MREMAP | DONTUNMAP | EVERY_OTHER_CHECK },
> +		{ "mmap-mlock", MMAP | LOCK },
> +		{ "mmap-file", MMAP | FILE_BACKED },
> +		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
> +		{ "mmap-race", MMAP | RACE },
> +		{ "free", NEW | FREE },
> +		{ "free-race", NEW | FREE | RACE },
> +		{ "new", NEW },
> +		{ "new-race", NEW | RACE },
> +		{ "new-bo-map", NEW | BO_MAP },
> +		{ "new-busy", NEW | BUSY },
> +		{ "mmap-free", MMAP | NEW | FREE },
> +		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
> +		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
> +		{ "mmap-new", MMAP | NEW },
> +		{ "mmap-new-huge", MMAP | NEW | HUGE_PAGE },
> +		{ "mmap-new-race", MMAP | NEW | RACE },
> +		{ "malloc-nomemset", SKIP_MEMSET },
> +		{ "malloc-mlock-nomemset", SKIP_MEMSET | LOCK },
> +		{ "malloc-race-nomemset", SKIP_MEMSET | RACE },
> +		{ "malloc-busy-nomemset", SKIP_MEMSET | BUSY },
> +		{ "malloc-bo-unmap-nomemset", SKIP_MEMSET | BO_UNMAP },
> +		{ "mmap-nomemset", SKIP_MEMSET | MMAP },
> +		{ "mmap-huge-nomemset", SKIP_MEMSET | MMAP | HUGE_PAGE },
> +		{ "mmap-shared-nomemset", SKIP_MEMSET | MMAP | MMAP_SHARED },
> +		{ "mmap-mlock-nomemset", SKIP_MEMSET | MMAP | LOCK },
> +		{ "mmap-file-nomemset", SKIP_MEMSET | MMAP | FILE_BACKED },
> +		{ "mmap-file-mlock-nomemset", SKIP_MEMSET | MMAP | LOCK | FILE_BACKED =
},
> +		{ "mmap-race-nomemset", SKIP_MEMSET | MMAP | RACE },
> +		{ "free-nomemset", SKIP_MEMSET | NEW | FREE },
> +		{ "free-race-nomemset", SKIP_MEMSET | NEW | FREE | RACE },
> +		{ "new-nomemset", SKIP_MEMSET | NEW },
> +		{ "new-race-nomemset", SKIP_MEMSET | NEW | RACE },
> +		{ "new-bo-map-nomemset", SKIP_MEMSET | NEW | BO_MAP },
> +		{ "new-busy-nomemset", SKIP_MEMSET | NEW | BUSY },
> +		{ "mmap-free-nomemset", SKIP_MEMSET | MMAP | NEW | FREE },
> +		{ "mmap-free-huge-nomemset", SKIP_MEMSET | MMAP | NEW | FREE | HUGE_PA=
GE },
> +		{ "mmap-free-race-nomemset", SKIP_MEMSET | MMAP | NEW | FREE | RACE },
> +		{ "mmap-new-nomemset", SKIP_MEMSET | MMAP | NEW },
> +		{ "mmap-new-huge-nomemset", SKIP_MEMSET | MMAP | NEW | HUGE_PAGE },
> +		{ "mmap-new-race-nomemset", SKIP_MEMSET | MMAP | NEW | RACE },
> +		{ NULL },
> +	};
> +	const struct section psections[] =3D {
> +		{ "munmap-cpu-fault", CPU_FAULT },
> +		{ "munmap-no-cpu-fault", 0 },
> +		{ "remap-cpu-fault", CPU_FAULT | REMAP },
> +		{ "remap-no-cpu-fault", REMAP },
> +		{ "middle-munmap-cpu-fault", MIDDLE | CPU_FAULT },
> +		{ "middle-munmap-no-cpu-fault", MIDDLE },
> +		{ "middle-remap-cpu-fault", MIDDLE | CPU_FAULT | REMAP },
> +		{ "middle-remap-no-cpu-fault", MIDDLE | REMAP },
> +		{ NULL },
> +	};
> +	const struct section esections[] =3D {
> +		{ "malloc", 0 },
> +		{ "malloc-mix-bo", MIX_BO_ALLOC },
> +		{ NULL },
> +	};
> +	int fd;
> +
> +	igt_fixture {
> +		struct xe_device *xe;
> +
> +		fd =3D drm_open_driver(DRIVER_XE);
> +		igt_require(!xe_supports_faults(fd));
> +
> +		xe =3D xe_device_get(fd);
> +		va_bits =3D xe->va_bits;
> +		open_sync_file();
> +	}
> +
> +	for (const struct section *s =3D sections; s->name; s++) {
> +		igt_subtest_f("once-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("once-large-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_2M, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("twice-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 2, 0, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("twice-large-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 2, SZ_2M, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("many-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 128, 0, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("many-stride-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 128, 0, 256, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("many-execqueues-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 16, 128, 0, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("many-large-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("many-large-execqueues-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("threads-many-%s", s->name)
> +			threads(fd, 1, 128, 0, 0, s->flags, false);
> +
> +		igt_subtest_f("threads-many-stride-%s", s->name)
> +			threads(fd, 1, 128, 0, 256, s->flags, false);
> +
> +		igt_subtest_f("threads-many-execqueues-%s", s->name)
> +			threads(fd, 16, 128, 0, 0, s->flags, false);
> +
> +		igt_subtest_f("threads-many-large-%s", s->name)
> +			threads(fd, 1, 128, SZ_2M, 0, s->flags, false);
> +
> +		igt_subtest_f("threads-many-large-execqueues-%s", s->name)
> +			threads(fd, 16, 128, SZ_2M, 0, s->flags, false);
> +
> +		igt_subtest_f("threads-shared-vm-many-%s", s->name)
> +			threads(fd, 1, 128, 0, 0, s->flags, true);
> +
> +		igt_subtest_f("threads-shared-vm-many-stride-%s", s->name)
> +			threads(fd, 1, 128, 0, 256, s->flags, true);
> +
> +		igt_subtest_f("threads-shared-vm-many-execqueues-%s", s->name)
> +			threads(fd, 16, 128, 0, 0, s->flags, true);
> +
> +		igt_subtest_f("threads-shared-vm-many-large-%s", s->name)
> +			threads(fd, 1, 128, SZ_2M, 0, s->flags, true);
> +
> +		igt_subtest_f("threads-shared-vm-many-large-execqueues-%s", s->name)
> +			threads(fd, 16, 128, SZ_2M, 0, s->flags, true);
> +
> +		igt_subtest_f("process-many-%s", s->name)
> +			processes(fd, 1, 128, 0, 0, s->flags);
> +
> +		igt_subtest_f("process-many-stride-%s", s->name)
> +			processes(fd, 1, 128, 0, 256, s->flags);
> +
> +		igt_subtest_f("process-many-execqueues-%s", s->name)
> +			processes(fd, 16, 128, 0, 0, s->flags);
> +
> +		igt_subtest_f("process-many-large-%s", s->name)
> +			processes(fd, 1, 128, SZ_2M, 0, s->flags);
> +
> +		igt_subtest_f("process-many-large-execqueues-%s", s->name)
> +			processes(fd, 16, 128, SZ_2M, 0, s->flags);
> +	}
> +
> +	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
> +		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
> +
> +	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc-race")
> +		threads(fd, 1, 128, 0, 256, RACE | SHARED_ALLOC, true);
> +
> +	igt_subtest("threads-shared-alloc-many-stride-malloc")
> +		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, false);
> +
> +	igt_subtest("threads-shared-alloc-many-stride-malloc-sync")
> +		threads(fd, 1, 128, 0, 256, SHARED_ALLOC | SYNC_EXEC, false);
> +
> +	igt_subtest("threads-shared-alloc-many-stride-malloc-race")
> +		threads(fd, 1, 128, 0, 256, RACE | SHARED_ALLOC, false);
> +
> +	igt_subtest_f("fault")
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
> +				  FAULT);
> +
> +	for (const struct section *s =3D psections; s->name; s++) {
> +		igt_subtest_f("partial-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				partial(fd, hwe, s->flags);
> +	}
> +
> +	igt_subtest_f("unaligned-alloc")
> +		xe_for_each_engine(fd, hwe) {
> +			many_allocs(fd, hwe, (SZ_1M + SZ_512K) * 8,
> +				    SZ_1M + SZ_512K, SZ_4K, NULL, 0);
> +			break;
> +		}
> +
> +	igt_subtest_f("fault-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> +				    BENCHMARK);
> +
> +	igt_subtest_f("fault-threads-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> +				    BENCHMARK | CPU_FAULT_THREADS);
> +
> +	igt_subtest_f("fault-threads-same-page-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> +				    BENCHMARK | CPU_FAULT_THREADS |
> +				    CPU_FAULT_SAME_PAGE);
> +
> +	igt_subtest_f("fault-process-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> +				    BENCHMARK | CPU_FAULT_PROCESS);
> +
> +	igt_subtest_f("fault-process-same-page-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> +				    BENCHMARK | CPU_FAULT_PROCESS |
> +				    CPU_FAULT_SAME_PAGE);
> +
> +	for (const struct section *s =3D esections; s->name; s++) {
> +		igt_subtest_f("evict-%s", s->name)
> +			xe_for_each_engine(fd, hwe) {
> +				many_allocs(fd, hwe,
> +					    xe_visible_vram_size(fd, hwe->gt_id),
> +					    SZ_8M, SZ_1M, NULL, s->flags);
> +				break;
> +			}
> +	}
> +
> +	for (const struct section *s =3D esections; s->name; s++) {
> +		igt_subtest_f("processes-evict-%s", s->name)
> +			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
> +	}
> +
> +	igt_fixture {
> +		xe_device_put(fd);
> +		drm_close_driver(fd);
> +		close_sync_file();
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 6328792e3a..20ddddb89f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -295,6 +295,7 @@ intel_xe_progs =3D [
>  	'xe_exec_reset',
>  	'xe_exec_sip',
>  	'xe_exec_store',
> +	'xe_exec_system_allocator',
>  	'xe_exec_threads',
>  	'xe_exercise_blt',
>  	'xe_fault_injection',
> --=20
> 2.34.1
>=20
>=20

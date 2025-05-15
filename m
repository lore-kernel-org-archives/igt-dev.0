Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B338EC3DA6D
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 15:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C3710E8FC;
	Thu, 15 May 2025 15:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3U+BXr4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB5210E8FC
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747324715; x=1778860715;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=02GAKfoRWFD9100whJRFbpNmOOeAD345JoSxMYffAtI=;
 b=W3U+BXr4o5j821IxUog+qNuqUF7BgDUNzfQYjw65Wwel4XO0quxSN9i1
 cMN1JdZva/mht71qdVml+/0sGZVYShwp0Yms+U/qDxy4HvxAeXFPkWHlv
 jvjoVOiFBsbntue7V+uZplkzkHSl36oe+LoniW0cvGpEtvihLi44wu+XU
 k0jVulyGvmWie3DmigIMjbxI2r9R3kwnrWyTPJmVeyt9RJJvc1e4WYtkY
 x6BfZzYfqWZbLOr4xvYRIrPMD6KtXGFxM8usTvP9TY+xm5BKW2vAPFu1a
 TPdM1Nnahln2DpllCle1VthJ7DUUXFfAlnbgz16/kE/FyYAf6D9xGGXNT Q==;
X-CSE-ConnectionGUID: 6jf1OSS+RTiMFzvhIoN95A==
X-CSE-MsgGUID: yOYJ/t+PSUiP7pqIuJQEJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="74677193"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="74677193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 08:58:34 -0700
X-CSE-ConnectionGUID: 6ULxqe4aR7CshYc1Vl1fyw==
X-CSE-MsgGUID: ijIQZodAQdSKK/FAjPhHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="175533769"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 08:58:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 08:58:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 08:58:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 08:58:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2IsAm4feq+dftzDKt33naSIjzJUXXxxz1ObILEm7HcwuJsruAws2vFOjg3IMiqbqR9ss/2drkhXbgxqTWLhRCT43+lp5BhDGms1wUnjZGCFxA5GKb7C/OuNxZ4ntPfm6ZVHxgcKUFAg5/Mxbb7+WZ9ZVchZrQj9DdxaMXfrI3RuXe7jO0OFWh5cJAuNIesc8LQ0kucfTz902jtxZzNHCdA6pNvrQoLNWZgk8+dlqSkw1LbFuMPgrFag7YuV/nSmMSD4tjZDkZ2Gyuf9RwnyY7mDGwmOp7wDYOo+kgMRC1YIHjrBZd6ZmC2SLfI2Cn+F1iPzurVmvw1pTYTbaKRgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1xQ7Jed+NIWm0Z573VCHg8pvddyMS4A0MVL2s4LIsM=;
 b=kZYdj6MziC6XsqfOXYD64GAmXjjrA0nX19jZB0hOlsvGdmH2HA1j/vkPc/xpA8UPgAaLBna5Lvekvh8L2o0KFzDQu7A5SO2dHR7pzNaosra80ID8sm+J3A79cWgSt6VfWtPILfwyGKn7kupEavUVa5EmA5cDdUwJ1hsoSqtsshGreAQo3ZDz3G8GBwG9WWPUyx/4mgreuvfI7T+j5lVI6iPvIkWIBh91gRNx+KESs3tmv46S3Wv+EZIIrzh2q24iGsyeTDK205qNT6z2g1AxA7uDvl29grXcePf5USNwJuBOlWMTO2ZIGdjAmltNK92R1wLe4fn5vzLh2b/1iVBZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by PH7PR11MB8121.namprd11.prod.outlook.com (2603:10b6:510:234::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 15:58:30 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:58:30 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
 prefetch ranges
Thread-Topic: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
 prefetch ranges
Thread-Index: AQHbxCmA7TKXxlJe6UK5kV9kVt3bC7PSwZiAgAEYyvA=
Date: Thu, 15 May 2025 15:58:30 +0000
Message-ID: <BL3PR11MB5747F353996B9B7D7FF83C0CD090A@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
 <20250513170711.14518-4-sai.gowtham.ch@intel.com>
 <aCUiL2ZEbdCLFBRw@lstrano-desk.jf.intel.com>
In-Reply-To: <aCUiL2ZEbdCLFBRw@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|PH7PR11MB8121:EE_
x-ms-office365-filtering-correlation-id: 04ec407c-c05f-4925-2e4c-08dd93c95654
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZxKUF/0RFM+QahrkszY8f1NrVKGfXU4/AP1taVXclmcg9NpofYL+yO1TtaYM?=
 =?us-ascii?Q?zV6NfOUYXUz1WIKwkSM3FhvKwuffKndQ2hvaH0qMF4V7gIj5LIj7DA3c0Su+?=
 =?us-ascii?Q?DrA1lRNhd2MI+Xilv/HKJqQ56FvB7DThqTyMPykuC3z6OAvzM63+wGYdbdmT?=
 =?us-ascii?Q?5N7Hpb7do5Jobsgbpso5O4/A7Z8CNn1KDniK9dnWzKMTTchWsZRDuQ7vO5z5?=
 =?us-ascii?Q?du7y/h79sPzFUVX2110ACwYLBTdcG9xlAeCrC4KcVW2qNBzjqYU94mEuaLXi?=
 =?us-ascii?Q?kJzvzh1kvFV8fNCnZ2ITGzob8Bf7ugfb3PRh56CB5uJlmmOvfBY5KeBHgJjZ?=
 =?us-ascii?Q?z9L8egb75jnoDCxwoAOGNyPiaYC4icb1xSBDOhpPy6Mxihf4CTZ9dAx2PlB7?=
 =?us-ascii?Q?JaIcLTrTqkW+ZvZuVkIX+KI+PI+84X1PnNYCjPMvN7Vrt7GQu8R/HQ6iaomm?=
 =?us-ascii?Q?7lq4PWk5tnLgX0qwm2yA8JjWuPr5EsWE2KsjKN1xK1dzfuJ8k0wzIkswp01I?=
 =?us-ascii?Q?vsdjqiDXmF41/+nuFnRWJNo1+I1cxWL2ZfudSfRbJPbmHtuYLVt2PQr/tfHZ?=
 =?us-ascii?Q?d9eynMSArliPHeJGesupdqUr9r5FIwaRpvJXZdOONHsb8wks1P813C2lT1Yx?=
 =?us-ascii?Q?ftLAAcHJ/dBD/wOY/pXdPHj4SosBx1B6e3/vfMLvwlNqhkMORuFi7vGrCrHN?=
 =?us-ascii?Q?hH3YNoEPp2QNJbFkaxkpAE4hTSet6CvbYP0WmrPGrxB9nuBUEfGtIU4cZaM2?=
 =?us-ascii?Q?PDsqik0H1wgeLeyhdXkBvXHsSnG0GatO+iVWTNrtHYJb28SBMIvYutwuRTgz?=
 =?us-ascii?Q?+CYCIzg0n4iFcH0anAv9aY1//8InIvrNF8WUtXAAijBap6CUX1XHjiVU4184?=
 =?us-ascii?Q?+2t/FnM23hAr3DV30t7ZpK4dKrAwwc38/fcAGKsiwfu57/LYI+pWWcHrIPZg?=
 =?us-ascii?Q?szz0TxF3xdL7uDxTmVhq26pYUhXWDMMtkIs2slvOBxMk1t0FR3oQx6/YNhna?=
 =?us-ascii?Q?+snQqBM6sdN+GxChMzYsBYBN+dvsgX4E+JMKfPDgUrFbdW3XY3J3GGQVpdRB?=
 =?us-ascii?Q?o6htZPRHPYSXl0z7owXmDEZmxeBP5O48nBXE6wIn5p4tYb+CuhJu4Xeu2q50?=
 =?us-ascii?Q?YRIS1tVA2Ilv+KejqOIETFMhutf2zBGdzWBGOzu4a11D7RDskhzqvu0xiFyE?=
 =?us-ascii?Q?59jh2HmzhUy859KUmJnztQzxKh7chZkgJQ3IpMqEkEdbCo5pSl570qTvJuLN?=
 =?us-ascii?Q?AyuXCVBVYqR28YNKFFVxdv/m462fo3V5HQxxjMdVN4f9VGITd8FJRDUKjOEq?=
 =?us-ascii?Q?XhLlZYcG1HvU35I+g0QV5ufd9Q3PdXv0m5oxsNYgLQvRA8eIceOtlOjON/nT?=
 =?us-ascii?Q?81TIYSa13qv39Vgc0yYN+iEKdi46ylu2qrbizv4eXCl6O2FXLjCk/a/ixxhG?=
 =?us-ascii?Q?JPjix5q/CS3k7/sz9et+YxQhzS1ThFp6Js0xxYQTQ/OOWYkCNrC9Q0Oal9/9?=
 =?us-ascii?Q?AXLi6CiqA+GWfsA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KkbU9Mu3lINHQ1irP27f9UO9xnpX7U4E7IHD6HadgvKB+imV8hRMIxSph9tK?=
 =?us-ascii?Q?OW9yxtvG2BdK+5H5k6ZzOJHpAIZRwzNfTaPVsKD22qq2dLaG0dpOTO9/iFiC?=
 =?us-ascii?Q?vwHFBizhLXv+/zyfTLC4CaJUddndoFJetbOGbZNs6CQeqjzgi+aM+UYjw7R6?=
 =?us-ascii?Q?a1vk5g+XDzrpygGRmspUS77jv0NVXuNbdLW9Bw+qLkZMksGFE+5F6lI2UP9x?=
 =?us-ascii?Q?Z+AYmQtSNp5oO9qL7qftlFuQ1mQ7FjwlTtjJvHLYiGDlEWo9NJXE9Wa7fRjS?=
 =?us-ascii?Q?kdho6tBJKb7/iTmQEnKftu0L9vsYZ8wRygj9CcAdlLD34OeUZCFdgNKVvP0x?=
 =?us-ascii?Q?HktfI3b8NoIQaZ4YZFsYCkizntY+g8QAJDAI+wOYJPo22fcGM5hsKNEjm4WS?=
 =?us-ascii?Q?7hVkZPtx/HQZyt8XrqnZVYC896j2fGrWa8yanygsrQlkHefzapo8frUVi3/v?=
 =?us-ascii?Q?Y0+cR4vnNJsBPXqRHjXOxUy/EF9HlOcUXEfQouqAUgzry5Zdn17NXW2VdjY/?=
 =?us-ascii?Q?hRjebQScyFZwoAd4b3OGAT5eTlOQnLVs5poZbE48qXXQzID38Fp+tIV5nFHa?=
 =?us-ascii?Q?M4551Mc0tsNS3XvA3nDPNg7ApdxXbns74PkrK9j5U8XHPDv6sip7F6VN1Dt+?=
 =?us-ascii?Q?sCv4x2/2mjaZz20NUUUFNQz/2O1He2lCgUkMqwDZcU4x2iTssCvLk7bpMuNV?=
 =?us-ascii?Q?Ywa+9nLWKLM+52l1uOAnEIMhyAuOSAoml4fI0ZMrLWy7ur6w/bn8ALL+0Jgp?=
 =?us-ascii?Q?fScfk0reL4I5kFVOmjW8RR43KK+RqiVCgnk8ssb1SizasjiKEKsQsPnRTaJE?=
 =?us-ascii?Q?RnAX4NYUWX7UiF+33uMcHmqytfWms3VcTUNuOZ6PL8acRv4eNnB6YE/J05k4?=
 =?us-ascii?Q?HYlIk+pkdthGUoMfvl2bFS8JJRQb1p8mXTpH6fqgAG6kFrdAOgW54Vu/EerF?=
 =?us-ascii?Q?WvOXYE8/D3wFhQWAX5WFGIsIqq4YjOfysEw1UGP1w1YxrYhy1mAmLmalEZ2h?=
 =?us-ascii?Q?7ZCG19nJENit0Cegvta9vL2AwZsalawXUQLHaYX1J57p00Cc0bIYi8bDXIGM?=
 =?us-ascii?Q?90KFnjYoVe0wZZlJk9dMiZG8v8EQBw9Nr07kol/9hs8tWqD7l7wYLyCaMCTS?=
 =?us-ascii?Q?qDVvl6wjU3O3nE53CaTuCHb//jIBIXNp4nG5aXtFKOfB1qIJrA06THUWQsA4?=
 =?us-ascii?Q?TOOwqjUvVod/u2a9wuz9WGkeRxZrPUimX3qDb7M3fQs+dYkluvDf+Hqk1YkG?=
 =?us-ascii?Q?eT2pqe35Kb1qmRzM9tC1cwRrNYrH3F7iw73Z/TYSrF8su7JFU8zk+s+5oMY9?=
 =?us-ascii?Q?vs/nyakNTGknSc+//9t10/+l5xslmoWgpoIV97HTglWFgA4ZicoT7iUBpOMz?=
 =?us-ascii?Q?aN0EIR1zj65LpfIa88WduT1e2PjJvUG13Hxe+7CIBQpCE4TmeDfTNLgQOnDx?=
 =?us-ascii?Q?MoqyPAgKF2VYyzu1cLC8jL4VUn9/TxuAAPMis4Mh0yVXtuZx2qWk+46F/YFC?=
 =?us-ascii?Q?vxLwneUSq7mvygOonsoL8XeHTMlvIHcS6QeC/mekZ3NU0fDU1zmP748TR2qa?=
 =?us-ascii?Q?rbq9SAEJiYc8XIBaGenRSOycIaf7tdueN7IRCROR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ec407c-c05f-4925-2e4c-08dd93c95654
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 15:58:30.2201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jKWxJf26TbRGGFEZmJFxWKeqkJJVOGpnsj6VfXMb80+VsqVDRHUYB++zsVTMxc33YMS/vV02ULRCLic3gLiHrbfZxybZlZUiD+vsHg3NyPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8121
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
>From: Brost, Matthew <matthew.brost@intel.com>
>Sent: Thursday, May 15, 2025 4:37 AM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>Cc: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
><himal.prasad.ghimiray@intel.com>
>Subject: Re: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
>prefetch ranges
>
>On Tue, May 13, 2025 at 05:07:11PM +0000, sai.gowtham.ch@intel.com wrote:
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Test rebinds the prefetch ranges to check the ideal behaviour of
>> prefetch mechanisim, expecting address ranges in the corresponding mem
>> regions has to be created again and use those address ranges to submit
>workloads.
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_exec_system_allocator.c | 47
>> +++++++++++++++++++++++---
>>  1 file changed, 42 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c
>> b/tests/intel/xe_exec_system_allocator.c
>> index c3f0e61f3..94907847c 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -484,6 +484,24 @@ static void test_basic(int fd, struct
>drm_xe_engine_class_instance *eci,
>>   * Description: Prefetch of mutliple ranges within arg[1] size and chec=
k if
>multiple ranges are created
>>   * Test category: functionality test
>>   *
>> + * SUBTEST: bind-vram-%s
>> + * Description: Validate prefetch-smem of size arg[1] by rebinding them=
 with
>prefetch-vram to
>> + * 		check the behaviour, ideal behaviour is to migrate ranges
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: bind-smem-%s
>> + * Description: Validate prefetch-smem of size arg[1] by rebinding them=
 with
>prefetch-vram
>> + * 		check the behaviour, ideal behaviour is to migrate ranges
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: multi-range-bind-vram-%s
>> + * Description: Validate multiple ranges of size arg[1] by binding
>> + them with multiple ranges at vram
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: multi-range-bind-smem-%s
>> + * Description: Validate multiple ranges of size arg[1] by binding
>> + them with multiple ranges at smem
>> + * Test category: functionality test
>> + *
>>   * arg[1]:
>>   *
>>   * @SZ_4K: SZ_4K
>> @@ -492,7 +510,7 @@ static void test_basic(int fd, struct
>drm_xe_engine_class_instance *eci,
>>   */
>>  #define MAX_BATCH_DWORDS 16
>>  static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
>> -		     size_t bo_size, unsigned int flags, int num_dwords)
>> +		     size_t bo_size, unsigned int flags, int num_dwords, bool bind)
>
>You have flags field but added a bool for bind? Confusing.
This is an older patch BIND flags was not part of it, this is changed in th=
e latest patch
>Again I think you should build prefetch tests within existing tests (the t=
est_exec
>function).

Idea was to not club prefetch tests with the existing test_exec to make the=
m future proof for any debug purpose,  However if you
think otherwise this can be moved under test_exec.=20

-----
Gowtham
>
>Matt
>
>>  {
>>  	struct batch_data *data;
>>  	uint64_t target_addr;
>> @@ -542,6 +560,13 @@ static void prefetch(int fd, struct
>drm_xe_engine_class_instance *eci,
>>  	sync[0].addr =3D to_user_pointer(exec_ufence);
>>  	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRA=
M ?
>1 : 0);
>>  	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>> +	if (bind) {
>> +		exec_ufence[0] =3D 0;
>> +		sync[0].addr =3D to_user_pointer(exec_ufence);
>> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags &
>VRAM ? 0 : 1);
>> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>> +		exec_ufence[0] =3D 0;
>> +	}
>>  	exec.exec_queue_id =3D exec_queues;
>>
>>  	for (int i =3D 0; i < num_dwords; i++) { @@ -2045,16 +2070,28 @@
>> igt_main
>>
>>  	for (m =3D mode; m->name; m++) {
>>                  igt_subtest_f("prefetch-smem-%s", m->name)
>> -                        prefetch(fd, &engine->instance, m->size, 0, 1);
>> +                        prefetch(fd, &engine->instance, m->size, 0,
>> + 1, 0);
>>
>>                  igt_subtest_f("prefetch-vram-%s", m->name)
>> -                        prefetch(fd, &engine->instance, m->size, VRAM, =
1);
>> +                        prefetch(fd, &engine->instance, m->size,
>> + VRAM, 1, 0);
>>
>>                  igt_subtest_f("multi-range-smem-%s", m->name)
>> -                        prefetch(fd, &engine->instance, m->size, 0, 10)=
;
>> +                        prefetch(fd, &engine->instance, m->size, 0,
>> + 10, 0);
>>
>>                  igt_subtest_f("multi-range-vram-%s", m->name)
>> -                        prefetch(fd, &engine->instance, m->size, VRAM, =
10);
>> +                        prefetch(fd, &engine->instance, m->size,
>> + VRAM, 10, 0);
>> +
>> +		igt_subtest_f("bind-vram-%s", m->name)
>> +			prefetch(fd, &engine->instance, m->size, 0, 1, 1);
>> +
>> +		igt_subtest_f("bind-smem-%s", m->name)
>> +			prefetch(fd, &engine->instance, m->size, VRAM, 1, 1);
>> +
>> +		igt_subtest_f("multi-range-bind-vram-%s", m->name)
>> +			prefetch(fd, &engine->instance, m->size, 0, 10, 1);
>> +
>> +		igt_subtest_f("multi-range-bind-smem-%s", m->name)
>> +			prefetch(fd, &engine->instance, m->size, VRAM, 10, 1);
>>          }
>>
>>  	igt_fixture {
>> --
>> 2.34.1
>>

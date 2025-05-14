Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7A0C3ABDA
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 21:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D74310E745;
	Wed, 14 May 2025 21:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmMsIT0M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE70610E745
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 21:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747259230; x=1778795230;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ho1DLWXcOBin6jTLtyF8p2MAgyuiQyUqmOPzer/44lc=;
 b=ZmMsIT0M7KGvIpI4xLHfGMnzBM8LguMLB4kAJSB15Pg8GWBh3e67Jq4D
 YVE6QiMfwMHgWBknAyvyaWwv/WIGkzKkWv1byTW1inXd2SlA8UeUAVlWl
 fm6gfO+bZ7Tew97aIg+JLicySIFdR9ce9UGZ6QdSyvH4GMVcYEmm1+MxR
 6eJKk4Mrifl6FaELnGl57eUv7PSZoxKju16i1u3hGuhjwO/Pvhz/Qi1Zw
 eTAeqB2Me8XuY93/kDGAKNKBZyU2VLtDHTmmH4QtuR8/hWPqwDB2D4Rmz
 Vh/9DPJ60pYwd/K/bMLF5OKJ4qEOPOFTT0btVl/v+lHZ5QWJvrF4W1riO g==;
X-CSE-ConnectionGUID: 2Zqyqs9ZS+KZx7LzW1Jf3Q==
X-CSE-MsgGUID: bFdSBvp4TbiPJ/kYdDeU8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49045015"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49045015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:47:09 -0700
X-CSE-ConnectionGUID: aFSxkPBrTr6z1dbuFpbUNg==
X-CSE-MsgGUID: ve7JrUIsQ+yD5mKrg5Ntzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="143361006"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:47:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 14:47:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 14:47:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 14:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV9RawirbVXnNvtkoh4+TgmF/AgNHYX5y828KyJMbs5rpd22Sw6lEUN++nypB+HxFmSfP5BA9TS9fZP65l9KznbrdL08CQQIGE7g4ZQ4gbnmXHeQW2cXWD4CMYTVTpOzNQzkQSNCPj/W80rL3pQpp0b8XsWDnCzf7xHFc60URM3M3gKSktDeqrDARwG/VtotnAHSUjNmUkXNySO4NLGmniCTj0cwd8oBo82fBxh8s7jLVW8EaTvlGgjFVmGt5kjTr64yYXxxAzYv2XRpPDUOFxtg8OEsjNKkFcjM5nAoyJXvr2FS7/elZJ3L++jEs8pJxCMeLe+Y7O8jk2D1k+1yvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=695mNQ17JB6l0Ilv58bozWKsJi05r8Eis6PoNQpNp0I=;
 b=TVQtiB5FcXhgkqhOi1H40YHSZ+Jyx+ZL0iJN9SSsVupzHnTt5ieQd/JoV7KTUo1+5jl4Pa5YAnSlGhf3GJTyftCIY8FhwKJFoPK0XuSDOjX8+fUJJ6rZGapqLOGhC+QrElGcTdPamadwkM/eANdG3GCBGfqGXzMtteS729PgQtbj3NHbWeK0S6J0uBl91dgK0rGEOKFXz69JSzpr8sCL98AXcTPOhFifMqIO8oM+RxxB6sUHNfNypH8bbFlljQC/11RP2S3zmnmiSPC5fJy8T3OvvqK8s8fcLsQDpQiF6CxENcy2CLAwEChkkFN/T5YPSS47ifqNRHaeMKoYpw8YtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB7592.namprd11.prod.outlook.com (2603:10b6:806:343::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 21:47:06 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 21:47:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
 prefetch ranges
Thread-Topic: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
 prefetch ranges
Thread-Index: AQHbxRLty2akIl9SC0yx7anb39zirrPSqT3A
Date: Wed, 14 May 2025 21:47:06 +0000
Message-ID: <CH0PR11MB5444AF4A3E73E716071F9C92E591A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250514205801.40253-1-sai.gowtham.ch@intel.com>
 <20250514205801.40253-4-sai.gowtham.ch@intel.com>
In-Reply-To: <20250514205801.40253-4-sai.gowtham.ch@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB7592:EE_
x-ms-office365-filtering-correlation-id: eeb11c66-6a16-4bc9-8cc9-08dd9330dec4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Pu4affzWz5V7tbN8Y7xhptdYEW/7WtVrDTYbchtR04aHz/i6fgY83P36jxGF?=
 =?us-ascii?Q?q76qIvA0PPzVSMYG0Tyv5XNZSwE5hrW7xqy+cRbDzxzfm3oGcQdyRN42u57B?=
 =?us-ascii?Q?GgxlccwuBWuey8eVpMrkVGwkaUMZ/BtPxxx+vjyoXXWHZtJE/FjDgznJvTOY?=
 =?us-ascii?Q?ElfoR/0q+bozZjUaITwDAX2NYIakNlAih+Iu2A/tljBNrC5FQo+GPmYQ0uew?=
 =?us-ascii?Q?cUIvHQah1iB0qtpQ/WLPlsk05eUnNICvNbHuH++aYBWEctMhAkARp+g6W/Wr?=
 =?us-ascii?Q?uWRRHJxN6q0/AErMxR/pVQnZOWIlLThUmWAVylHHQrPS3KgqQ7D+V/XQ1nb1?=
 =?us-ascii?Q?/7Z00K2j9LIwVzco+MJycyK+THrXXq+I5p4IAV30sZVdqdqGQb6b/KhPMivW?=
 =?us-ascii?Q?2tBffaD/miegvLUGwwWT+HHx9kBpL4QsgwuaECd5t0+i8eIyGkh5Xs1dq2w9?=
 =?us-ascii?Q?YRiRCcz/dtXcUFoD9BYYCUhHeaoUMFaMt/q5Ssh7grG98biuyqVBSnfDi70X?=
 =?us-ascii?Q?u+875VqzFdglJlxEOGYukmxfFUOvKC1+9tNOfiOa8cArKY8RN36dUzKlvhqX?=
 =?us-ascii?Q?r6uXQ+HKRwxK5jGQmz4hTtiCAX23x85kzJBP+DzBrlaUvIcfFVMr7v1306AY?=
 =?us-ascii?Q?zw5JMaITV4sE/VQPdiihS5N5hIOcv5vUt+6h3g2zSDNopD4+yUJmU6iPllD2?=
 =?us-ascii?Q?/DEeki0nyPqdBm0mRsiNDFABkYE8TctZdsyXbigLLojnrzEZDdO2U63fXdlL?=
 =?us-ascii?Q?lTomnftrkkil1dqP+Qa5VIquZJC05Sek1Bs43QpbTaFIMDaECV73PXIw82Sb?=
 =?us-ascii?Q?mTp+Ld1bHXG5oSN1gQlhz0h6sctY3uP1PBgbP4v2YVPUb7aNEpjqu09IBFAN?=
 =?us-ascii?Q?WGQFsD3lJVv52/cZBLZ5v6lcSCikYp2fx/IN1RR7aYVQkX5ZwqzImAg36L5U?=
 =?us-ascii?Q?ykw1nuSiKuqNrVul1x1PU43QdOloLoyFgHYlvQro4FCNFpZmpW71PRkRjsco?=
 =?us-ascii?Q?UmA2ZXCPWRIwLF0RrRlb5jJ+Je3Hta0XFRkw/bMKLw6+bqL6DL15K0vhF+oz?=
 =?us-ascii?Q?ki7TteR5DwXslwSFFDZWs7GuDPrUHBhH2vKNsd3tBk2uD6yS6pAbxC0i9buW?=
 =?us-ascii?Q?TL4yspzfLBa2hLOyriLzJHwIc9rkbLt2rllVT8pUb0zL68wkGFPsNjvZW9sG?=
 =?us-ascii?Q?/rklPNLCfGdFCfj3U5mmjVCQeEbKFQjXqHYMqJ3WIcf7mBlhs4IYkjq5Hl++?=
 =?us-ascii?Q?6k/BvhsXsVlPbNZBlsp3K3FIdr34wyCcZmojPRCrpm9lJGC4Q0e48q+RJj3e?=
 =?us-ascii?Q?tV6kbL/+G7Xpo6x6lda+9yL3mggvo5x0XHvq0q2v2shDq+a8xCJg7Prk+vhb?=
 =?us-ascii?Q?h8QUKyc42ru1adS8E4LECvvB5rojbYTgDs4R566bgUSTGgeF9m0dA9y65yav?=
 =?us-ascii?Q?+IZkTzLwBwRbq1XxWGifjdJ6aPaidb5PYe/MQyrf0IanbTymlq/RTA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4Z+DttLbRt8/cAQIHYB1yM2QhFJZRbfOh4TfGjTIeOhYk3nHUGyGZDdFlPws?=
 =?us-ascii?Q?9gTlmujgUq7qME2pH8ipRf7JG0BhjKC+SfjkkNr/PYr9GwfU1XNIG4yFqryW?=
 =?us-ascii?Q?UyWbIpj0E45QkdGm9i/T9JvZ+Zz1Yu2NwZEW4zIf3oFBT1KwUGp0LQLeikeQ?=
 =?us-ascii?Q?6VL1gR1sVmvPJIzwo2bHwlH/RwABaLctTrbWCnckWON7t/GWVsiI9n+c6sZI?=
 =?us-ascii?Q?+cLOjvFCEcxTbm27ciO3/hOKY65uw0N9DF5Pp7Zp26AQxnomGqtTvOie1lYy?=
 =?us-ascii?Q?ldGkPtEpcfmzTRwzoXEkRM/hqwwI4kQMbglrY4YqzKTGF3Lwc5PakqsHN6Wt?=
 =?us-ascii?Q?zRoI1AofDCdqnn+klbdVbk3fMMBkwHOeYGlxnMsRa/u/souZePOg6iK98bco?=
 =?us-ascii?Q?RlaaANR+B5LuF/eCzNGNs/JRXfJxRVNnk4QItdWCkZhnJfAjZnDaDfNEhJR+?=
 =?us-ascii?Q?NtDKvQjdMDt+EOIgGmWt0FtO2eabws/eOBzba78tm9OtxtWXsum6VS0RhLeD?=
 =?us-ascii?Q?g4eQNLqmOmgFNTeG5PECHp10Qa0ndlXdANEyZ4A0T9ldk6hVjDEyz/3kKtyH?=
 =?us-ascii?Q?WI/NBC5Inu3ahaDxaO8nWzKtnzSW/AIMfTZdfxzzRVKczBeItfRKKctikyNO?=
 =?us-ascii?Q?2E5nyyGvFd7LaZzCGfeX8igEr9tb01a9ZVs2ZAuDT/3+TH6UxvQplM/vUXma?=
 =?us-ascii?Q?wWo31aosWeYX8pAd6vP5XD/7VYmo8vSOaiGmuM5dVNGyalk+4uFKgLKFdj6O?=
 =?us-ascii?Q?OZN4g0Ubq/C8cdux18BraPo/0w2dGYWbvtaac63GRaI+OchOcaSCsxlI5TuZ?=
 =?us-ascii?Q?2HbVUy/QdHtzLicq+rTzuPfugaPO7L5aQ7ELcf2FhCuBsyIj4j3PoBh/4JLg?=
 =?us-ascii?Q?JP3u+dgj9suZD1At8TffdYZFTUW8LA8fYw59ja3G/Rp62QMXxYgACFlNfKl1?=
 =?us-ascii?Q?pfnQ6vbhyz4LgkxX3Y4/1RBumNOo7d9JObE4mIPJNk9BNC3dCHQkQFQRFX5P?=
 =?us-ascii?Q?Qs9pr/J4DFoKtkjB6q3AAijv6ih/Y/YSZBdAuwC9adk06kjJVNk9/EQEh/gb?=
 =?us-ascii?Q?kowr33XfwKVR5h7xBP0ctSahV87EC8opwtnmhQTmRujcAHLZaMOTaXCleNxE?=
 =?us-ascii?Q?9ZXENQ/LOPlPcLmVWi46dyL4D7doksEWJpfLRvNqmnklfafVn+ncWNNIIzQ7?=
 =?us-ascii?Q?dkZTNmG29dyr4xThZzWiVnP/BPO++OdkWkFro12PJUrSuCJa03fo7kSUSGjx?=
 =?us-ascii?Q?7gVRt5ssYAjaCJ2XgkYt06T2mKiNGZbJsJym1tCrQM6fW2HOhpbf0z41JtCJ?=
 =?us-ascii?Q?CIENcEv7XN2fg1ZCrDeS23ZEw8RYXIe6eYYBmOaAvNwgPBty4/wTCBm/k+dV?=
 =?us-ascii?Q?yd/F/z9G7LX4grLauPcZz6Gw/Ax6neyIzSlc1C1RiWziuoYEFyakKVedtrP1?=
 =?us-ascii?Q?xjZtKGFATMkuqqvLElhhk4XLhZ4VYdT2XhKHqrVkU+6PQKioIM7EpCNCh6vF?=
 =?us-ascii?Q?dh0gkkDLqgyNIxIaI4cJ9R3SIhI5zrWDUwFbR3KVUrbZGu9ZOzxk3WqhV2C2?=
 =?us-ascii?Q?LSgwzn3m2NfPVEdqX0rYnQmbWk3HmxPVgrIg85kh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb11c66-6a16-4bc9-8cc9-08dd9330dec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 21:47:06.1413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6aaPRpeNeOh41Ydp6fYmEIpO63REeoDA/mzwy0szFhzKsG4JyHJ4QNhCD7Y0JTI+DxZsW7+cFYZjfEiG64kovpAcf8q2vlkyUsIHeRdxGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7592
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
Subject: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the prefe=
tch ranges
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Test rebinds the prefetch ranges to check the ideal behaviour of prefetch=
 mechanism,
> expecting address ranges in the corresponding mem regions has to be creat=
ed again and
> use those address ranges to submit workloads.
>=20
> v2: Enhance VRAM/SMEM/BIND flags in the selection loop of this test. (Jon=
athan Cavitt)
>=20
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

No additional notes:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_exec_system_allocator.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec=
_system_allocator.c
> index d4f2e8d98..227c60d76 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -141,6 +141,7 @@ static void signal_pdata(struct process_data *pdata)
>  #define CPU_FAULT_PROCESS	(0x1 << 3)
>  #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
>  #define VRAM			(0x1 << 5)
> +#define BIND			(0x1 << 6)
> =20
>  static void process_check(void *ptr, uint64_t alloc_size, uint64_t strid=
e,
>  			  unsigned int flags)
> @@ -484,6 +485,12 @@ static void test_basic(int fd, struct drm_xe_engine_=
class_instance *eci,
>   * @vram-SZ_4K: with size of SZ_4K on vram region
>   * @vram-SZ_64K: with size of SZ_64K on vram region
>   * @vram-SZ_2M: with size of SZ_2M on vram region
> + * @bind-smem-SZ_4K: with size of SZ_4K on vram and rebinding of smem re=
gion
> + * @bind-smem-SZ_64K: with size of SZ_64K on vram and rebinding of smem =
region
> + * @bind-smem-SZ_2M: with size of SZ_2M on vram and rebinding of smem re=
gion
> + * @bind-vram-SZ_4K: with size of SZ_4K on smem and rebinding of vram re=
gion
> + * @bind-vram-SZ_64K: with size of SZ_64K on smem and rebinding of vram =
region
> + * @bind-vram-SZ_2M: with size of SZ_2M on smem and rebinding of vram re=
gion
>   */
>  #define MAX_BATCH_DWORDS 16
>  static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
> @@ -538,6 +545,13 @@ static void prefetch(int fd, struct drm_xe_engine_cl=
ass_instance *eci,
>  	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM=
 ? 1 : 0);
>  	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
>  	exec.exec_queue_id =3D exec_queues;
> +	if (flags & BIND) {
> +		exec_ufence[0] =3D 0;
> +		sync[0].addr =3D to_user_pointer(exec_ufence);
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRA=
M ? 0 : 1);
> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +		exec_ufence[0] =3D 0;
> +	}
> =20
>  	for (int i =3D 0; i < num_dwords; i++) {
>  		result_ptr =3D (uint32_t *)((uint8_t *)data + i * slice_size + 0x100);
> @@ -1765,6 +1779,13 @@ igt_main
>  		{ "vram-SZ_4K", VRAM, SZ_4K},
>  		{ "vram-SZ_64K", VRAM, SZ_64K},
>  		{ "vram-SZ_2M", VRAM, SZ_2M},
> +		{ "bind-smem-SZ_4K", VRAM | BIND, SZ_4K},
> +		{ "bind-smem-SZ_64K", VRAM | BIND, SZ_64K},
> +		{ "bind-smem-SZ_2M", VRAM | BIND, SZ_2M},
> +		{ "bind-vram-SZ_4K", BIND, SZ_4K},
> +		{ "bind-vram-SZ_64K", BIND, SZ_64K},
> +		{ "bind-vram-SZ_2M", BIND, SZ_2M},
> +		{ NULL },
>  		{},
>  	}, *m;
> =20
> --=20
> 2.34.1
>=20
>=20

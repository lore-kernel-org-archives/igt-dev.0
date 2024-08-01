Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335AFC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19BE10E92B;
	Thu,  1 Aug 2024 12:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9XRPi3q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC3A10E92B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722513689; x=1754049689;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y/miIGAqlTpC2oy5lBKUWYlT5x375woOiEQsnugCeoY=;
 b=P9XRPi3qxuewcj7kFM8gvJjX8rqWFAvAyJWZ7O2qRvSQ22wx8RIyOAi2
 O0lbnVWlwm6RxGJWkCn2p98yi/I9hgHYJWW2Ls7ETeF36dWXcaeNaReJe
 0pEY0erGhYR+L/M06A7bibaEeDfyoyvmQxmEQDLgngS4wjzGBV+pZEChm
 vACTGswfX3SBksWOgOBRCX+bbdK28ixdnm+dIbbKzJz1mFrYOzVMSuMg7
 092hih8VGyknS76Vemp5KDxHWEsL5e2ekvVM005munqhBmQvgyTDqMn9i
 yQOmXInzec9CzV5njjjA+ndDtFAnV6rQ/umOC9+MvLzycWWXqEFLMnurz A==;
X-CSE-ConnectionGUID: ApTkFjAiTZi8GFUldbU+Yg==
X-CSE-MsgGUID: ZFvEdI0HQkazcf5+NvqGUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20403251"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20403251"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:01:23 -0700
X-CSE-ConnectionGUID: yaWItfBMRUC2lIOI+/3t1g==
X-CSE-MsgGUID: hJDm0F6mSGyHNRRKZ7x4jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59662555"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:01:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:01:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:01:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:01:21 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:01:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvzIVzc1qjljOCuK2YeN6IYlRJzSItdemwdJHr2hexUzN6vQbPHtU9PtUR74+h8NE4lAhqz9OiMsjCYdVofOv6B574FXxKV9D0BMK4olip6dxVSjRwG+xxbLZxZG6zo/KgqDAYjcpV2f3YbC4zAX6WSsdHl6mCoTu2jvTKPQXFjgP1MwbIlp/j3WMGEhOqWUb3cT6At+0duJIuXw3leXRimT3VXQoSTu0Bb+hE/xpEZ4i87eel5QzWzHzUGSX0R13/V8agijj/p3njBpoTvvbfw6MhrgGdz1b7opW3zg+ax0EdSpPmftRi2YSOYNDWBAq3w9I3DvvD6VACNQa+CG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgPUVSzbTURD6WDAhK8zGCdtIuBXUfkXFedjbSOM7iM=;
 b=JSP+gDe3B9RDS1UGXdX6wXFR8HSRo3xaRrOFTKUOtP2rOmUUOcytH9cVoLJ9GHZyjyB+XZoXjE0fued+X56Ikanu+xRM4KyFfiU5ily2/Batf6zOpt7u6bMnEGxN2XdOTW+24zOhroZRxJSWX7k5yL01eLg8reWllcGp1J/hDdi1p90klZwI63UkCaW9vs+Z5yDKlHu4vAI0T49ZfdsRFiS6vgIihkvXRwr96PnkhH3WZJOY6Bu3SiJbb1I6AJKMEpPKqRElN/tYV5+/89nMMwUzeURH3opQw1xt8LCGziWXotCyKnDqYIBLYpIaRBXXbQmt7SyFLX1YufdHjWzeKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.23; Thu, 1 Aug 2024 12:01:19 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:01:19 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 13/66] tests/xe_eudebug: Exercise read_event ioctl
Thread-Topic: [PATCH i-g-t v2 13/66] tests/xe_eudebug: Exercise read_event
 ioctl
Thread-Index: AQHa4nZCsxA63bRWp02LcWzEo1b2i7ISUAlA
Date: Thu, 1 Aug 2024 12:01:19 +0000
Message-ID: <DS0PR11MB726454E2B416840CFD69A15ED9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-14-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-14-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SN7PR11MB6922:EE_
x-ms-office365-filtering-correlation-id: 549bddf3-13b0-4fb0-9457-08dcb221a760
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?aMlKzkI4b3UU3QigD/+jM7gfW7gd1bOzZibOPzD/iJ7Y40/FGaAVbKSQRW?=
 =?iso-8859-2?Q?+8iAeSZrhmYkncyGHrMlnEZModZqKJ+18/V0+OwCU0szJ61ue7C9hTJJdK?=
 =?iso-8859-2?Q?ytMYqPcX/DX1DQT563J5kshsZsqZlQUo33KQe6EcTTtVZ6eJ5c7l+xrxgQ?=
 =?iso-8859-2?Q?P8wcnl+j/CX4W6vB9NLKQbUC2EaT8iipmA/uqUr3Ifpay0FWs0wOPa3trd?=
 =?iso-8859-2?Q?ayvtJ+KVgg+ViyKxsDsUXL3FR+RA0FJku5bYBnGeiaNega9g41PBVcDNG7?=
 =?iso-8859-2?Q?T6pFUVjtetIckXve7W4GmfBEemVfFxdEpWOMXpX6NWxIEFiOIujhew8ZQH?=
 =?iso-8859-2?Q?s2VNu4a9+80k4uylaM2sLDjQFW9K9ov/9NCRkrpbeoXoBa6PbYo6sBC6Mq?=
 =?iso-8859-2?Q?RW/t4/g3YAmq5Ml7Jb1nff2F5WAGH34XSjhff5dS2rtKedhUwPOI+gK5Ew?=
 =?iso-8859-2?Q?C/pC5cY0r4U/oihe54sv/FoXV7AB7UXVZyPSK53MTzBYyJOU9BxfqxzGz7?=
 =?iso-8859-2?Q?e7A1UjN/+f1kSJ3u/hAAP8jb40QYNkyQFVMtt0BMDX9/1Z5R7SInXwSCdK?=
 =?iso-8859-2?Q?R71GZVMusDnIXUKr2SUAMYutUdUlkJJE6KU4n6fbZEHi9SHaVG3HqFSa1/?=
 =?iso-8859-2?Q?B4ZxjRUeXxIUBBYKWNgbBPKjhTH9BWQPnWEPyX2V7CYy7yvnAaULr0OfT4?=
 =?iso-8859-2?Q?FzUqrmQsBjqN5llAFI31Sy9AnoWWGLN5d4tWc9YRP+t/vvWBz42z6/8MQk?=
 =?iso-8859-2?Q?a8+EqVpQ649YgonQ0p/Ndra2GVX5eCKq+6doLoJZhctQg27Jsqjq48R3m1?=
 =?iso-8859-2?Q?NksTRuY7XrPjrzS9/PgtAsCbMqEGfW/Sj+3fOOX5I3Vkjg/CLxWXCZj9vq?=
 =?iso-8859-2?Q?wbaP7DHX5+36254lDpw5qWuR0fNZW3kp7F6rVT893d1qbLHX8AgW2UDhga?=
 =?iso-8859-2?Q?VQm/Dw5NHDddNuVi6KrJpGkLfQUKRZ3HSgor9GKxlZBG9p6IooWpXj/Ns1?=
 =?iso-8859-2?Q?CwS1YWoWtiyegfNKJyDjuRZGYxmfEDfEvozwXR967hZYPbTNVGfUWDmCsf?=
 =?iso-8859-2?Q?8kkE9f4EjMtfpuSSeMqpXSpjO8HJ+kF6ubeXXezt6m0zvqM4nzI2/u9RdV?=
 =?iso-8859-2?Q?PiMPUA2h61JLsTLg3UMkxBywFQU+ed6GKnBPOZGKiVz4A8zEAWmKmEzFE/?=
 =?iso-8859-2?Q?gjOKsoNR691he4BVv84jhBZkx/+nMGNQnAGkkUCPw1lzs86uIJ8UymA1y9?=
 =?iso-8859-2?Q?pto9nvYIcr1Oei3uwpCwQi2qpFYYIXDwYaz6YFqvWay81g9REVd2MtY3HH?=
 =?iso-8859-2?Q?uvalzWGhd4PlhH91Xudccbcz0sp2N+EQa03MalCaygr8rBQ5N76MPVSHwF?=
 =?iso-8859-2?Q?FV2JGCOHoJK4pPFXpUB1z50vi48vyNC+BUMbkpLMSuvM1AfgrOJO1tMLGE?=
 =?iso-8859-2?Q?Cn2iRj4B5UhWUnOBnNARdmqwIPnAtxMtDouMMw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?HDWLSegNoNKLlr9/eK1ZTl9KenbtUfWamh0TcQGeQekaGmV2R3q14S53Su?=
 =?iso-8859-2?Q?oQrvg1FW/jZf0c2UL4CyL57DvBDwXU20XZmApCAnLXyWQbv8CobRX4dO5z?=
 =?iso-8859-2?Q?LFZKKa0TLIBFrMZVKtN1Clxy5TMFViu6Gx2utJZ3j30qkOpNCVU4Eftz06?=
 =?iso-8859-2?Q?I0ropTDoOfFbNB4V8EQ8ZMhIbTDc1JJBkYcFTwMuxQxtdUOPPJyFysIpV4?=
 =?iso-8859-2?Q?j3Dow/LY1kho+RvYEZj02CFduOMmEcJD6hF7odea45nnbwpQ9nQhJWpbDn?=
 =?iso-8859-2?Q?qvlDa8A5X0iDE8iehcEvM3lmu8jc6X3g4DmjhhxZviwFdykDBjE8zc8Zze?=
 =?iso-8859-2?Q?PZKLK+g5Jlqe9sPuOAoz0IlGnj0HH3K/4m9tKI7KaPdQ3s+LgLMPhonS5J?=
 =?iso-8859-2?Q?xgBayPej2jYtlR88PaksqipuwqrTeKk03FT/IHlc49XQJvFp7s8yJCMoru?=
 =?iso-8859-2?Q?LFvMxvr+CSTPIpZLMRinweI3V2YLmIFUe9gZgCKcbK0GMCkrefP1SBjRl/?=
 =?iso-8859-2?Q?Wj7zf5SY9DXqyBIyV7GpxdNhL+F5VtZ1kZ2RYFfsEkVqf0lOeD7vp9bVS8?=
 =?iso-8859-2?Q?orvhdccI3i365fXb0IGPNRg2r9aWJ1q97QsLRu7KQBNiNDJ4PxSW78E9Ax?=
 =?iso-8859-2?Q?K13BMDaSZJVkF8+pvFEUoKQ5E2omcSXRtfhH6cpO8/++AVT1F11RkzSuFo?=
 =?iso-8859-2?Q?TTDS2LcLGyR1wlJpQzQYMzWqxq0jxWNDrXgHFJ7N7G3j7tnPIn3SJzRXEM?=
 =?iso-8859-2?Q?DXpMFXosT23QnfKStb7Jmjv95kBx7+k81MN4TnHIpDJHEyZWipflUd/SNw?=
 =?iso-8859-2?Q?isM4X5lGPcNGDpI1anMD8x/cG9ffwR+mSGkjwYcyz6Ndoz0mmnk9RMCYr5?=
 =?iso-8859-2?Q?p6Rp+eTTj9ohAh2oh0yUDzq94Z+LVb6UGWBCt0np3jISoBvrgPsT8QiaXD?=
 =?iso-8859-2?Q?L7FyNHtnUqCODRK4Nb/h0SMn3zT+ldyQs/uDmfFpVxpWEADsFcew9d8chG?=
 =?iso-8859-2?Q?0PMPUykiRndTUSLFcyAKxbX9jOGPmIbnp/hewmZhCTrg+QQL6YTuhPc9kD?=
 =?iso-8859-2?Q?WHV6Rqk2BXbHoUtHIZyyk/oa/U76bBMprlnxlYsLgPUIpfAZykT0OvXqj3?=
 =?iso-8859-2?Q?A/cc+TdgD2xMmQhcvWwQMV0zE3AD4/D31Ko07zbCNb9KMfbbNSxTLWbNxT?=
 =?iso-8859-2?Q?1AAo53FOYSoJnj/n/vZiURalvdpqCM/VjCBY/93XDKFLRVB5BHHz11xV6o?=
 =?iso-8859-2?Q?+0TXL2CE/cnnqNckY40BeV0vVmLpNCKEun3/h12mORRg5QVGyjzlZnp/Qh?=
 =?iso-8859-2?Q?pBckOqN2Z5Pdkau7BPWrP6C3l4x182/+U6I7/W6OpPWAdVAjMk7wFadDq4?=
 =?iso-8859-2?Q?pcLSAPKRxi1T2PxPCUWjxm4IQD6UO9bKY0dQdU+X4iKrrlNj6181ZU7RTm?=
 =?iso-8859-2?Q?RNuSh1nc4ZpN4DZZrm15/P8gSAadfeE+q4ZpxHeWvY2rVUpb0Wai1ZvVvO?=
 =?iso-8859-2?Q?Vlqu59YUmlcBic01B5P4bHX7DU7V8RUBvB2Lxxq0R/dQc3AH764t1mPpzF?=
 =?iso-8859-2?Q?vAqWE3IzBbA/NQKJ/D0FNCr6mYj7e/JBv003e4ogxXjXAv1NTCxdhrrGGZ?=
 =?iso-8859-2?Q?dkMLx96V7IuDYiFcgXIhmmi5H+rPhiSVKnSD8rQkhsbaNq93UZzxPTZB+L?=
 =?iso-8859-2?Q?0ECY5XfvRph7ToQMevk=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549bddf3-13b0-4fb0-9457-08dcb221a760
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:01:19.1180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNcfpyoRvcVJV9PMM0KoHdE8X/4LcTVH9nNylsI0b7PRyvlC7GBTHBmefMZWAyTE9mb6g8CId1xwE9Pff9mFKS0k8l7r4OShoI5gzKWV4caV3ESkaXvMYoYeb9d7wW0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 13/66] tests/xe_eudebug: Exercise read_event ioc=
tl
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Introduce synchronous test, which validates eu debugger read_event ioctl.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 109
> ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 108 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> 7ca0138a2..0cef652e2 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -12,6 +12,9 @@
>   * Test category: functionality test
>   */
>=20
> +#include <poll.h>
> +#include <sys/ioctl.h>
> +
>  #include "igt.h"
>  #include "xe/xe_eudebug.h"
>=20
> @@ -23,6 +26,45 @@ static void run_basic_client(struct xe_eudebug_client
> *c)
>  	xe_eudebug_client_close_driver(c, fd);  }
>=20
> +static int read_event(int debugfd, struct drm_xe_eudebug_event *event)
> +{
> +	int ret;
> +
> +	ret =3D igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_READ_EVENT,
> event);
> +	if (ret < 0)
> +		return -errno;
> +
> +	return ret;
> +}
> +
> +static int __read_event(int debugfd, struct drm_xe_eudebug_event
> +*event) {
> +	int ret;
> +
> +	ret =3D ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_READ_EVENT, event);
> +	if (ret < 0)
> +		return -errno;
> +
> +	return ret;
> +}
> +
> +static int poll_event(int fd, int timeout_ms) {
> +	int ret;
> +
> +	struct pollfd p =3D {
> +		.fd =3D fd,
> +		.events =3D POLLIN,
> +		.revents =3D 0,
> +	};
> +
> +	ret =3D poll(&p, 1, timeout_ms);
> +	if (ret =3D=3D -1)
> +		return -errno;
> +
> +	return ret =3D=3D 1 && (p.revents & POLLIN); }
> +
>  static int __debug_connect(int fd, int *debugfd, struct
> drm_xe_eudebug_connect *param)  {
>  	int ret =3D 0;
> @@ -124,6 +166,69 @@ static void test_close(int fd)
>  	close(debug_fd1);
>  }
>=20
> +/**
> + * SUBTEST: basic-read-event
> + * Description:
> + *	Synchronously exercise eu debugger event polling and reading.
> + */
> +#define MAX_EVENT_SIZE (32 * 1024)
> +static void test_read_event(int fd)
> +{
> +	struct drm_xe_eudebug_event *event;
> +	struct xe_eudebug_debugger *d;
> +	struct xe_eudebug_client *c;
> +
> +	event =3D malloc(MAX_EVENT_SIZE);
> +	igt_assert(event);
> +	memset(event, 0, sizeof(*event));
> +
> +	c =3D xe_eudebug_client_create(fd, run_basic_client, 0, NULL);
> +	d =3D xe_eudebug_debugger_create(fd, 0, NULL);
> +
> +	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
> +	igt_assert_eq(poll_event(d->fd, 500), 0);
> +
> +	event->len =3D 1;
> +	event->type =3D DRM_XE_EUDEBUG_EVENT_NONE;
> +	igt_assert_eq(read_event(d->fd, event), -EINVAL);
> +
> +	event->len =3D MAX_EVENT_SIZE;
> +	event->type =3D DRM_XE_EUDEBUG_EVENT_NONE;
> +	igt_assert_eq(read_event(d->fd, event), -EINVAL);
> +
> +	xe_eudebug_client_start(c);
> +
> +	igt_assert_eq(poll_event(d->fd, 500), 1);
> +	event->type =3D DRM_XE_EUDEBUG_EVENT_READ;
> +	igt_assert_eq(read_event(d->fd, event), 0);
> +
> +	igt_assert_eq(poll_event(d->fd, 500), 1);
> +	event->len =3D MAX_EVENT_SIZE;
> +	event->flags =3D 0;
> +	event->type =3D DRM_XE_EUDEBUG_EVENT_READ;
> +	igt_assert_eq(read_event(d->fd, event), 0);
> +
> +	fcntl(d->fd, F_SETFL, fcntl(d->fd, F_GETFL) | O_NONBLOCK);
> +	igt_assert(fcntl(d->fd, F_GETFL) & O_NONBLOCK);
> +
> +	igt_assert_eq(poll_event(d->fd, 500), 0);
> +	event->len =3D MAX_EVENT_SIZE;
> +	event->flags =3D 0;
> +	event->type =3D DRM_XE_EUDEBUG_EVENT_READ;
> +	igt_assert_eq(__read_event(d->fd, event), -EAGAIN);
> +
> +	xe_eudebug_client_wait_done(c);
> +	xe_eudebug_client_stop(c);
> +
> +	igt_assert_eq(poll_event(d->fd, 500), 0);
> +	igt_assert_eq(__read_event(d->fd, event), -EAGAIN);
> +
> +	xe_eudebug_debugger_destroy(d);
> +	xe_eudebug_client_destroy(c);
> +
> +	free(event);
> +}
> +
>  /**
>   * SUBTEST: basic-client
>   * Description:
> @@ -134,7 +239,6 @@ static void test_close(int fd)
>   *	Simultaneously attach many debuggers to many processes.
>   *	Each process opens and closes xe drm client.
>   */
> -
>  static void test_basic_sessions(int fd, unsigned int flags, int count)  =
{
>  	struct xe_eudebug_session **s;
> @@ -171,6 +275,9 @@ igt_main
>  	igt_subtest("basic-close")
>  		test_close(fd);
>=20
> +	igt_subtest("basic-read-event")
> +		test_read_event(fd);
> +
>  	igt_subtest("basic-client")
>  		test_basic_sessions(fd, 0, 1);
>=20
> --
> 2.34.1


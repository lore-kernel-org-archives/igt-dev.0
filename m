Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F205C369B8
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 08:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E7E10E680;
	Tue, 15 Apr 2025 08:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSJDt/yH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BE110E680
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 08:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744704638; x=1776240638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GBNvgZIV2nlRMIy6Pjt/fVyuy9DjXqQfI3/DopWX0GY=;
 b=PSJDt/yHvHzdxQP+ItY/0W19IZZmL80EjEtPzRQh6DgGtCpLKPKSHc03
 YYhuBTm+HSX74R/PhvPgtnUxNv0/CT4EJxKCKLms6h5NtAQpcesNtnyib
 EAFVNWQT8jpUSfeRRbuEtd3Twr84r2EVh0JiXgFIVgdUQybbYXS6eBliE
 D3cohkTs1U6bmSj2DLkhp4onApQqKWY2XrmgYERTj2mX8RtvEBHZhx9n6
 Qi2W1W4pvWPd1E9KT+WJLrSYDB2ZfFMYfxWc9ZdAJ+MCNn/+n8aZSmz01
 PAxOOQp6fplTbciHXkcJvfiUvUT0KkbZQEuY5E5ymph7JkqOp6LXT4Bzm g==;
X-CSE-ConnectionGUID: D9+9LJJOQY+CFv9+hoLokg==
X-CSE-MsgGUID: 3o65Y+kzTYCFUtBU0Z2PgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50001997"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="50001997"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:10:37 -0700
X-CSE-ConnectionGUID: pP9/k139RSSk0ARKUPldMQ==
X-CSE-MsgGUID: 6zk3wuMmSwCsjpggnNwB+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134148598"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:10:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 01:10:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 01:10:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 01:10:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7CwRtIYmzH1PmYtW/4G+OEy9GcRMXegjSA+GLNqU0gVQCt5HJxiSrHU3LS9XyxvNX43sD25+PumtCellVf7m4O5tK8zqGG6jO4puvhiDJalHuYognUmENS595IyfbZupUAGIFNo0KrtaYGpF+KU2B+bQ1fg5ZrlIHoOtr5HWgDFjjoCIFJ4xfpZivggyTD7IeNRj9/abOa38t9JI16OeghsX4Paf7qEJUD+hvIshmWwznuoN7IRtRCYgZhc7W7KxB6aHLxcQjawwe3i3J2MzFkIK92dAwkkLq53aG9indlDGQ5S7bdSxzrySwdZzJarUIojr4/Y5XsHfVTslbQcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+d968HWtx+lkA8DOmBAxW2seKZprqYCKSJLkR0IsSQ=;
 b=P/WlNSZqnyieOoG0lkScRFmZCEtRVno3xGASd8hmPMmCdWMch5WB/PtQe/y3t9533A3OHfv0GcKYGugX7FfNTEfVn2kicfrt2D7/SZVlot8lqKKddMEZg0OkIiVJso0OC7Tcw5dlQFgMNz+y67Wb5ELQgXZKeYlIK8+eRYBaRL0/Aq8IkP9lOMNjYP4g4RUzAFZ0vSB8CL2TFlcjY7Id0yNPRhZQGFaL93A4mcuB6Rf8eqS8jbrsGfCPgBty20m+wn+nBEd3GqEW7d4aw9ljQgPSCyhPzG2/Ghkgif3wvRa23XZ6pZbST24TNMesLddOOSzFBraVsCJY6ngrHSFVFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 08:10:28 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%7]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 08:10:27 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject
 errors in xe_guc_* calls
Thread-Topic: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject
 errors in xe_guc_* calls
Thread-Index: AQHbrUizkAYbYIWZsEC8o9rD+WZXVbOjPkEAgAAA+oCAAAbQAIABGrwQ
Date: Tue, 15 Apr 2025 08:10:27 +0000
Message-ID: <LV3PR11MB86953902641AE6FC08394E1BF9B22@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250414143842.14981-1-satyanarayana.k.v.p@intel.com>
 <20250414143842.14981-3-satyanarayana.k.v.p@intel.com>
 <CH0PR11MB54442A3E0DB6AB16D3B4952FE5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
 <LV3PR11MB869518FEEBDC832D2A4544E1F9B32@LV3PR11MB8695.namprd11.prod.outlook.com>
 <CH0PR11MB5444CBC9570B5E7821886C00E5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5444CBC9570B5E7821886C00E5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CYYPR11MB8431:EE_
x-ms-office365-filtering-correlation-id: 1acaea37-1ba6-47c4-c458-08dd7bf4fb86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?TvX7pyjjgu9ZK0Fyhrg99cVaBQGdOKd27dvyVMujtkZIpMShtfovUCuqeP?=
 =?iso-8859-2?Q?+jQqK8etDR9IgOq9LwmB2iNwgMlVz+Ai1xnax2iXm5JmoIuLY4CTgbcvW9?=
 =?iso-8859-2?Q?ZAuMSaYrrVzQe2JT2xtv+3w0zPX/ikRoRTMhJllQnHmcjvJ22dGMAfLdn4?=
 =?iso-8859-2?Q?TwLd0/5X+4QBQN8wwEUfn5QxQNE/vtlcmRF5Q5cE1iC5vEWDImLqOhN5Wy?=
 =?iso-8859-2?Q?mdADnOsvFw3MmKv0py0c9/4gQ84iatWgjRtn0aCskFWExbQj+JD0h+5Bxv?=
 =?iso-8859-2?Q?z4Bpjt97eJIN2hGOUpQgXt2e3NwAm5STjqVWM6lHJxM/w11rfyZUdn2Jag?=
 =?iso-8859-2?Q?5b2J4r8PQR/m88uleo/qDIaYrOtFPApOEuko/8+Xs5hSNtyC0hrrhOJ0tr?=
 =?iso-8859-2?Q?BbY4phXQD2hV2HWL01kDbcMwr9UifGJ9st3AnpYMfTg8bqSYUOsveSXdHe?=
 =?iso-8859-2?Q?YslShXSCto87yOHah0NwysR6e4q2ZcR/mvSbgErcdkrqiLQ1Mcl3yp1UQ8?=
 =?iso-8859-2?Q?x4iYAMG7ogy0/i2J7fvEVkqWnUuZYkUaQlSZAJJRXTj1iWuC2fR/pEnP6r?=
 =?iso-8859-2?Q?nuvy42X8CDtyR5q7qzB3eFuJXbRRUpW58ZBqE3vt3jCAlmArFA19tZdKcm?=
 =?iso-8859-2?Q?mOc5IOST6fl++ctJZ+tLpxUcFGeOKkuWMaFGVkDawzFIBuod+Po2Ghf2Eq?=
 =?iso-8859-2?Q?9oMxTZMVCdY6FV42x+GJBsCFXQ8f1DxHJnnU6kE0HkQcRs/pEwwUww43kv?=
 =?iso-8859-2?Q?nFj/bew5upNgqXT7nhVMnsFLXF1HZescyKfhBpgKZd3lU110lNgeu8AWuZ?=
 =?iso-8859-2?Q?621XSND8Ztg7//nja4Y+vr+vDFX9c9LHd+yi/Y8gz1ktEOtS5XfrzgyEuN?=
 =?iso-8859-2?Q?hJ2HBwHGT5494suGVc3nHL64C+TKY9uyHRHqku2yiVxK/4EBtR5jpBYSPp?=
 =?iso-8859-2?Q?yxFjMiJk/GR5QmLS02SuDyKtGPbmHGUzjZtmvDF6HO3OjMd0BLpSKVnK1z?=
 =?iso-8859-2?Q?4v/lKlXyremTrPxUA1S7DrE31G70HkFr7flNrpLpzlZhi75x9DoSdq3cGM?=
 =?iso-8859-2?Q?xeJLiKZNnJ9x/18hebpnWCYp4rmt3BiJEvLnVZloDJrv0pMZ23BI2wIhch?=
 =?iso-8859-2?Q?wwebzVPqGyvSnx1JqjvKagY7jzZV7u1yWtV8F2rfbnHbiHgoGhiNledafI?=
 =?iso-8859-2?Q?Olo1EKbuZfiWz1Kvd44RwMrpS3HrYXeZll/aEhMFkBDpmhDPU4Iw5xV4Wh?=
 =?iso-8859-2?Q?BHcCVLBB+JJY0L2DVgNsR16tHZtI1xvDsw0q4OnXZR2N57YZNzIzOq+iSF?=
 =?iso-8859-2?Q?ibFSMkzQ56a6epywTI9P04LNIgGYBvTatw19xZfiDqxnf09vec/DnUak/8?=
 =?iso-8859-2?Q?kSbC44cQEuDVIdtpRjxHUjvd9iZy3wPbUwI/CNtfYV3tTAqkYISfewaGH2?=
 =?iso-8859-2?Q?BURcrXeFHxujU6hbe4Ei4S2/556kAvCIrkoM4YLs2hzzlWpy23J/Sy7TpW?=
 =?iso-8859-2?Q?Z/C9Rp0rFD9+qq7b/Q1eOQOgIywvtpRYW/0bKSPBErcpmk4SZmy8CRX0IJ?=
 =?iso-8859-2?Q?d55UGNM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?UTPt9jrnbp1WifGvAB3+cc/HI8n4HaS/RK8yF9ttJz6bfHTOsUsb2rDMIM?=
 =?iso-8859-2?Q?nxo5Te2Lw2tSush+4YTwzpHD869GpfIJOySsba8hUso2z35mZAp18TdvrH?=
 =?iso-8859-2?Q?aVphtDGkrcuEcaYe2QQjLai8S81y+Vw7CR6W352nhjj1d2AQCsZXTwlqqI?=
 =?iso-8859-2?Q?9Nl3p9tHxrc4fQjYDtV5LM9CTZshB0e4/Trjr8nsqw52jKfEQ/vhhONAKi?=
 =?iso-8859-2?Q?vr/xXdcIcrw7V/P2PlsbFpTaMUtTJjGuLHE78OiEo5JWBOQUV0icwi91Z/?=
 =?iso-8859-2?Q?9+M6myzPVi5sZxlO9E3yDgLOqBHsi6r0qCWxu+5BTkxmHFtsV6wsvz2KOz?=
 =?iso-8859-2?Q?TE3QpvEtrIpHD6YkUk1Tb+AqIAaEK/0PozJ4WAvjDTBHPi+AgE+RvewnXn?=
 =?iso-8859-2?Q?yh+dIM34m4TnsnLyVs/SBnDH2MIsExLT9FGgqzcfai/syrFgwr/Niu6P/n?=
 =?iso-8859-2?Q?ij3z6WC205Zq80TxlPIPoNrC0HhEWo/c5U1mP3EbGhdqHQd/wNWNclSArJ?=
 =?iso-8859-2?Q?yAZJ5sPNNhSPLc38XnHpEGhLVl/GikoR3Q/GLtkDzA+f9fKEqDMUU8heSd?=
 =?iso-8859-2?Q?Z95LENLadkxtGn8vtDpg1HZBGVwtQMKRR1eOLuHwwDXe+NB2RDrymNEoZl?=
 =?iso-8859-2?Q?TEmVOvEtqg3LLyBK2AWWvUv0UTIdTG5BxVYdOuvGPqk67N/eYhnpH5+cbu?=
 =?iso-8859-2?Q?Oe42PJ3IeeYY2OjEs9JOCSHRmBUdeamYdb8tfQY+h3zrw3BvVH09ll4ufs?=
 =?iso-8859-2?Q?UNgZ5QbwCZ1/qYpfRi7mCLcN6mJBTDurMPiBJISDebEVgcSg4y+Mk/M6cc?=
 =?iso-8859-2?Q?eEriN3nIJjovaZAJwd4v9gwT+A6aG2SoOFYHpzW1HmnzgkCUj0gO+GQzPl?=
 =?iso-8859-2?Q?7U1z4HBsXAGeGkg3UnBAKifpaQBdkNWlUKmZf4/AGEhe5etcG89sYExl5N?=
 =?iso-8859-2?Q?N6pryXoLsuqV6Fksu8a/dD2rIwE6IW9PL1uyfhxWH+qI6n9g0SDBxdlw4d?=
 =?iso-8859-2?Q?G7Ab+pIs8ObxN/cA31+Jm4RRdrVaC9hP4BW49A+TB0bFN67aQn4Agz2vlO?=
 =?iso-8859-2?Q?510nyuGnxZJ8eCy5b9wFD8UQ6hi04jRZb09JBA6hadMdvWttjWNQ9cXFwM?=
 =?iso-8859-2?Q?KRZv+wLoUJTF5Fq8SnR94wyb6mHSSVpwMe8pVi60ZpwACmzcj1+lPyWsC1?=
 =?iso-8859-2?Q?h/RZPfbUUjQFYT9nxr7el6MUxAJ1t5TCDdJzLTqlVbg1W7ONpgnX5J0jso?=
 =?iso-8859-2?Q?Jp8RN55gTTyQ1RrXpAWMI6FKHVM7CcpiZnBT3O4CrjgAqiBsXZsqHJYvN/?=
 =?iso-8859-2?Q?bl/7GWqks4TCR2MZ5mDT+daD4yUemr3q2vUYYOyO+g4DnrdaFzJ+v4b43U?=
 =?iso-8859-2?Q?kVhdlR5KnSjxHe9CBXZwJfmVYUDHQFkqfWyShD8EifcyHQlOfcEQg+kCVm?=
 =?iso-8859-2?Q?po3bTfY4BFWfWvuBvImVkrHNQTqYO5eUjA6Yk/3/4zH0LBOVlCdagAZGbv?=
 =?iso-8859-2?Q?wEcj0w48UYUs90htMw5ouN9gLUnRGlIlOKadEXRR/Hme9RbSrmgEFvuGPq?=
 =?iso-8859-2?Q?IP4YPzYXKjlFLYv4xpv/ff4Z3i8rCmSlIOktdUefdiIRmZRaeA4s1uHqcs?=
 =?iso-8859-2?Q?lIoLTHidbvj8zonrOdGGJlyUzx3LIOBDJshOZ028Dm0VwAneNMbz52fw?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acaea37-1ba6-47c4-c458-08dd7bf4fb86
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 08:10:27.8134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dv6C7ykTXTg1Kd/p1SdraMDSD07jelNDUPChn35I8Hjmxc3nsnGkziUSo9xoFUnmew9niFJ+MQ5YOZpXI7PuHL01G7+QAyaqOUjyE965jUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
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

Hi
> -----Original Message-----
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Monday, April 14, 2025 8:47 PM
> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; De
> Marchi, Lucas <lucas.demarchi@intel.com>; Cavitt, Jonathan
> <jonathan.cavitt@intel.com>
> Subject: RE: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject =
errors in
> xe_guc_* calls
>=20
> -----Original Message-----
> From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> Sent: Monday, April 14, 2025 7:59 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; De
> Marchi, Lucas <lucas.demarchi@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>
> Subject: RE: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject =
errors in
> xe_guc_* calls
> >
> > Hi
> > > -----Original Message-----
> > > From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > Sent: Monday, April 14, 2025 8:19 PM
> > > To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-
> > > dev@lists.freedesktop.org
> > > Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko,
> > > Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois
> > > <francois.dugast@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>=
;
> De
> > > Marchi, Lucas <lucas.demarchi@intel.com>; Cavitt, Jonathan
> > > <jonathan.cavitt@intel.com>
> > > Subject: RE: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inj=
ect errors
> in
> > > xe_guc_* calls
> > >
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > Satyanarayana K V P
> > > Sent: Monday, April 14, 2025 7:39 AM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko,
> > > Michal <Michal.Wajdeczko@intel.com>; Dugast, Francois
> > > <francois.dugast@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>=
;
> De
> > > Marchi, Lucas <lucas.demarchi@intel.com>
> > > Subject: [PATCH i-g-t v5 2/3] tests/intel/xe_fault_injection: Inject =
errors in
> > > xe_guc_* calls
> > > >
> > > > Use the kernel fault injection infrastructure to test error handlin=
g
> > > > of xe during driver probe when executing xe_guc_ct_send_recv() /
> > > > xe_guc_mmio_send_recv() so that more code paths are tested, such as
> > > > error handling and unwinding.
> > > >
> > > > All xe_init() kind of functions are called just once during driver =
probe,
> > > > so it is sufficient to fail first/all calls to them. Driver communi=
cates
> > > > with the GuC multiple times, and the real failure can happen at dif=
ferent
> > > > call, hence the need to inject failure in GuC communication functio=
ns,
> > > > like guc_mmio_send() or guc_ct_send(), but it can't be just first c=
all or
> > > > all calls, but we need to be able to select specific iteration to f=
ail.
> > > >
> > > > To address this problem, an optional input argument is introduced. =
If the
> > > > argument is not set, an error will be injected in every possible fu=
nction
> > > > call starting from first up to the max number of iteration defined =
by
> > > > INJECT_ITERATIONS, currently hardcoded as 100. If the input argumen=
t is
> > > > set, an error can be injected at specific function call.
> > > >
> > > > Error can be injected using:
> > > > igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
> > > > igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
> > > >
> > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > Cc: Micha=B3 Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > ---
> > > >  tests/intel/xe_fault_injection.c | 75
> > > +++++++++++++++++++++++++++++++-
> > > >  1 file changed, 74 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/tests/intel/xe_fault_injection.c
> b/tests/intel/xe_fault_injection.c
> > > > index 44c42e83a..adcab2e4d 100644
> > > > --- a/tests/intel/xe_fault_injection.c
> > > > +++ b/tests/intel/xe_fault_injection.c
> > > > @@ -26,7 +26,9 @@
> > > >  #define INJECT_ERRNO	-ENOMEM
> > > >  #define BO_ADDR		0x1a0000
> > > >  #define BO_SIZE		(1024*1024)
> > > > +#define INJECT_ITERATIONS	100
> > > >
> > > > +int32_t inject_iters_raw;
> > > >  struct fault_injection_params {
> > > >  	/* @probability: Likelihood of failure injection, in percent. */
> > > >  	uint32_t probability;
> > > > @@ -233,6 +235,38 @@ inject_fault_probe(int fd, char pci_slot[], co=
nst
> > > char function_name[])
> > > >  	injection_list_remove(function_name);
> > > >  }
> > > >
> > > > +/**
> > > > + * SUBTEST: probe-fail-guc-%s
> > > > + * Description: inject an error in the injectable function %arg[1]=
 then
> > > reprobe driver
> > > > + * Functionality: fault
> > > > + *
> > > > + * arg[1]:
> > > > + * @xe_guc_mmio_send_recv:     Inject an error when calling
> > > xe_guc_mmio_send_recv
> > > > + * @xe_guc_ct_send_recv:       Inject an error when calling
> > > xe_guc_ct_send_recv
> > > > + */
> > > > +static void probe_fail_guc(int fd, char pci_slot[], const char
> > > function_name[],
> > > > +               struct fault_injection_params *fault_params)
> > > > +{
> > > > +	int iter_start =3D 0, iter_end =3D 0, iter =3D 0;
> > > > +
> > > > +	igt_assert(fault_params);
> > > > +
> > > > +	/* inject_iters_raw will have zero if unset / set to <=3D0 or mal=
formed.
> > > > +	   When set to > 0 it will have iteration number and will run sin=
gle n-th
> > > > +	   iteration only.
> > > > +	*/
> > > > +	iter =3D inject_iters_raw;
> > > > +	iter_start =3D iter ? : 0;
> > > > +	iter_end =3D iter ? iter + 1 : INJECT_ITERATIONS;
> > > > +	igt_debug("Injecting error for %d - %d iterations\n", iter_start,
> > > iter_end);
> > > > +	for (int i =3D iter_start; i < iter_end; i++) {
> > > > +		fault_params->space =3D i;
> > >
> > > Is "space" the correct parameter to set here?  From a cursory glance,=
 I'd
> expect
> > > you'd want to set the "interval" parameter instead.
> > >
> > From the Linux kernel documentation,
> > Interval --> specifies the interval between failures
> > Space --> specifies an initial resource "budget", decremented by "size"=
 on
> each call to should_fail(,size). Failure injection is suppressed until "s=
pace"
> reaches zero.
> > We want to inject error at specific call and not with an interval. So, =
chosen
> space here.
>=20
> Okay.  With that full explanation, the use of space here makes more sense=
.
> However, I think the full explanation should
> be added to the fault_injection_params struct in patch 1:
> """
> 	/*
> 	 * @space: Specifies an initial resource "budget", decremented by
> "size" on each call
> 	 * to should_fail(,size).  Failure injection is suppressed until "space"
> reaches zero.
> 	 */
> 	uint32_t space;
> """
>=20
> Or perhaps just:
> """
> 	/* @space: Specifies how many times fault injection is suppressed
> before first injection */
> 	uint32_t space;
> """
>=20
Updated and sent a new series.
> > > > +		setup_injection_fault(fault_params);
> > > > +		inject_fault_probe(fd, pci_slot, function_name);
> > > > +		igt_kmod_unbind("xe", pci_slot);
> > > > +	}
> > > > +}
> > > > +
> > > >  /**
> > > >   * SUBTEST: exec-queue-create-fail-%s
> > > >   * Description: inject an error in function %arg[1] used in exec q=
ueue
> create
> > > IOCTL to make it fail
> > > > @@ -407,10 +441,36 @@ oa_add_config_fail(int fd, int sysfs, int dev=
id,
> > > const char function_name[])
> > > >  	igt_assert_eq(intel_xe_perf_ioctl(fd,
> > > DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
> > > >  }
> > > >
> > > > -igt_main
> > > > +static int opt_handler(int opt, int opt_index, void *data)
> > > > +{
> > > > +	int in_param;
> > > > +	switch (opt) {
> > > > +	case 'I':
> > > > +		/* Update to 0 if not exported / -ve value */
> > > > +		in_param =3D atoi(optarg);
> > >
> > > I'm assuming that the below igt_main_args is a wrapper that calls get=
opt,
> > > because otherwise
> > > I don't think optarg will be set here.
> > The opt_handler() is called as part of igt_main_args().
>=20
> I figured this was the case, but wanted to make sure.
> -Jonathan Cavitt
>=20
> > >
> > > > +		if (!in_param || in_param <=3D 0 || in_param >
> > > INJECT_ITERATIONS)
> > > > +			inject_iters_raw =3D 0;
> > > > +		else
> > > > +			inject_iters_raw =3D in_param;
> > > > +		break;
> > > > +	default:
> > > > +		return IGT_OPT_HANDLER_ERROR;
> > > > +	}
> > > > +
> > > > +	return IGT_OPT_HANDLER_SUCCESS;
> > > > +}
> > > > +
> > > > +const char *help_str =3D
> > > > +	"  -I\tIf set, an error will be injected at specific function cal=
l.\n\
> > > > +	If not set, an error will be injected in every possible function =
call\
> > > > +	starting from first up to 100."
> > > > +	;
> > >
> > > NIT:
> > > Semicolon after string should be placed in line with the quotation ma=
rk, not
> on
> > > a newline:
> > Some tests are using this approach (eg: xe_create.c). So, followed the =
same.
> Will update in next version.
> > > """
> > > const char *help_str =3D
> > > 	"  -I\tIf set, an error will be injected at specific function call.\=
n\
> > > 	If not set, an error will be injected in every possible function cal=
l\
> > > 	starting from first up to 100.";
> > > """
Updated and sent a new series.
> > > -Jonathan Cavitt
> > >
> > > > +
> > > > +igt_main_args("I:", NULL, help_str, opt_handler, NULL)
> > > >  {
> > > >  	int fd, sysfs;
> > > >  	struct drm_xe_engine_class_instance *hwe;
> > > > +	struct fault_injection_params fault_params;
> > > >  	static uint32_t devid;
> > > >  	char pci_slot[NAME_MAX];
> > > >  	const struct section {
> > > > @@ -469,6 +529,12 @@ igt_main
> > > >  		{ }
> > > >  	};
> > > >
> > > > +	const struct section guc_fail_functions[] =3D {
> > > > +		{ "xe_guc_mmio_send_recv" },
> > > > +		{ "xe_guc_ct_send_recv" },
> > > > +		{ }
> > > > +	};
> > > > +
> > > >  	igt_fixture {
> > > >  		igt_require(fail_function_injection_enabled());
> > > >  		fd =3D drm_open_driver(DRIVER_XE);
> > > > @@ -511,6 +577,13 @@ igt_main
> > > >  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
> > > >  			inject_fault_probe(fd, pci_slot, s->name);
> > > >
> > > > +	for (const struct section *s =3D guc_fail_functions; s->name; s++=
)
> > > > +		igt_subtest_f("probe-fail-guc-%s", s->name) {
> > > > +			memcpy(&fault_params, &default_fault_params,
> > > > +					sizeof(struct fault_injection_params));
> > > > +			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> > > > +		}
> > > > +
> > > >  	igt_fixture {
> > > >  		close(sysfs);
> > > >  		drm_close_driver(fd);
> > > > --
> > > > 2.43.0
> > > >
> > > >
> >

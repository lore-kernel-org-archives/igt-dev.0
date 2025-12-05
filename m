Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E64D3748A
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A7A10EB9E;
	Fri,  5 Dec 2025 19:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POKSZxQH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D10410EB9E
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764961964; x=1796497964;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aqN3Vpk76/rIzMRDBFYEeAHz1n3g4nAku/USSPA7msc=;
 b=POKSZxQHiDhdNQEh1atE+c6ojceOnTNORQWqu5p7YOiVTl2W0GADk/+L
 QJfmf/AHZpJTqmRn7QT1iWcOtogonp8NyOkJE6KtMN7NO9Tfv7yxIuIoT
 TP/Vsp9Pm3E4eBdMUvZry7NZAD+hNfIx93/Mhc4toeJK5ZK1AKfqLLAfh
 1CIZkexujooI/OcJPoHsrziMUQltNIOajPRS0442w/wCtYiLdQXhhAPT5
 I1M6Pk5BPdojChe/p/i9HkL+9wCxAO1sV6ESaj1+kJGnpLTNdS53HhE0i
 uozwWkxt5jQbKsSQT7hZelR/13N6726wWRdCHbDfnf8hwE0GZBDzMcUU7 A==;
X-CSE-ConnectionGUID: CZvt14dtQieFpnAVe7tZUQ==
X-CSE-MsgGUID: Zj6/ae5XQ0KH3nUDvWwKcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66886500"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66886500"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:12:43 -0800
X-CSE-ConnectionGUID: /283cE8XRPCkGqbGZqKiYg==
X-CSE-MsgGUID: uV0/U7TxRzSMWKrQgulwsw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:12:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 11:12:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 11:12:43 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 11:12:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqy0+rKvzuUM3YnBim9W7PN2anxlf+P4lrKWFGQNOW7Xgv8w+lkVEE0EuBSW2I9woz85KN1N96EGyADfAXT+hD3fL90HyEKBS3zlPVaMTRIyoVtgGMHKp4HkMCgPlvf9P5xOv2qBFDyL8stWFJmsVDeox3eMRTc8Zb62av8gsVAw6q45eWsqiP8fvcONziVSNU6Uz4yfKg6RB49DwxP0Zvq/nIUfYnK++K+Sa0VUriRk/BOFcn6JCKmxDIzwD/lFqfqgJPygb4HvLLSZ/2FDENOR+QKoqMST24U1iCw78D3wsD1KlC5+uINUGiXDR2RN7fu7K3pplMFoy2kJf1ZogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBnnWNOJLzbwfbgky9dqdS6Gmre1sVRHopJEyjZmW/I=;
 b=gMOmUXbwhgrFWx01u5UETU2L/weVdMtXQm3qpW4xbep68GNaGU3Tw8TvbCP7rKWBeE/LJ2Eu1V8vyB6bciYgL5uSo5+xC9msQzTDlQpnaSebSXAz1gnqJO+9hY8xqpPNfTiNO9YBSdBRpKmTcy1Q7j6Ds8cout1kEKurMohqNQa7+CT3He1gIhaUkC6UQra1ONIjRj6luXu7l7vEc+Uvcc1CBuv4b/31tVNqVgUe628ajJRilDd2Ih0U6WRZwnTyJp/5d3GeI00lGxdE9tlwP7g43DJpT+C97N4LkAyJu/VgCE4OLNDGu+R1P0G/dqSpJFIbNvWLI+PWYh4nX1FKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by BY1PR11MB8125.namprd11.prod.outlook.com (2603:10b6:a03:528::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 19:12:40 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 19:12:38 +0000
Date: Fri, 5 Dec 2025 11:12:35 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 08/19] tests/intel/xe_exec_multi_queue: Add preempt
 mode test
Message-ID: <aTMuoyocc6kkuP-6@nvishwa1-desk>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-29-niranjana.vishwanathapura@intel.com>
 <99eebb0b504f357560c4064778dc9a5342258dc0.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99eebb0b504f357560c4064778dc9a5342258dc0.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|BY1PR11MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2432bc-87ea-400e-18ba-08de343241a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DZYAYDyBRdEt6E5eh2xx+Mf6ThPoUAESj/cfL4TlMAUk4/yN5TJddXgKBj?=
 =?iso-8859-1?Q?nW9RXQSczpGDYlKDX8qJp63ItJDXlVA+y4ybjGkTFTxCoaauG07IE/rdyn?=
 =?iso-8859-1?Q?2i2231dGTx6i8OAzRAoDM26jIklWQ3WlGBhk5vBpl03yFEdXCmFh+EbCWG?=
 =?iso-8859-1?Q?qJrSAIKfrjZCCUbwAEPLazb2Z6liiH9wF3olxVzEpZf7u0mvdiNkYdZ+9O?=
 =?iso-8859-1?Q?4eEt3TphBAFcyrDee68rKa+rYD76VYEtnfobpcm2Vlqbgi60D+prF0BJOC?=
 =?iso-8859-1?Q?2+VfbER7jgZuXq9R8bZ2eLbaKDTNVpKkTzh6UjTUNWdoRFxfANqkAwkR4d?=
 =?iso-8859-1?Q?gQosqPXCoKVvWTtjMFojcSDS5B8QBIX0bpffYGAymb0xmLPVDiTE2Y1a5s?=
 =?iso-8859-1?Q?M2RwzvTnEfLIAmVJA+RJgbtbqt6nA4mG/ep4Y/mzGCMNdwRS3hVAm73Kj/?=
 =?iso-8859-1?Q?wo4ac/IpYTdkBmnN9GgDgVH/MZzRHFS3UG8cQHoS9bKnFxrTDisdCM+Nyr?=
 =?iso-8859-1?Q?3KeeRgBl1HNf1wITIxJgr4jab9+c4+DF2BiXFHiOk14Qf3axF5D9BT80GE?=
 =?iso-8859-1?Q?Ayjd93diN838a6/ShFWeLx14mU1bH84813KZmfIJpNlj5wTpC+IdoM7S3r?=
 =?iso-8859-1?Q?T7dTUR6iWvt73YBcB4u+oeOQ0XRgMHVFYAw0Au3DP4KoadTybVFdZFRxEJ?=
 =?iso-8859-1?Q?bV0maU2JDf3IVUrrw6yMZBWtBVnT1UyYFN5I6EqctOEYoH+h7yq3UJTfqd?=
 =?iso-8859-1?Q?16MxYsA68ZTnEt7ykLfqO7j3f3cYvB53WLr+Q/hOWXjHExc1glVPo408jc?=
 =?iso-8859-1?Q?H1f+sudE3qqFMXqMcErTGMAvFoH2UBPHnrvP3xUKowXw+0ALcUwe7ePkSa?=
 =?iso-8859-1?Q?I+NvG0tLHQZqF5eg7H/X5alw4TXxWW1wyCGkG+8aAmGIcFx/5AUM3AeVn3?=
 =?iso-8859-1?Q?FxPwhOjkAqJc/MZwgqh4GJqx/+uD4UiEVA2KiQJVDMsiEG+05+etyMsZgk?=
 =?iso-8859-1?Q?ClE118lmspadsu8thVLUXvhJ+l5UqhiBJW+8cz6qhQsMOT7n6fBNPpz76Q?=
 =?iso-8859-1?Q?7WRLdFMabzEr/2/P/HcpuYbkMWHRhW0FWuFh3GiQq2QX8RPjeZqc+FMrP9?=
 =?iso-8859-1?Q?xMFC4IECPU2RAmWp1VfHXovRf6eNV8+0GNOZvIy6dEQs8f8PuV8QeLovyd?=
 =?iso-8859-1?Q?Eko6VLArkm3xMCVVPBbn8s9Wn/rZ96u/pMOKM5xIL9asOLIneAeHYGo0b6?=
 =?iso-8859-1?Q?C1iWiZMQ9c0zg4Feglpn/Kg5Sssdc0pzajzXonBj8N3rZULCoTiwkqY2Uh?=
 =?iso-8859-1?Q?zKRL6HVwcD+FCnF3EfwA/ELVuqXCgedHb2FLkqDA/ymsxQYOU3+PNtyTS0?=
 =?iso-8859-1?Q?z6PNcWspc4hKZwJ7qpF3TRsXNA8mP3pa6IP25UR3TKHr1ncu0pgjusVa0C?=
 =?iso-8859-1?Q?TRvWat9TgmbG+iJ/NPWGwNQJyU+/0O1yRUVYVOuUcTIL/KxmyFSDUFxpdO?=
 =?iso-8859-1?Q?5AWU/EnKeprM7dUADRh/wN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?N3UBD672nrUKiArpAX6hAMqqfFOjeqXm4iql13sWztM2tLFPQjgpDNoHHT?=
 =?iso-8859-1?Q?FB0rfl8H3760pwWzCJM5JUyvMcW+0GgNK1ANAUasx/xV3/q1HVBdwS2srn?=
 =?iso-8859-1?Q?UV43bShvreZDiwizup+llNQzQuewYeRs0s+5Y0j5VGz0rVzw/j67zb+JD7?=
 =?iso-8859-1?Q?7D2BC7xjtwG5wAjVo+R7XAFe6lO/npR3eB+TDlCPNoUARaVDc+6Ag4aD4J?=
 =?iso-8859-1?Q?RNjw8JvQU4eyjzPXGmaSxh5wcIFoTnOm3dPcErbDawpGAYOvvrLbOrHT2p?=
 =?iso-8859-1?Q?k8aUWC6XggPypD4qBMvnRbKCnD4dAYpXePNIcLr+gzeOuMGK58bTPvB6JL?=
 =?iso-8859-1?Q?eEWfHkIAAPkq0qXUArQpsE52H9phmDYJs5AzZr52xxPwKlo+LSuo0xC1qG?=
 =?iso-8859-1?Q?taSwaYWE81rp3bBR4mDnLbjqsrjhBRSHbyAECzmNW3FExxDgQvZD1HBJXf?=
 =?iso-8859-1?Q?mTEn6LxxuFFvjgA0jOk11nxq4r1Eb60hEi+uXkZUo0n3Ook0SZysB1XSIl?=
 =?iso-8859-1?Q?13wbc0nNkmBaxTQBSpEPItw3UyGflBMFN/iYxMJXB5+Zgmdjm9JvjU5v8t?=
 =?iso-8859-1?Q?dUKVqRaftVM9J8jNoL71c9+lp0XGj1xTDmL4sZRQXzyEh7rBVjON7Csyl/?=
 =?iso-8859-1?Q?Of/L1AR+1BSe/tG6YKoEGlBJdUk0z2H1CEZ1i3+sFAsmJRAO8q7wyeUExz?=
 =?iso-8859-1?Q?1fnLPMVlQ3EA8yPzTWfpMq9A5F1/ArfSBzAp+lAr+CpumbfMH4O1QJ60tn?=
 =?iso-8859-1?Q?5ljYraFtW0QbeYpHYcH4ayFuzgn35lS363HwabnthYuoiIkgkkWPU3c1lw?=
 =?iso-8859-1?Q?2HMQ9sWc6ORn2l59vXEkoNgjT+py/fk0ZPNSNE7yTa7vv4NRDxWQuPCTEs?=
 =?iso-8859-1?Q?EtAhH47cxKpiEpWMoD5iboZad9jOlFwD/VyqH2OS1Kl/2z+SYA0Kmy7RjX?=
 =?iso-8859-1?Q?59b5HlQb3IOsXHhw5OIQdU3KWkOx8IxUMEhLRyuw+moelP4f1WSeplu27m?=
 =?iso-8859-1?Q?HHLv39t9mc+FMzQXi6leIYhUHVx41Tt6kvNcglpSxxajFP4I6IbTQmJNPH?=
 =?iso-8859-1?Q?LWNtVsnRKka8N1Hvs4cuaif1Vjyq4N3xfipE3ti7a7ZhRSd1vgvV/bqb5s?=
 =?iso-8859-1?Q?nqsFclfIf1+e8MRz6213HA3vmc5ke0ueOA3xBinwSZyI86CTAcI0+zvmOE?=
 =?iso-8859-1?Q?KDERlsCEABXOWAhIvzJTlpReo6Y321mPXLAzNLfksI+0FidsDlayb4ipoF?=
 =?iso-8859-1?Q?IDOSS8rKEuKATFSbqll/0xcBM/TTJipzpRE2tRKTskno2OcnNe5hZJP2aL?=
 =?iso-8859-1?Q?6qrDASbjp9ppvCEz2f9be+P0qYM5iyYsFPZYOGXDcUDn2UR6vitHAjfLMc?=
 =?iso-8859-1?Q?wGVwd9qENKlovtN59UO36jxsErYXcr+6A2lI/KVLPIVCGh0J5fx6PFMRDe?=
 =?iso-8859-1?Q?CKnoW4wP/5pJGyiw1KWnuOvc4qqbsu+/Z01IWil2Dk0RRfmKAGcT07m3sP?=
 =?iso-8859-1?Q?59RmJuvUQRbKCKNBo0WCd3QMr5ym/bpY0ySX1L7RmpH9SC7w8z0i9/V1zW?=
 =?iso-8859-1?Q?20I/DScvcdzeDOZasBHS4UpAQ1/87nSlfnSqC25Jqw07K3S26b4goj0wQn?=
 =?iso-8859-1?Q?S4QzawU6y/SSu7zqMqxxjs5FUblOP1C5hJLbIPcmpbdD2tUHw6+eo59bpv?=
 =?iso-8859-1?Q?tQBZROSD19JZU3X4Lts=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2432bc-87ea-400e-18ba-08de343241a0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 19:12:38.9105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otlFCYkMBF8FLx4JFBJZzdVf5vdZoAjoSag2a5zmXzoA12I1NwmSQ5mmHlIYLWKS2X54+tOtFIbRW2VgfT2IRrnc6LPWOZDHgTOdh40WZ2is2+iI9mXl/BRGm/aJkBpu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8125
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

On Thu, Dec 04, 2025 at 12:52:54PM -0800, Summers, Stuart wrote:
>On Thu, 2025-11-20 at 19:57 -0800, Niranjana Vishwanathapura wrote:
>> Validate multi queue group functionality in preempt mode.
>>
>> v2: Remove simulation related code (Priyanka)
>>     Use BASE_ADDRESS macro for address (Sai)
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 153
>> +++++++++++++++++++++++++++++-
>>  1 file changed, 148 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index fdaaf78c4..1e33c5db8 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -28,6 +28,7 @@
>>  #define USERPTR                        (0x1 << 0)
>>  #define PRIORITY               (0x1 << 1)
>>  #define CLOSE_FD               (0x1 << 2)
>> +#define PREEMPT_MODE           (0x1 << 3)
>>  
>>  #define MAX_INSTANCE 9
>>  
>> @@ -36,7 +37,7 @@
>>  #define BASE_ADDRESS   0x1a0000
>>  
>>  static void
>> -__test_sanity(int fd, int gt, int class)
>> +__test_sanity(int fd, int gt, int class, bool preempt_mode)
>>  {
>>         uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>>         struct drm_xe_ext_set_property multi_queue = {
>> @@ -69,7 +70,7 @@ __test_sanity(int fd, int gt, int class)
>>         if (!n)
>>                 return;
>>  
>> -       vm = xe_vm_create(fd, 0, 0);
>> +       vm = xe_vm_create(fd, preempt_mode ?
>> DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>>  
>>         /* Invalid flags */
>>         while (!invalid_flag)
>> @@ -118,7 +119,7 @@ __test_sanity(int fd, int gt, int class)
>>  
>>         /* Queues in a queue group must share the same address space
>> (vm) */
>>         multi_queue.value = exec_queues[0];
>> -       vm2 = xe_vm_create(fd, 0, 0);
>> +       vm2 = xe_vm_create(fd, preempt_mode ?
>> DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>>         igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext,
>> &val), -EINVAL);
>>         xe_vm_destroy(fd, vm2);
>>  
>> @@ -203,7 +204,137 @@ __test_sanity(int fd, int gt, int class)
>>  static void
>>  test_sanity(int fd, int gt, int class)
>>  {
>> -       __test_sanity(fd, gt, class);
>> +       __test_sanity(fd, gt, class, false);
>> +       __test_sanity(fd, gt, class, true);
>
>I guess it doesn't hurt, but there also shouldn't be anything multi
>queue specific tested between the two modes right? It just seems like
>we're running extra test content here without a benefit - for the
>sanity tests specifically.
>

There is. In preempt mode test, we are testing that KEEP_ACTIVE will
only be supported in FAULT mode (added in a later patch). Besides,
we should sanity test preempt mode also here to ensure KMD doesn't
reject mult-queue creation etc based on mode and other settings.

>> +}
>> +
>> +static void
>> +test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci,
>> int num_placement,
>> +                 int n_exec_queues, int n_execs, unsigned int flags)
>> +{
>
>Is there a reason we can't just combine this with a PREEMPT_MODE flag
>in the "legacy_mode" routine? Most of this is duplicated, and we do the
>same in the sanity tests (assuming we keep them) above.
>

We do that in exec-sanity test which is much simpler. But here we have
multiple sync objects etc and it was resulting in too many if/else
blocks among other changes. So, it made sense to keep them separate.
Other tests like xe_exec_balancer also keeps legacy and preempt mode
tests separate. May be we can revisit later to check all tradeoffs?

Niranjana

>Thanks,
>Stuart
>
>> +#define USER_FENCE_VALUE       0xdeadbeefdeadbeefull
>> +       struct drm_xe_sync sync = {
>> +               .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +               .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +               .timeline_value = USER_FENCE_VALUE,
>> +       };
>> +       struct drm_xe_exec exec = {
>> +               .num_batch_buffer = 1,
>> +               .num_syncs = 1,
>> +               .syncs = to_user_pointer(&sync),
>> +       };
>> +       uint32_t vm;
>> +       uint64_t addr = BASE_ADDRESS;
>> +       uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>> +       int64_t fence_timeout = NSEC_PER_SEC;
>> +       uint64_t vm_sync = 0;
>> +       size_t bo_size;
>> +       uint32_t bo = 0;
>> +       struct {
>> +               uint32_t batch[16];
>> +               uint64_t pad;
>> +               uint64_t exec_sync;
>> +               uint32_t data;
>> +       } *data;
>> +       int i, b;
>> +
>> +       if (flags & CLOSE_FD)
>> +               fd = drm_open_driver(DRIVER_XE);
>> +
>> +       igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>> +       vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +       bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
>> +
>> +       if (flags & USERPTR) {
>> +               data = aligned_alloc(xe_get_default_alignment(fd),
>> bo_size);
>> +               igt_assert(data);
>> +
>> +               memset(data, 0, bo_size);
>> +       } else {
>> +               bo = xe_bo_create(fd, vm, bo_size,
>> vram_if_possible(fd, eci[0].gt_id),
>> +                                
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +               data = xe_bo_map(fd, bo, bo_size);
>> +       }
>> +
>> +       for (i = 0; i < n_exec_queues; i++) {
>> +               struct drm_xe_ext_set_property multi_queue = {
>> +                       .base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +                       .property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> +               };
>> +               struct drm_xe_ext_set_property mq_priority = {
>> +                       .base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +                       .property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>> +               };
>> +               uint64_t ext = to_user_pointer(&multi_queue);
>> +
>> +               if (flags & PRIORITY) {
>> +                       multi_queue.base.next_extension =
>> to_user_pointer(&mq_priority);
>> +                       mq_priority.value =
>> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
>> +               }
>> +
>> +               multi_queue.value = i ? exec_queues[0] :
>> DRM_XE_MULTI_GROUP_CREATE;
>> +               igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
>> num_placement, eci,
>> +                                                    ext,
>> &exec_queues[i]), 0);
>> +       };
>> +
>> +       sync.addr = to_user_pointer(&vm_sync);
>> +       if (bo)
>> +               xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size,
>> &sync, 1);
>> +       else
>> +               xe_vm_bind_userptr_async(fd, vm, 0,
>> to_user_pointer(data),
>> +                                        addr, bo_size, &sync, 1);
>> +
>> +       xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>> fence_timeout);
>> +       vm_sync = 0;
>> +
>> +       for (i = 0; i < n_execs; i++) {
>> +               uint64_t batch_offset = (char *)&data[i].batch -
>> (char *)data;
>> +               uint64_t batch_addr = addr + batch_offset;
>> +               uint64_t sdi_offset = (char *)&data[i].data - (char
>> *)data;
>> +               uint64_t sdi_addr = addr + sdi_offset;
>> +               int e = i % n_exec_queues;
>> +
>> +               b = 0;
>> +               data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +               data[i].batch[b++] = sdi_addr;
>> +               data[i].batch[b++] = sdi_addr >> 32;
>> +               data[i].batch[b++] = 0xc0ffee;
>> +               data[i].batch[b++] = MI_BATCH_BUFFER_END;
>> +               igt_assert(b <= ARRAY_SIZE(data[i].batch));
>> +
>> +               sync.addr = addr + (char *)&data[i].exec_sync - (char
>> *)data;
>> +
>> +               exec.exec_queue_id = exec_queues[e];
>> +               exec.address = batch_addr;
>> +               xe_exec(fd, &exec);
>> +       }
>> +
>> +       for (i = 0; i < n_execs; i++)
>> +               xe_wait_ufence(fd, &data[i].exec_sync,
>> USER_FENCE_VALUE,
>> +                              exec_queues[i % n_exec_queues],
>> fence_timeout);
>> +
>> +       sync.addr = to_user_pointer(&vm_sync);
>> +       xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
>> +       xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>> fence_timeout);
>> +
>> +       for (i = 0; i < n_execs; i++)
>> +               igt_assert_eq(data[i].data, 0xc0ffee);
>> +
>> +       if (!(flags & CLOSE_FD))
>> +               for (i = 0; i < n_exec_queues; i++)
>> +                       xe_exec_queue_destroy(fd, exec_queues[i]);
>> +
>> +       if (bo) {
>> +               munmap(data, bo_size);
>> +               gem_close(fd, bo);
>> +       } else {
>> +               free(data);
>> +       }
>> +
>> +       if (!(flags & CLOSE_FD))
>> +               xe_vm_destroy(fd, vm);
>> +       else
>> +               drm_close_driver(fd);
>>  }
>>  
>>  static void
>> @@ -375,12 +506,19 @@ test_legacy_mode(int fd, struct
>> drm_xe_engine_class_instance *eci, int num_place
>>   * @userptr:                                   userptr
>>   * @priority:                                  priority
>>   * @close-fd:                                  close fd without
>> destroying exec queues
>> + * @preempt-mode-basic:                                preempt-mode
>> basic
>> + * @preempt-mode-userptr:                      preempt-mode userptr
>> + * @preempt-mode-priority:                     preempt-mode priority
>> + * @preempt-mode-close-fd:                     preempt-mode close fd
>> without destroying exec queues
>>   */
>>  static void
>>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
>> num_placement,
>>           int n_exec_queues, int n_execs, unsigned int flags)
>>  {
>> -       test_legacy_mode(fd, eci, num_placement, n_exec_queues,
>> n_execs, flags);
>> +       if (flags & PREEMPT_MODE)
>> +               test_preempt_mode(fd, eci, num_placement,
>> n_exec_queues, n_execs, flags);
>> +       else
>> +               test_legacy_mode(fd, eci, num_placement,
>> n_exec_queues, n_execs, flags);
>>  }
>>  
>>  /**
>> @@ -404,6 +542,7 @@ test_exec_virtual(int fd, int gt, int class)
>>         igt_assert(n);
>>  
>>         test_exec(fd, eci, n, n, n, 0);
>> +       test_exec(fd, eci, n, n, n, PREEMPT_MODE);
>>  }
>>  
>>  igt_main
>> @@ -417,6 +556,10 @@ igt_main
>>                 { "userptr", USERPTR },
>>                 { "priority", PRIORITY },
>>                 { "close-fd", CLOSE_FD },
>> +               { "preempt-mode-basic", PREEMPT_MODE },
>> +               { "preempt-mode-userptr", PREEMPT_MODE | USERPTR },
>> +               { "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
>> +               { "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
>>                 { NULL },
>>         };
>>         int fd, gt, class;
>

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED1D10E046
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 13:48:10 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Garg, Nemesa" <nemesa.garg@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
In-Reply-To: <423b2282-d63d-4e6f-ae2f-4c490a7390be@intel.com>
References: <20231212090841.2060493-1-chaitanya.kumar.borah@intel.com>
 <c3cae6fc-8a97-4abd-9918-bba55c1757ca@gmail.com>
 <DM4PR11MB614147FFF506542FADD01654B98CA@DM4PR11MB6141.namprd11.prod.outlook.com>
 <20231214143628.xyisz4tovwg3jjo2@kamilkon-desk.igk.intel.com>
 <SJ1PR11MB61292ABDFB706F233E749456B990A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20231218161918.dj4b5zqdzwogdbkg@kamilkon-desk.igk.intel.com>
 <SJ1PR11MB6129BD2C80EB786A916F0A09B997A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20231219070042.l5yhwd6lmoe7chvn@kamilkon-desk.igk.intel.com>
 <7297abc4-309a-4ca8-a606-498b3abd0c2a@intel.com>
 <87plyfykqo.fsf@intel.com>
 <423b2282-d63d-4e6f-ae2f-4c490a7390be@intel.com>
Date: Fri, 05 Jan 2024 15:47:57 +0200
Message-ID: <87mstjyjqq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 05 Jan 2024, Lionel Landwerlin <lionel.g.landwerlin@intel.com> wrote:
> On 05/01/2024 15:26, Jani Nikula wrote:
>> On Fri, 22 Dec 2023, Lionel Landwerlin <lionel.g.landwerlin@intel.com> wrote:
>>> The reason we need to differentiate GT2/GT3 skus is that they require a
>>> different programming to get performance metrics.
>> Please explain why this isn't abstracted in the kernel, and why this
>> needs PCI ID level identification in userspace.
>>
>> BR,
>> Jani.
>
>
> You want us to elaborate on "require a different programming" ?

My emphasis was on "abstracted in the kernel", and I was kind of quickly
asking Explain Like I'm Five.

Now I looked at the xml and codegen under lib/i915/perf-configs, and
kind of figured why this isn't abstracted in the kernel. :p

Never mind.


BR,
Jani.


-- 
Jani Nikula, Intel

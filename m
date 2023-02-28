Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340EB10E4F2
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Feb 2023 15:10:56 +0000 (UTC)
Date: Tue, 28 Feb 2023 07:08:52 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230228150852.6jhwxigitk7rhfx7@ldmartin-desk2.lan>
References: <20230224104443.62373-1-zbigniew.kempczynski@intel.com>
 <20230224104443.62373-2-zbigniew.kempczynski@intel.com>
 <b2b782a7-d7ef-d20a-998b-745bcf72f2f7@intel.com>
 <20230228082543.7brsu5glv3p3rxdw@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228082543.7brsu5glv3p3rxdw@zkempczy-mobl2>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/8] drm-uapi/xe_drm: Add Xe uAPI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 09:25:43AM +0100, Zbigniew Kempczyński wrote:
>On Fri, Feb 24, 2023 at 06:57:52PM +0100, Michal Wajdeczko wrote:
>>
>>
>> On 24.02.2023 11:44, Zbigniew Kempczyński wrote:
>> > Introduce uAPI contract for Xe IGT.
>> >
>> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > Signed-off-by: Philippe Lecluse <philippe.lecluse@intel.com>
>> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> > ---
>> >  include/drm-uapi/xe_drm.h | 807 ++++++++++++++++++++++++++++++++++++++
>> >  1 file changed, 807 insertions(+)
>> >  create mode 100644 include/drm-uapi/xe_drm.h
>>
>> is it really necessary to copy this buggy header to IGT right now?
>>
>> maybe we can wait until this header will be properly reviewed and
>> cleaned up in the kernel repo first ?
>
>+Lucas
>
>We discussed yesterday about this header - from IGT perspective it
>is not a blocker, after fixing in xe kernel we'll copy it here.
>Xe-igt repository had sense during early development stage, but now
>we want to migrate it here. Code still requires fixups and cleanup
>but we may do it here. Otherwise workflow would require sending to
>igt ml (squashed patches with some of them removed [kunit]), then
>fixup to xe-igt and repeat squash/send. Very time consuming we want
>to avoid. Fixing that later in igt is acceptable for us as xe driver
>is not production ready.

yep, any fix to this file should be done in the kernel side. igt only
copies this file so it doesn't depend on any kernel-headers package.

The obvious issues I see are in the comments/docs where we have
leftovers from i915. Michal, is this what you are referring to or there
is something else?  If you can send a patch cleaning that up or creating
an issue in gitlab it would be appreciated


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

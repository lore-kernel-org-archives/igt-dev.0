Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFF010E569
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 13:40:17 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>, Petri Latvala
 <petri.latvala@intel.com>
In-Reply-To: <4ce3234e-493b-8ee9-07b8-148be2a9e917@amd.com>
References: <20220131142818.2686782-1-Rodrigo.Siqueira@amd.com>
 <20220131142818.2686782-2-Rodrigo.Siqueira@amd.com>
 <Yfu2nPEIQQT+6l/t@platvala-desk.ger.corp.intel.com>
 <3af10091-6a1f-0d13-944f-7f7833837e1e@amd.com> <87sfsurh88.fsf@intel.com>
 <Yh9eYotWmjBpgTgO@platvala-desk.ger.corp.intel.com>
 <87bkyo5x86.fsf@intel.com> <4ce3234e-493b-8ee9-07b8-148be2a9e917@amd.com>
Date: Wed, 16 Mar 2022 15:39:54 +0200
Message-ID: <8735jinhhx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [igt-dev] [RFC i-g-t 1/1] MAINTAINERS: Introduce MAINTAINERS
 file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>, igt-dev@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 16 Mar 2022, Rodrigo Siqueira Jordao <rjordrigo@amd.com> wrote:
> On 2022-03-02 07:56, Jani Nikula wrote:
>> On Wed, 02 Mar 2022, Petri Latvala <petri.latvala@intel.com> wrote:
>>> On Mon, Feb 07, 2022 at 02:31:03PM +0200, Jani Nikula wrote:
>>>> FWIW, if I were to do this, I'd do it in yaml and implement it in
>>>> python+strictyaml with a schema. No need to import a monster perl parser
>>>> from kernel or implement our own.
>>>
>>> I really like this suggestion. The perl script from kernel is
>>> completely overkill for IGT purposes where it would be mostly (or
>>> 100%) used to collect Cc fields to patches for people volunteering for
>>> doing review.
>> 
>> Last week I hacked a bit on what my suggestion would look like, but
>> decided I really don't have time for this. Anyway, attached is what I
>> put together in less than an hour in case anyone wants to pick it up
>> from here.
>> 
>> You'll need strictyaml and whatthepatch from pip. The latter could
>> perhaps be replaced with something better but it fit the bill now and it
>> took only minutes to start using. Using strictyaml with a schema is a
>> really powerful tool here.
>> 
>> Put the attachments in igt root (they're not even patches, sorry), and
>> try:
>> 
>> $ ./maintainers.py some-igt.patch
>> 
>> The MAINTAINERS used here is just a conversion from some earlier patch,
>> don't put too much weight on the content, rather the format.
>> 
>> BR,
>> Jani.
>> 
>> 
>
> Hi Jani,
>
> I'm inclined to avoid creating an IGT-specific solution because we will 
> need to maintain it, which will add more effort for IGT developers 
> (manage dependencies, bugs, etc.). However, I also agree that copy & 
> paste other people's code will end up in a similar issue; for this 
> reason, I suggested a different approach in the second patch of the 
> following patchset:
>
>   https://patchwork.freedesktop.org/series/99534/
>
> Instead of copying the get_maintainers script to IGT, I created a thin 
> layer that automatically downloads get_maintainers and invokes it with a 
> few options. What do you think about this approach?

In the end, it's all up to the IGT maintainers, what they think is the
most sensible option, and what they're willing to take on. It's not up
to me, I'm just offering my opinion, and even some code to support that
opinion.

Re-using kernel's get_maintainer.pl also has a non-zero maintenance
effort related to it. Upstream does not support using get_maintainer.pl
even for downstream kernel forks (*), let alone non-kernel
projects. It's not a general purpose tool. If you hit problems with it,
you get to debug a monster perl script *and* the shell script to use
it. And then potentially work around the issues in IGT because upstream
doesn't care.


BR,
Jani.


(*) I've tried submitting changes to that effect.

-- 
Jani Nikula, Intel Open Source Graphics Center

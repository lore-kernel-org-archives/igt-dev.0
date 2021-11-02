Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2640E734ED
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Nov 2021 17:54:46 +0000 (UTC)
Date: Tue, 2 Nov 2021 19:47:31 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <1832032.GKX7oQKdZx@jkrzyszt-mobl1.ger.corp.intel.com>
Message-ID: <alpine.DEB.2.22.394.2111021831570.3554566@eliteleevi.tm.intel.com>
References: <20211101165543.467308-1-kai.vehmanen@linux.intel.com>
 <1832032.GKX7oQKdZx@jkrzyszt-mobl1.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: Re: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: apply audio
 unload for all i915 hw
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On Tue, 2 Nov 2021, Janusz Krzysztofik wrote:

> On Monday, 1 November 2021 17:55:43 CET Kai Vehmanen wrote:
>> The HDA audio driver does not support dynamic hotplug of a HDA codec and
>> that applies also to the display HDA codec.
> 
> Before any workaround was introduced to this test, it was triggering a kernel 
> WARN / taint on i915 unbind, but only on selected platforms.  Since the test 
> was included into BAT scope, it was affecting badly significant parts of BAT 
> runs, reducing their test coverage.  To make the test mode friendly to BAT 

ack. This issue surfaced on platforms like DG1 where audio controller is 
on the GPU. Audio driver doesn't support i915 dynamically disappearing, 
and in case of these hw, failure was easy to hit. 

> advice.  Now your change extends the scope of the current workaround over all 
> platforms.  Why do you think we should unload the audio driver on all possible 
> platforms, even on those which didn't suffer from the original issue?  Can we 

Even if the symptoms are less severe, the fundamental problem remains. 
The HDA audio driver is not designed to handle individual codecs (display 
audio is one of possibly many codecs) disappearing in hotplug fashion. 
Audio stack does support hotplug for USB and Firewire, but not for 
individual HDA codecs. This makes sense as the hardware connections are 
fixed for HDA.

So this creates unnecessary fragility to the test. If any entity in the 
system uses the audio controller during the i-g-t test, the test can fail 
-- either a warning about dangling wakeref or something worse. If a 
distribution changes runtime suspend defaults for audio controller, you 
will get different results. And you need to maintain a list of PCI IDs 
where the controller is part of the display hardware (and yo must do the 
unload).

If we always unload:
   - if audio is used by some application -> test is skipped with igt_skip()
   - as audio driver us unloaded, no application can start using audio 
     while test is running -> more predictable test runs

> approach.  Can we define exact conditions under which the audio driver should 
> be unloaded before i915 unbind and how a test can detect those conditions? 

I'd say currently the reverse is easier -- if i915 has audio capability, 
audio driver should be unloaded. And given the priv.snd_unload==true is a 
no-op on systems with no display audio capability, this simple 
approach seems to do the job.

I don't say this is perfect, but this would be a more stable baseline
to build on.

Br, Kai

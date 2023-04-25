Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD8B10E645
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 03:41:33 +0000 (UTC)
Date: Tue, 25 Apr 2023 05:41:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Karas, Anna" <anna.karas@intel.com>
Message-ID: <20230425034128.5mlja5swixptupui@zkempczy-mobl2>
References: <20230420191454.497237-1-anna.karas@intel.com>
 <e45eac2d1c40ed492887d96020d361c179706c6f.camel@intel.com>
 <52df5972-846b-1886-80eb-bfb1961bd877@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52df5972-846b-1886-80eb-bfb1961bd877@intel.com>
Subject: Re: [igt-dev] [RFC 0/2] lib/xe_gpu: Introduce xe_gpu library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 01:38:01PM +0200, Karas, Anna wrote:
> Hi all,
> CC-ing Mauro, Matthew and Zbyszek to this thread (btw. sorry for using
> @intel.com instead of @linux.intel.com in the original email)
> 
> @all - folks, any thoughts on opens? :)
> 
> On 20.04.2023 22:38, Souza, Jose wrote:
> > On Thu, 2023-04-20 at 21:14 +0200, Anna Karas wrote:
> > > OPENS:
> > > 1. Lack of wedged concept in XE: @Matthew informed me that there is no
> > > intent to have reporting wedged device in XE. However, @Joonas believes
> > > that it may be useful - "it's used at least in specific diagnostics and
> > > hardware repair flows for PVC and FLR for all platforms, where we
> > > prevent further accesses to the hardware. So an alternative mechanism is
> > > needed for those". Since xe_require_gpu() is a direct port of i915's
> > > igt_require_gem() stripped of wedged device reporting, this could be a
> > > good opportunity to discuss this.
> > 
> > I guess you could create a Xe engine, submit NOPs and check for XE_ENGINE_GET_PROPERTY_BAN to detect if GPU is wedged.
> > 
> 
> @Jose - It seems that this may help here, thanks
> 
> On 21.04.2023 09:56, Zbigniew Kempczyński wrote:
> >> +int xe_reopen_driver(int fd)
> >> +{
> >> +	char path[256];
> >> +
> >> +	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
> >> +	fd = open(path, O_RDWR);
> >> +	igt_assert_fd(fd);
> >> +
> >> +	return fd;
> >> +}
> >
> > On quick first look:
> >
> > Duplicates gem_reopen_driver() code, maybe just replace 'i915' to 'fd'
> > there?
> >
> > --
> > Zbigniew
> 
> @Zbyszek - I agree. gem_reopen_driver() is currently placed in lib/i915,
> would it be a good idea to move it (as "drm_reopen_driver()", with 'i915'
> replaced with 'fd') to lib/drmtest.c?

Yes, looks reasonable. Go ahead.

--
Zbigniew


> 
> Ania

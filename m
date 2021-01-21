Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <7c9e9e4545e7195f8f96ff352548eee63d6c3c7d.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 21 Jan 2021 09:48:17 +0100
In-Reply-To: <7ac828ba904e3fc4153f5aa8041bfcf79128407b.camel@linux.intel.com>
References: <20210119084257.25552-1-janusz.krzysztofik@linux.intel.com>
 <7ac828ba904e3fc4153f5aa8041bfcf79128407b.camel@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/core_hotunplug:
 Reduce debug noise on stdout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 2021-01-19 at 12:08 +0100, Marcin Bernatowicz wrote:
> On Tue, 2021-01-19 at 09:42 +0100, Janusz Krzysztofik wrote:
> > Since igt_fixture sections are processed unconditionally regardless
> > of
> > which subtest has been requested, they can now emit a lot of
> > unrelated
> > debug messages which can make the picture less clear.  Avoid emitting
> > those messages from outside igt_subtest sections.
> > 
> > Move device close status prerequisite checks from igt_fixture
> > sections
> > into subtest execution paths.  For simplicity, pass any device close
> > errors, including those from health checks, to next sections via a
> > single .fd.drm data structure field.
> > 
> > Moreover, postpone initial device health check until first actually
> > selected subtest is started.  In order to let that subtest skip on
> > unsuccessful initial health check, not fail, move the decision
> > whether
> > to fail or skip on error from the health check helper to its users.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com
> > ...
> Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Thank you Marcin.

CI results with no false positives finally collected after a few re-
runs, so pushed.

Thanks,
Janusz

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

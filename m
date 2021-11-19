Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Fri, 19 Nov 2021 17:41:08 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZfFlI/cB2OyXZeE@platvala-desk.ger.corp.intel.com>
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
 <20211119125945.55056-3-tvrtko.ursulin@linux.intel.com>
 <YZesawet06wfQ1SG@platvala-desk.ger.corp.intel.com>
 <8b1bdb41-fe31-8482-655d-724a6937d2c7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b1bdb41-fe31-8482-655d-724a6937d2c7@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t 3/6] igt/core: Fix build warning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 03:34:54PM +0000, Tvrtko Ursulin wrote:
> 
> On 19/11/2021 13:53, Petri Latvala wrote:
> > On Fri, Nov 19, 2021 at 12:59:42PM +0000, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > .../lib/igt_thread.c: In function ‘__igt_unique____igt_constructor_l66’:
> > > .../lib/igt_thread.c:68:9: warning: ‘pthread_setspecific’ expecting 1 byte in a region of size 0 [-Wstringop-overread]
> > >     68 |         pthread_setspecific(__igt_is_main_thread, (void*) 0x1);
> > >        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > ---
> > >   lib/igt_core.c   | 6 ++++--
> > >   lib/igt_thread.c | 4 +++-
> > >   2 files changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > > index ec05535cd56e..acb9743c4a24 100644
> > > --- a/lib/igt_core.c
> > > +++ b/lib/igt_core.c
> > > @@ -2752,6 +2752,8 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
> > >   	char *line, *formatted_line;
> > >   	char *thread_id;
> > >   	const char *program_name;
> > > +	const uintptr_t false_key = 0;
> > > +	const uintptr_t true_key = 1;
> > >   	const char *igt_log_level_str[] = {
> > >   		"DEBUG",
> > >   		"INFO",
> > > @@ -2796,9 +2798,9 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
> > >   	}
> > >   	if (line[strlen(line) - 1] == '\n')
> > > -		pthread_setspecific(__vlog_line_continuation, (void*) false);
> > > +		pthread_setspecific(__vlog_line_continuation, &false_key);
> > >   	else
> > > -		pthread_setspecific(__vlog_line_continuation, (void*) true);
> > > +		pthread_setspecific(__vlog_line_continuation, &true_key);
> > 
> > Quoting the usage of this:
> >          if (pthread_getspecific(__vlog_line_continuation)) {
> > 
> > That's going to give a non-null pointer in both cases.
> 
> Doh..
> 
> > 
> > 
> > 
> > >   	/* append log buffer */
> > >   	_igt_log_buffer_append(formatted_line);
> > > diff --git a/lib/igt_thread.c b/lib/igt_thread.c
> > > index 5bdda4102def..f5de2d57eaaa 100644
> > > --- a/lib/igt_thread.c
> > > +++ b/lib/igt_thread.c
> > > @@ -64,6 +64,8 @@ bool igt_thread_is_main(void)
> > >   }
> > >   igt_constructor {
> > > +	const uintptr_t key = 1;
> > > +
> > >   	pthread_key_create(&__igt_is_main_thread, NULL);
> > > -	pthread_setspecific(__igt_is_main_thread, (void*) 0x1);
> > > +	pthread_setspecific(__igt_is_main_thread, &key);
> > 
> > This is fine, __igt_is_main_thread key will have non-null only on the
> > main thread. But still a bit sus slapping the address of a
> > function-local variable to setspecific, we might just be trading a
> > compiler warning for a new future one.
> 
> And this is then the same - why do you say this one is okay? :)

Because setspecific for this key is called from only one thread so it
kinda works.


-- 
Petri Latvala

> 
> Okay I wasn't sufficiently focused while trying to fix this. No idea then
> apart for playing with pragmas.
> 
> Regards,
> 
> Tvrtko

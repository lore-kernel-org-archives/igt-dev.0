Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Tue, 31 Jan 2023 15:14:38 +0100
Message-ID: <2675650.mvXUDI8C0e@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <20230131115910.rk4yyli7i7rbvqee@kamilkon-desk1>
References: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
 <20230131091731.5892-2-janusz.krzysztofik@linux.intel.com>
 <20230131115910.rk4yyli7i7rbvqee@kamilkon-desk1>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/perf: Stress opening of new
 perf streams against existing contexts
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

Thanks for review.

On Tuesday, 31 January 2023 12:59:10 CET Kamil Konieczny wrote:
...
> > @@ -5259,6 +5324,15 @@ igt_main
> >  	igt_subtest("whitelisted-registers-userspace-config")
> >  		test_whitelisted_registers_userspace_config();
> >  
> 
> Please add description to new test.

Sure, please expect v2 with this fixed.

Thanks,
Janusz

